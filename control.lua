_G.gui_events = {
	[defines.events.on_gui_click] = {},
	[defines.events.on_gui_confirmed] = {},
	[defines.events.on_gui_text_changed] = {},
	[defines.events.on_gui_checked_state_changed] = {},
	[defines.events.on_gui_selection_state_changed] = {},
	[defines.events.on_gui_checked_state_changed] = {},
	[defines.events.on_gui_elem_changed] = {},
	[defines.events.on_gui_value_changed] = {},
	[defines.events.on_gui_location_changed] = {},
	[defines.events.on_gui_selected_tab_changed] = {},
	[defines.events.on_gui_switch_state_changed] = {}
}
local function process_gui_event(event)
	if event.element and event.element.valid then
		for pattern, f in pairs(gui_events[event.name]) do
			if event.element.name:match(pattern) then f(event); return end
		end
	end
end
for event, _ in pairs(gui_events) do
	script.on_event(event, process_gui_event)
end

--Set up default MOD global variables
MOD = {}
MOD.name = 'pycoalprocessing'
MOD.fullname = 'PyCoalProcessing'
MOD.IF = 'PYC'
MOD.path = '__pycoalprocessing__'
MOD.config = require('config')

require 'scripts.wiki.wiki'
require 'scripts.wiki.text-pages'
require 'scripts.wiki.spreadsheet-pages'
require 'scripts.wiki.statistics-page'

require 'scripts.tailings-pond'
require 'scripts.beacons'
require 'scripts.inserters'

local function init()
	Beacons.events.init()
	Wiki.events.init()
	Pond.events.init()
	Spreadsheet.events.init()
end

script.on_configuration_changed(init)
script.on_init(function()
	init()
	for _, interface in pairs{'silo_script', 'better-victory-screen'} do
		if remote.interfaces[interface] and remote.interfaces[interface]['set_no_victory'] then
			remote.call(interface, 'set_no_victory', true)
		end
	end
	
	if remote.interfaces['freeplay'] then
		local created_items = remote.call('freeplay', 'get_created_items')
		created_items['burner-mining-drill'] = 10
		remote.call('freeplay', 'set_created_items', created_items)

		local debris_items = remote.call('freeplay', 'get_debris_items')
		debris_items['iron-plate'] = 100
		debris_items['copper-plate'] = 50
		remote.call('freeplay', 'set_debris_items', debris_items)
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	if global.finished then return end
	local tech = event.research
	if tech.name == 'pyrrhic' and game.tick ~= 0 then
		local force = tech.force
		for _, player in pairs(game.connected_players) do
			if player.force == force then player.opened = nil end
		end

		global.finished = true
		if remote.interfaces['better-victory-screen'] and remote.interfaces['better-victory-screen']['trigger_victory'] then
			remote.call('better-victory-screen', 'trigger_victory', force)
		else
			game.set_game_state{
				game_finished = true,
				player_won = true,
				can_continue = true,
				victorious_force = force
			}
		end
	end
end)

script.on_event({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}, function(event)
	Inserters.events.on_built(event)
	Beacons.events.on_built(event)
	Pond.events.on_built(event)
end)

script.on_event({defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity, defines.events.script_raised_destroy},
	Beacons.events.on_destroyed
)

script.on_event(defines.events.on_entity_died, function(event)
	Pond.events.on_entity_died(event)
	Beacons.events.on_destroyed(event)
end)

script.on_event(defines.events.on_gui_opened, function(event)
	Beacons.events.on_gui_opened(event)
end)

script.on_event({defines.events.on_gui_closed, defines.events.on_player_changed_surface}, function(event)
	Wiki.events.on_gui_closed(event)
end)

script.on_event(defines.events.on_player_created, Wiki.events.on_player_created)

script.on_nth_tick(153, Pond.events[153])
script.on_nth_tick(154, Pond.events[154])

-- grumble grumble filters apply for the whole mod
for _, event in pairs({defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}) do
	script.set_event_filter(event, {
		{
			filter = 'name',
			name = 'inserter'
		},
		{
			filter = 'name',
			name = 'burner-inserter'
		},
		{
			filter = 'name',
			name = 'fast-inserter'
		},
		{
			filter = 'name',
			name = 'long-handed-inserter'
		},
		{
			filter = 'name',
			name = 'stack-inserter'
		},
		{
			filter = 'type',
			type = 'inserter',
			mode = 'and'
		},
		{
			filter = 'type',
			type = 'storage-tank',
			mode = 'or'
		},
		{
			filter = 'name',
			name = 'tailings-pond',
			mode = 'and'
		},
		{
			filter = 'type',
			type = 'beacon',
			mode = 'or'
		},
		{
			filter = 'crafting-machine',
			--type = 'beacon',
			mode = 'or'
		}
	})
end