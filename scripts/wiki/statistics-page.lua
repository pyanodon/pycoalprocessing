local Event = require('__stdlib__/stdlib/event/event')

local discord = 'https://discord.gg/SBHM3h5Utj'
local patreon = 'https://www.patreon.com/pyanodon'

local science_pack_names = {
	['automation-science-pack'] = true,
	['py-science-pack-1'] = true,
	['logistic-science-pack'] = true,
	['military-science-pack'] = true,
	['py-science-pack-2'] = true,
	['chemical-science-pack'] = true,
	['py-science-pack-3'] = true,
	['production-science-pack'] = true,
	['py-science-pack-4'] = true,
	['utility-science-pack'] = true,
	['space-science-pack'] = true,
}

local animals = {
    'auog',
    'ulric',
    'mukmoux',
    'arthurian',
    'cottongut',
    'dhilmos',
    'scrondrix',
    'phadai',
    'fish',
    'phagnot',
    'kmauts',
    'dingrits',
    'xeno',
    'arqad',
    'cridren',
    'antelope',
    'trits',
    'vonix',
    'vrauks',
    'xyhiphoe',
    'zipir',
    'korlex',
    'simik',
}

local voiding_buildings = {
	"py-sinkhole",
	"py-burner",
	"py-gas-vent",
	"tailings-pond", -- why is this not called "py-tailings-pond" ?
}

if script.active_mods['pyalternativeenergy'] then
    table.insert(animals, 'zungror')
    table.insert(animals, 'numal')
end

local creature_names = {}
for _, animal in pairs(animals) do
	creature_names[animal] = true
	creature_names[animal..'-mk01'] = true
	creature_names[animal..'-mk02'] = true
	creature_names[animal..'-mk03'] = true
	creature_names[animal..'-mk04'] = true
end
animals = nil

local function comma_value(n)
	local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

