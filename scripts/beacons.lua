Beacons = {}
Beacons.events = {}

local farm_buildings = {
	['antelope-enclosure'] = 'animal',
	['arqad-hive'] = 'animal',
	['arthurian-pen'] = 'animal',
	['auog-paddock'] = 'animal',
	['cridren-enclosure'] = 'plant',
	['dhilmos-pool'] = 'animal',
	['dingrits-pack'] = 'animal',
	['fish-farm'] = 'animal',
	['kmauts-enclosure'] = 'animal',
	['mukmoux-pasture'] = 'animal',
	['phadai-enclosure'] = 'animal',
	['phagnot-corral'] = 'animal',
	['prandium-lab'] = 'animal',
	['ez-ranch'] = 'animal',
	['rc'] = 'animal',
	['scrondrix-pen'] = 'animal',
	['simik-den'] = 'animal',
	['trits-reef'] = 'animal',
	['ulric-corral'] = 'animal',
	['vonix-den'] = 'animal',
	['vrauks-paddock'] = 'animal',
	['xenopen'] = 'animal',
	['xyhiphoe-pool'] = 'animal',
	['zipir-reef'] = 'animal',
	['cadaveric-arum'] = 'plant',
	['fwf'] = 'plant',
	['grods-swamp'] = 'plant',
	['guar-gum-plantation'] = 'plant',
	['kicalk-plantation'] = 'plant',
	['moondrop-greenhouse'] = 'plant',
	['moss-farm'] = 'plant',
	['ralesia-plantation'] = 'plant',
	['rennea-plantation'] = 'plant',
	['sap-extractor'] = 'plant',
	['seaweed-crop'] = 'plant',
	['sponge-culture'] = 'plant',
	['tuuphra-plantation'] = 'plant',
	['yotoi-aloe-orchard'] = 'plant',
	['bhoddos-culture'] = 'fungi',
	['fawogae-plantation'] = 'fungi',
	['navens-culture'] = 'fungi',
	['yaedols-culture'] = 'fungi',
}

local our_beacons = {}
for i = 1, 5 do
	for j = 1, 5 do
		our_beacons['beacon-AM' .. i .. '-FM' .. j] = 'beacon'
		our_beacons['diet-beacon-AM' .. i .. '-FM' .. j] = 'diet-beacon'
	end
end

Beacons.events.init = function()
	global.beacon_interference_icons = global.beacon_interference_icons or {}
	global.farms = global.farms or farm_buildings
end

local function enable_entity(entity)
	local name = entity.name:gsub('%-mk..+', '')
	if global.farms[name] ~= nil then
		return
	end
	entity.active = true
	local unit_number = entity.unit_number
	local rendering_id = global.beacon_interference_icons[unit_number]
	if not rendering_id then return end
	rendering.destroy(rendering_id)
	global.beacon_interference_icons[unit_number] = nil
end

local function disable_entity(entity)
	local name = entity.name:gsub('%-mk..+', '')
	if global.farms[name] ~= nil then
		return
	end
	entity.active = false
	local unit_number = entity.unit_number
	if global.beacon_interference_icons[unit_number] then return end
	global.beacon_interference_icons[unit_number] = rendering.draw_sprite{
		sprite = 'beacon-interference',
		x_scale = 0.5,
		y_scale = 0.5,
		target = entity,
		surface = entity.surface_index
	}
end

local function beacon_check(reciver)
	local beacons = reciver.get_beacons() --[[@as table<int, LuaEntity>]]
	if not beacons or not next(beacons) then return end

	local effected_am = {}
	local effected_fm = {}
	local effected_total = {}
	for _, beacon in pairs(beacons) do
		if our_beacons[beacon.name] then
			local am = beacon.name:match('%d+') --[[@as string]]
			local fm = beacon.name:match('%d+$') --[[@as string]]
			local total = am .. fm
			if settings.startup['future-beacons'].value then
				if effected_am[am] or effected_fm[fm] then
					disable_entity(reciver)
					return
				end
				effected_am[am] = true
				effected_fm[fm] = true
			else
				if effected_total[total] then
					disable_entity(reciver)
					return
				end
				effected_total[total] = true
			end
		end
	end
	enable_entity(reciver)
end

Beacons.events.on_built = function(event)
	local entity = event.created_entity or event.entity
	if not entity.valid then return end
	if entity.type == 'beacon' then
		if not our_beacons[entity.name] then return end
		for _, reciver in pairs(entity.get_beacon_effect_receivers()) do
			beacon_check(reciver)
		end
	else
		beacon_check(entity)
	end
end

