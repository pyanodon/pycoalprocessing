local Event = require('__stdlib__/stdlib/event/event')

--Set up default MOD global variables
MOD = {}
MOD.name = 'pycoalprocessing'
MOD.fullname = 'PyCoalProcessing'
MOD.IF = 'PYC'
MOD.path = '__pycoalprocessing__'
MOD.config = require('config')

Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}
Event.death_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

--Activate any scripts needed.
require('scripts/tailings-pond')
require('scripts/wiki/wiki')
require('scripts/wiki/text-pages')
require('scripts/wiki/spreadsheet-pages')
require('scripts/wiki/statistics-page')

--Add in our remote interfaces
remote.add_interface(script.mod_name, require('__stdlib__/stdlib/scripts/interface'))

Event.register(Event.core_events.init, function()
	if remote.interfaces['freeplay'] then
		local created_items = remote.call('freeplay', 'get_created_items')
		created_items['burner-mining-drill'] = 10
		remote.call('freeplay', 'set_created_items', created_items)

		local debris_items = remote.call('freeplay', 'get_debris_items')
		debris_items['iron-plate'] = 100
		debris_items['copper-plate'] = 50
		remote.call('freeplay', 'set_debris_items', debris_items)
	end

	if remote.interfaces['silo_script'] then
		remote.call('silo_script', 'set_no_victory', true)
	end
end)

Event.register(defines.events.on_research_finished, function(event)
	local tech = event.research
	if tech.name == 'pyrrhic' and game.tick ~= 0 then
		local force = tech.force
		for _, player in pairs(game.connected_players) do
			if player.force == force then player.opened = nil end
		end
		game.set_game_state{
			game_finished = true,
			player_won = true,
			can_continue = true,
			victorious_force = force
		}
	end
end)

Event.register(Event.build_events, function(event)
	local inserter = event.created_entity
	if inserter.type ~= 'inserter' then return end
	if inserter.get_control_behavior()
		or next(inserter.circuit_connected_entities.red)
		or next(inserter.circuit_connected_entities.green)
		or inserter.get_filter(1)
	then
		return
	end
	inserter.inserter_filter_mode = 'blacklist'
end)

-- grumble grumble filters apply for the whole mod
for _, event in pairs(Event.build_events) do
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
		}
	})
end