local floor = math.floor
local function calculate_statistics(player, include_laggy_calculations)
	local surface = player.surface
	local force = player.force

	local statistics = {}

	local player_index = player.index
	local count_voiding_buildings = settings.get_player_settings(player_index)["count-voiding-buildings"].value
	local count_all_buildings_on_all_surfaces = settings.get_player_settings(player_index)["count-all-buildings-on-all-surfaces"].value

	statistics.hour = floor(game.tick / 60 / 60 / 60)
	statistics.minute = floor(game.tick / 60 / 60) % 60
	if statistics.minute < 10 then statistics.minute = '0'..statistics.minute end
	statistics.second = floor(game.tick / 60) % 60
	if statistics.second < 10 then statistics.second = '0'..statistics.second end

	local daytime = surface.daytime * 24
	statistics.daytime_hour = floor(daytime)
	statistics.daytime_minute = floor(daytime * 60) % 60
	if statistics.daytime_minute < 10 then statistics.daytime_minute = '0'..statistics.daytime_minute end
	if statistics.daytime_hour == 24 then
		statistics.daytime_hour = 0
		statistics.am_pm = 'AM'
	elseif statistics.daytime_hour == 12 then
		statistics.am_pm = 'PM'
	elseif statistics.daytime_hour > 12 then
		statistics.daytime_hour = statistics.daytime_hour - 12
		statistics.am_pm = 'PM'
	else
		statistics.am_pm = 'AM'
	end

	if include_laggy_calculations then
		if count_all_buildings_on_all_surfaces then
			statistics.buildings_placed = 0
			for surface_index, surface_data in pairs(game.surfaces) do
				statistics.buildings_placed = statistics.buildings_placed + surface_data.count_entities_filtered{force = force, collision_mask = 'object-layer'}
			end
		else
			statistics.buildings_placed = surface.count_entities_filtered{force = force, collision_mask = 'object-layer'}
		end

		if count_voiding_buildings then
			statistics.voiding_buildings_placed = 0
			for voiding_building_index, voiding_building_data in pairs(voiding_buildings) do
				for surface_index, surface_data in pairs(game.surfaces) do
					statistics.voiding_buildings_placed = statistics.voiding_buildings_placed + surface_data.count_entities_filtered{name = voiding_building_data, force = force, collision_mask = 'object-layer'}
				end
			end
		end
	end

	statistics.active_mods = -1
	for _, _ in pairs(script.active_mods) do
		statistics.active_mods = statistics.active_mods + 1
	end

	if include_laggy_calculations then
		local unlocked_techs = 0
		local total_techs = 0
		statistics.recipes_unlocked = 0
		for _, tech in pairs(force.technologies) do
			local prototype = tech.prototype
			if tech.enabled and not prototype.hidden and not prototype.research_unit_count_formula then
				if tech.researched or tech.name == 'artillery-shell-range-13' then
					statistics.recipes_unlocked = statistics.recipes_unlocked + #tech.effects
					unlocked_techs = unlocked_techs + 1
				end
				total_techs = total_techs + 1
			end
		end
		statistics.tech_tree_completion = floor(unlocked_techs / total_techs * 1000) / 10
		statistics.recipes_unlocked = comma_value(statistics.recipes_unlocked)
	end

	local item_production_statistics = force.item_production_statistics
	statistics.science_produced = 0
	statistics.items_produced = 0
	statistics.creatures_slaughtered = 0
	statistics.items_consumed = 0
	for item, count in pairs(item_production_statistics.input_counts) do
		statistics.items_produced = statistics.items_produced + count
		if science_pack_names[item] then
			statistics.science_produced = statistics.science_produced + count
		end

		if count_voiding_buildings then
			statistics.voiding_buildings_produced = 0
			for voiding_building_index, voiding_building_data in pairs(voiding_buildings) do
				if item == voiding_building_data then
					statistics.voiding_buildings_produced = statistics.voiding_buildings_produced + count
				end
			end
		end
	end
	for item, count in pairs(item_production_statistics.output_counts) do
		statistics.items_consumed = statistics.items_consumed + count
		if creature_names[item] then
			statistics.creatures_slaughtered = statistics.creatures_slaughtered + count
		end
	end
	statistics.science_produced = comma_value(statistics.science_produced)
	statistics.items_produced = comma_value(statistics.items_produced)
	statistics.creatures_slaughtered = comma_value(statistics.creatures_slaughtered)
	statistics.items_consumed = comma_value(statistics.items_consumed)

	statistics.fluids_produced = 0
	statistics.fluids_consumed = 0
	local fluid_production_statistics = force.fluid_production_statistics
	for _, count in pairs(fluid_production_statistics.input_counts) do
		statistics.fluids_produced = statistics.fluids_produced + count
	end
	for _, count in pairs(fluid_production_statistics.output_counts) do
		statistics.fluids_consumed = statistics.fluids_consumed + count
	end
	statistics.fluids_produced = comma_value(floor(statistics.fluids_produced))
	statistics.fluids_consumed = comma_value(floor(statistics.fluids_consumed))

	local enemy = game.forces['enemy']
	statistics.evolution = floor(enemy.evolution_factor * 1000) / 10
	statistics.evolution_factor_by_pollution = floor(enemy.evolution_factor_by_pollution * 1000) / 10
	statistics.evolution_factor_by_killing_spawners = floor(enemy.evolution_factor_by_killing_spawners * 1000) / 10
	statistics.evolution_factor_by_time = floor(enemy.evolution_factor_by_time * 1000) / 10

	local kill_counts = force.kill_count_statistics
	-- get input_counts for kills and losses
	local kills, losses = 0, 0
	for _, count in pairs(kill_counts.input_counts) do
		kills = kills + count
	end
	for _, count in pairs(kill_counts.output_counts) do
		losses = losses + count
	end
	statistics.losses = floor(losses)
	statistics.kills = floor(kills)

	if game.active_mods["JPlanet"] ~= nil then
		statistics.planets_visited = "compability not available yet."
	end

	-- compability prep for when the JPlanet mod updates...
	-- if game.active_mods["JPlanet"] ~= nil then
	-- 	local planets_visited = remote.call("JPlanet", "statistics.planets_visited")

	-- 	log("planets_visited")
	-- 	log(serpent.block(planets_visited))
	-- 	statistics.planets_visited = #planets_visited
	-- end

	statistics.pollution = 0
	for _, count in pairs(game.pollution_statistics.input_counts) do
		statistics.pollution = statistics.pollution + count
	end
	statistics.pollution = comma_value(floor(statistics.pollution * 10) / 10)

	statistics.rockets_launched = comma_value(force.rockets_launched)

	statistics.trains = #force.get_trains(surface)

	if remote.interfaces['caravans'] then
		statistics.caravans = remote.call('caravans', 'get_caravan_count')
	else
		statistics.caravans = 0
	end

	return statistics
end

local function add_statistic(gui, localised_string)
	local name = localised_string[1]
	if gui[name] then
		gui[name].caption = localised_string
	else
		gui.add{type = 'label', caption = localised_string, name = name}.style.single_line = false
		gui.add{type = 'label', caption = ''}
	end
end