Beacons.events.on_destroyed = function(event)
	local entity = event.entity
	if not entity.valid or not entity.unit_number then return end
	global.beacon_interference_icons[entity.unit_number] = nil

	if entity.type == 'beacon' then
		if not our_beacons[entity.name] then return end
		local recivers = entity.get_beacon_effect_receivers()
		entity.destroy()
		for _, reciver in pairs(recivers) do
			beacon_check(reciver)
		end
		if table_size(recivers) ~= 0 and remote.interfaces['cryogenic-distillation'] then
			remote.call('cryogenic-distillation', 'am_fm_beacon_destroyed', recivers, recivers[1].surface)
		end
	end
end

Beacons.events.on_gui_opened = function(event)
	if event.gui_type ~= defines.gui_type.entity then return end
	local entity = event.entity
	if entity.type ~= 'beacon' then return end
    local player = game.get_player(event.player_index)
	if player.gui.relative.Dials then
		player.gui.relative.Dials.destroy()
	end

	if not our_beacons[entity.name] then return end
	local dial = player.gui.relative.add{
        type = 'frame',
        name = 'Dials',
        anchor = {
            gui = defines.relative_gui_type.beacon_gui,
            position = defines.relative_gui_position.right
        },
        direction = 'vertical',
        caption = 'Beacon Dials'
    }
	local AM = dial.add{type = 'flow', name = 'AM_flow'}
	AM.style.vertical_align = 'center'
	AM.add{type = 'label', name = 'AM_label', caption = 'AM'}
	AM.add{
        type = 'slider',
        name = 'AM',
        minimum_value = 1,
        maximum_value = 5,
        value = entity.name:match('%d+'),
        discrete_slider = true,
        caption = 'AM'
    }
	AM.add{
        type = 'textfield',
        name = 'AM_slider_num',
        text = entity.name:match('%d+'),
        numeric = true,
        lose_focus_on_confirm = true,
    }.style.maximal_width = 50

	local FM = dial.add{type = 'flow', name = 'FM_flow'}
	FM.style.vertical_align = 'center'
	FM.add{type = 'label', name = 'FM_label', caption = 'FM'}
	FM.add{
        type = 'slider',
        name = 'FM',
        minimum_value = 1,
        maximum_value = 5,
        value = entity.name:match('%d+$'),
        discrete_slider = true,
        caption = 'FM'
    }
	FM.add{
        type = 'textfield',
        name = 'FM_slider_num',
        text = entity.name:match('%d+$'),
        numeric = true,
        lose_focus_on_confirm = true,
    }.style.maximal_width = 50
	dial.add{type = 'button', name = 'py_beacon_confirm', caption = 'CONFIRM'}
end

gui_events[defines.events.on_gui_value_changed]['AM'] = function(event)
	local AM = event.element
	AM.parent.AM_slider_num.text = tostring(AM.slider_value)
end

gui_events[defines.events.on_gui_value_changed]['FM'] = function(event)
	local FM = event.element
	FM.parent.FM_slider_num.text = tostring(FM.slider_value)
end

gui_events[defines.events.on_gui_text_changed]['AM_slider_num'] = function(event)
	local AM = event.element
	AM.parent.AM.slider_value = tonumber(AM.text)
end

gui_events[defines.events.on_gui_text_changed]['FM_slider_num'] = function(event)
	local FM = event.element
	FM.parent.FM.slider_value = tonumber(FM.text)
end

gui_events[defines.events.on_gui_click]['py_beacon_confirm'] = function(event)
	if event.element.name ~= 'py_beacon_confirm' then return end

	local gui = event.element.parent
	local player = game.get_player(event.player_index)
	local beacon = player.opened
	if not beacon then return end
	local beacon_name_prefix = our_beacons[beacon.name] .. '-AM'
	local beacon_name = beacon_name_prefix .. gui.AM_flow.AM.slider_value .. '-FM' .. gui.FM_flow.FM.slider_value
	if beacon.name == beacon_name then return end

	local new_beacon = beacon.surface.create_entity{
		name = beacon_name,
		position = beacon.position,
		force = beacon.force_index,
		create_build_effect_smoke = false
	}
	local module_slot = beacon.get_inventory(defines.inventory.beacon_modules)
	local new_beacon_slots = new_beacon.get_inventory(defines.inventory.beacon_modules)
	for i = 1, #module_slot do
		new_beacon_slots.insert(module_slot[i])
	end
	local recivers = {}
	for _, reciver in pairs(beacon.get_beacon_effect_receivers()) do
		recivers[reciver.unit_number] = reciver
	end
	for _, reciver in pairs(new_beacon.get_beacon_effect_receivers()) do
		recivers[reciver.unit_number] = reciver
	end
	beacon.destroy()
	for _, reciver in pairs(recivers) do
		beacon_check(reciver)
	end
	if remote.interfaces['cryogenic-distillation'] then
		remote.call('cryogenic-distillation', 'am_fm_beacon_settings_changed', new_beacon)
	end
end