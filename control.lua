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

Event.register(defines.events.on_gui_opened, function(event)
	if event.gui_type ~= defines.gui_type.entity then
		return
	end
	if event.entity.type ~= "beacon" then
		return
	end
	if string.match(event.entity.name, "beacon%-AM") == nil then
		if game.players[event.player_index].gui.relative.Dials then
			game.players[event.player_index].gui.relative.Dials.destroy()
		end
		return
	end
	if game.players[event.player_index].gui.relative.Dials then
		game.players[event.player_index].gui.relative.Dials.destroy()
	end
	local dial = game.players[event.player_index].gui.relative.add(
		{
			type = "frame",
			name = "Dials",
			anchor =
			{
				gui = defines.relative_gui_type.beacon_gui,
				position = defines.relative_gui_position.right
			},
			direction = "vertical",
			caption = "Beacon Dials"
		}
	)
	local AM = dial.add(
		{
			type = "flow",
			name = "AM_flow"
		}
	)
	AM.style.vertical_align = 'center'
	AM.add(
		{
			type = "label",
			name = "AM_label",
			caption = "AM"
		}
	)
	AM.add(
		{
			type = "slider",
			name = "AM",
			minimum_value = 1,
			maximum_value = 5,
			value = event.entity.name:match('%d+'),
			discrete_slider = true,
			caption = "AM"
		}
	)
	AM.add(
		{
			type = "textfield",
			name = "AM_slider_num",
			text = event.entity.name:match('%d+'),
			numeric = true,
			lose_focus_on_confirm = true,
		}
	).style.maximal_width = 50
	local FM = dial.add(
		{
			type = "flow",
			name = "FM_flow"
		}
	)
	FM.style.vertical_align = 'center'
	FM.add(
		{
			type = "label",
			name = "FM_label",
			caption = "FM"
		}
	)
	FM.add(
		{
			type = "slider",
			name = "FM",
			minimum_value = 1,
			maximum_value = 5,
			value = event.entity.name:match('%d+$'),
			discrete_slider = true,
			caption = "FM"
		}
	)
	FM.add(
		{
			type = "textfield",
			name = "FM_slider_num",
			text = event.entity.name:match('%d+$'),
			numeric = true,
			lose_focus_on_confirm = true,
		}
	).style.maximal_width = 50
	dial.add(
		{
			type = "button",
			name = "radio_confirm",
			caption = "CONFIRM"
		}
	)
end)

Event.register(defines.events.on_gui_value_changed, function(event)
	if event.element.name == "AM" then
		local AM = event.element
		AM.parent.AM_slider_num.text = tostring(AM.slider_value)
	elseif event.element.name == "FM" then
		local FM = event.element
		FM.parent.FM_slider_num.text = tostring(FM.slider_value)
	end
end)

Event.register(defines.events.on_gui_text_changed, function(event)
	if event.element.name == "AM_slider_num" then
		local AM = event.element
		AM.parent.AM.slider_value = tonumber(AM.text)
	elseif event.element.name == "FM_slider_num" then
		local FM = event.element
		FM.parent.FM.slider_value = tonumber(FM.text)
	end
end)

Event.register(Event.core_events.init_and_config, function()
	global.beacon_interference_icons = global.beacon_interference_icons or {}
end)

local function enable_beacon(beacon)
	beacon.active = true
	if not global.beacon_interference_icons[beacon.unit_number] then return end
	rendering.destroy(global.beacon_interference_icons[beacon.unit_number])
	global.beacon_interference_icons[beacon.unit_number] = nil
end

local function disable_beacon(beacon)
	beacon.active = false
	if global.beacon_interference_icons[beacon.unit_number] then return end
	global.beacon_interference_icons[beacon.unit_number] = rendering.draw_sprite{
		sprite = 'beacon-interference',
		x_scale = 0.5,
		y_scale = 0.5,
		target = beacon,
		surface = beacon.surface
	}
end

local function beacon_check(beacon, reciver, killed)
	local killed = killed or false
	local recivers = {}
	if reciver then
		table.insert(recivers, reciver)
	end
	if beacon and next(beacon.get_beacon_effect_receivers()) then
		recivers = beacon.get_beacon_effect_receivers()
	end
	for r, reciver in pairs(recivers) do
		local beacons = reciver.get_beacons()
		local beacon_count = {}
		if beacons then
			for b, bea in pairs(beacons) do
				if killed == true and bea.unit_number == beacon.unit_number then
				elseif string.match(bea.name, "beacon%-AM") and bea.valid then
					if beacon_count[bea.name] == nil then
						beacon_count[bea.name] = 1
					elseif beacon_count[bea.name] then
						beacon_count[bea.name] = beacon_count[bea.name] + 1
					end
				end
			end
			if next(beacon_count) then
				for b, bea in pairs(beacons) do
					if beacon_count[bea.name] then
						if beacon_count[bea.name] > 1 then
							disable_beacon(bea)
						elseif beacon_count[bea.name] <= 1 then
							enable_beacon(bea)
						end
					end
				end
			else
				for b, bea in pairs(beacons) do
					enable_beacon(bea)
				end
			end
		end
	end
end

Event.register(defines.events.on_gui_click, function(event)
	if event.element.name ~= "radio_confirm" then return end

	local GO = event.element
	local beacon = game.players[event.player_index].opened
	local beacon_name_prefix = string.match(beacon.name, "diet") and "diet-beacon-AM" or "beacon-AM"
	local beacon_name = beacon_name_prefix .. GO.parent.AM_flow.AM.slider_value .. "-FM" .. GO.parent.FM_flow.FM.slider_value
	if beacon.name == beacon_name then return end

	local new_beacon = beacon.surface.create_entity{
		name = beacon_name,
		position = beacon.position,
		force = beacon.force_index,
		create_build_effect_smoke = false
	}
	local module_slot = beacon.get_inventory(defines.inventory.beacon_modules)
	local new_beacon_slots = new_beacon.get_inventory(defines.inventory.beacon_modules)
	for item, amount in pairs(module_slot.get_contents()) do
		new_beacon_slots.insert{name = item, count = amount}
	end
	beacon.destroy()
	beacon_check(new_beacon)
end)

Event.register(Event.build_events, function(event)
	local beacon = event.created_entity
	if beacon.type ~= "beacon" then
		beacon_check(_, beacon)
	end
	if string.match(beacon.name, "beacon%-AM") == nil then return end
	beacon_check(beacon)
end)

Event.register(Event.death_events, function(event)
	local beacon = event.entity
	if beacon.type ~= "beacon" then return end
	if string.match(beacon.name, "beacon%-AM") == nil then return end
	global.beacon_interference_icons[beacon.unit_number] = nil
	local killed = true
	beacon_check(beacon, _, killed)
end)