local function update_statistics_page(gui, player, include_laggy_calculations)

	local player_index = player.index
	local count_voiding_buildings = settings.get_player_settings(player_index)["count-voiding-buildings"].value

	local statistics = calculate_statistics(player, include_laggy_calculations)
	if include_laggy_calculations then add_statistic(gui, {'pywiki-statistics.tech-tree-completion', statistics.tech_tree_completion}) end
	add_statistic(gui, {'pywiki-statistics.playtime', statistics.hour, statistics.minute, statistics.second})
	add_statistic(gui, {'pywiki-statistics.time-of-day', statistics.daytime_hour, statistics.daytime_minute, statistics.am_pm})
	add_statistic(gui, {'pywiki-statistics.mods-installed', statistics.active_mods})
	if include_laggy_calculations then add_statistic(gui, {'pywiki-statistics.buildings-placed', statistics.buildings_placed}) end
	if include_laggy_calculations and count_voiding_buildings then add_statistic(gui, {'pywiki-statistics.voiding-buildings-placed', statistics.voiding_buildings_placed}) end
	if include_laggy_calculations then add_statistic(gui, {'pywiki-statistics.recipes-unlocked', statistics.recipes_unlocked}) end
	add_statistic(gui, {'pywiki-statistics.science-produced', statistics.science_produced})
	add_statistic(gui, {'pywiki-statistics.creatures-slaughtered', statistics.creatures_slaughtered})
	add_statistic(gui, {'pywiki-statistics.items-produced', statistics.items_produced})
	if count_voiding_buildings then add_statistic(gui, {'pywiki-statistics.voiding-buildings-produced', statistics.voiding_buildings_produced}) end
	add_statistic(gui, {'pywiki-statistics.items-consumed', statistics.items_consumed})
	add_statistic(gui, {'pywiki-statistics.fluids-produced', statistics.fluids_produced})
	add_statistic(gui, {'pywiki-statistics.fluids-consumed', statistics.fluids_consumed})
	add_statistic(gui, {'pywiki-statistics.evolution', statistics.evolution, statistics.evolution_factor_by_pollution, statistics.evolution_factor_by_killing_spawners, statistics.evolution_factor_by_time})
	add_statistic(gui, {'pywiki-statistics.kills', statistics.kills})
	add_statistic(gui, {'pywiki-statistics.losses', statistics.losses})
	add_statistic(gui, {'pywiki-statistics.pollution', statistics.pollution})
	add_statistic(gui, {'pywiki-statistics.rockets-launched', statistics.rockets_launched})
	add_statistic(gui, {'pywiki-statistics.trains', statistics.trains})
	add_statistic(gui, {'pywiki-statistics.caravans', statistics.caravans})
	if game.active_mods["JPlanet"] then add_statistic(gui, {'pywiki-statistics.planets_visited', statistics.planets_visited}) end
end

Event.on_nth_tick(60, function()
	for _, player in pairs(game.connected_players) do
		local gui = remote.call('pywiki', 'get_page_contents', player)
		if gui and gui.statistics_flow then update_statistics_page(gui.statistics_flow, player, false) end
	end
end)

local function create_statistics_page(gui, player)
	gui = gui.add{type = 'flow', direction = 'vertical', name = 'statistics_flow'}
	gui.style.horizontal_align = 'center'
	gui.style.horizontally_stretchable = true

	gui.add{type = 'label', caption = ''}
	local logo_frame = gui.add{type = 'frame'}
	local inner_logo_frame = logo_frame.add{type = 'frame', style = 'window_content_frame_packed'}
	inner_logo_frame.style.top_margin = 5
	inner_logo_frame.add{type = 'sprite', sprite = 'pywiki-logos'}

	gui.add{type = 'label', caption = ''}
	gui.add{type = 'label', caption = {'pywiki-statistics.info'}}.style.single_line = false
	gui.add{type = 'label', caption = {'pywiki-statistics.info-2'}}.style.single_line = false
	gui.add{type = 'label', caption = ''}

	local discord_flow = gui.add{type = 'flow', direction = 'horizontal'}
	discord_flow.style.vertical_align = 'center'
	discord_flow.add{type = 'label', caption = {'pywiki-statistics.info-3'}}
	local discord_link = discord_flow.add{type = 'text-box', text = discord}
	discord_link.selectable = true
	discord_link.word_wrap = false
	discord_link.read_only = true

	local patreon_flow = gui.add{type = 'flow', direction = 'horizontal'}
	patreon_flow.style.vertical_align = 'center'
	patreon_flow.add{type = 'label', caption = {'pywiki-statistics.info-4'}}
	local patreon_link = patreon_flow.add{type = 'text-box', text = patreon}
	patreon_link.selectable = true
	patreon_link.word_wrap = false
	patreon_link.read_only = true
	patreon_link.style.width = 230

	gui.add{type = 'label', caption = ''}

	local player_index = player.index
	local include_laggy_calculations = settings.get_player_settings(player_index)["include-laggy-calculations"].value

	update_statistics_page(gui, player, include_laggy_calculations)
end

remote.add_interface('create_statistics_page', {create_statistics_page = create_statistics_page})