Beacons = {}
Beacons.events = {}

local farm_buildings = {
    ["antelope-enclosure"] = "animal",
    ["arqad-hive"] = "animal",
    ["arthurian-pen"] = "animal",
    ["auog-paddock"] = "animal",
    ["cridren-enclosure"] = "plant",
    ["dhilmos-pool"] = "animal",
    ["dingrits-pack"] = "animal",
    ["fish-farm"] = "animal",
    ["kmauts-enclosure"] = "animal",
    ["mukmoux-pasture"] = "animal",
    ["phadai-enclosure"] = "animal",
    ["phagnot-corral"] = "animal",
    ["prandium-lab"] = "animal",
    ["ez-ranch"] = "animal",
    ["rc"] = "animal",
    ["scrondrix-pen"] = "animal",
    ["simik-den"] = "animal",
    ["trits-reef"] = "animal",
    ["ulric-corral"] = "animal",
    ["vonix-den"] = "animal",
    ["vrauks-paddock"] = "animal",
    ["xenopen"] = "animal",
    ["xyhiphoe-pool"] = "animal",
    ["zipir-reef"] = "animal",
    ["cadaveric-arum"] = "plant",
    ["fwf"] = "plant",
    ["grods-swamp"] = "plant",
    ["guar-gum-plantation"] = "plant",
    ["kicalk-plantation"] = "plant",
    ["moondrop-greenhouse"] = "plant",
    ["moss-farm"] = "plant",
    ["ralesia-plantation"] = "plant",
    ["rennea-plantation"] = "plant",
    ["sap-extractor"] = "plant",
    ["seaweed-crop"] = "plant",
    ["sponge-culture"] = "plant",
    ["tuuphra-plantation"] = "plant",
    ["yotoi-aloe-orchard"] = "plant",
    ["bhoddos-culture"] = "fungi",
    ["fawogae-plantation"] = "fungi",
    ["navens-culture"] = "fungi",
    ["yaedols-culture"] = "fungi",
}

local our_beacons = {}
for i = 1, 5 do
    for j = 1, 5 do
        our_beacons["beacon-AM" .. i .. "-FM" .. j] = "beacon"
        our_beacons["diet-beacon-AM" .. i .. "-FM" .. j] = "diet-beacon"
    end
end

py.on_event(py.events.on_init(), function()
    storage.beacon_interference_icons = storage.beacon_interference_icons or {}
    storage.farms = storage.farms or farm_buildings
end)

local function enable_entity(entity)
    local name = entity.name:gsub("%-mk..+", "")
    if storage.farms[name] ~= nil then
        return
    end
    entity.active = true
    local unit_number = entity.unit_number
    local rendering_id = storage.beacon_interference_icons[unit_number]
    if not rendering_id then return end
    local rendering_object = rendering.get_object_by_id(rendering_id)
    if rendering_object then rendering_object.destroy() end
    storage.beacon_interference_icons[unit_number] = nil
    entity.custom_status = nil
end

local function disable_entity(entity)
    local name = entity.name:gsub("%-mk..+", "")
    if storage.farms[name] ~= nil then
        return
    end
    entity.active = false
    entity.custom_status = {
        diode = defines.entity_status_diode.red,
        label = {"entity-status.beacon-interference"}
    }
    local unit_number = entity.unit_number
    if storage.beacon_interference_icons[unit_number] then return end
    storage.beacon_interference_icons[unit_number] = rendering.draw_sprite {
        sprite = "beacon-interference",
        x_scale = 0.5,
        y_scale = 0.5,
        target = entity,
        surface = entity.surface_index
    }.id
end

---@param reciver LuaEntity
local function beacon_check(reciver)
    ---@class LuaEntity[]
    local beacons = reciver.get_beacons()
    if not beacons or not next(beacons) then return end

    local effected_am = {}
    local effected_fm = {}
    local effected_total = {}
    for _, beacon in pairs(beacons) do
        if our_beacons[beacon.name] then
            local am = beacon.name:match("%d+") --[[@as string]]
            local fm = beacon.name:match("%d+$") --[[@as string]]
            local total = am .. fm
            if settings.startup["future-beacons"].value then
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

---Replaces a beacon entity with a different frequency entity
---@param entity LuaEntity
---@param new_beacon_name string
---@param player integer? player whose undo queue this action is added to
---@return LuaEntity?
local function change_frequency(entity, new_beacon_name, player)
    if not entity or not entity.valid then
        return
    end
    -- Ghost only?
    if entity.type == "entity-ghost" then
        if entity.ghost_name == new_beacon_name then
            return
        end
        return entity.surface.create_entity {
            name = entity.type,
            position = entity.position,
            force = entity.force_index,
            player = player,
            quality = entity.quality,
            create_build_effect_smoke = false,
            fast_replace = true,
            inner_name = new_beacon_name,
        }
    else -- No ghost
        if entity.name == new_beacon_name then
            return
        end
        -- Not ghost
        -- Get current effect receivers
        local receivers = {}
        for _, receiver in pairs(entity.get_beacon_effect_receivers()) do
            receivers[receiver.unit_number] = receiver
        end
        -- Replace entity
        local mineable_result = entity.prototype.mineable_properties.products[1].name
        local new_entity = entity.surface.create_entity {
            name = new_beacon_name,
            position = entity.position,
            quality = entity.quality,
            force = entity.force_index,
            player = player,
            fast_replace = true,
            create_build_effect_smoke = false
        }
        if player then
            game.players[player].character.get_inventory(defines.inventory.character_main).remove {name = mineable_result, amount = 1}
        end
        -- Get new effect receivers
        for _, receiver in pairs(new_entity.get_beacon_effect_receivers()) do
            receivers[receiver.unit_number] = receiver
        end
        -- Check all receivers
        for _, receiver in pairs(receivers) do
            beacon_check(receiver)
        end
        if remote.interfaces["cryogenic-distillation"] then
            remote.call("cryogenic-distillation", "am_fm_beacon_settings_changed", new_entity)
        end
        return new_entity
    end
end

-- If a pipette is placed on top of a ghost, the AM/FM setting is lost without script intervention
Beacons.events.on_pre_build = function(event)
    if event.build_mode ~= defines.build_mode.normal then
        return
    end
    local surface = game.get_player(event.player_index).surface
    local colliding_ghost = surface.find_entity("entity-ghost", event.position)
    if colliding_ghost and our_beacons[colliding_ghost.ghost_name] then
        storage.last_beacon_ghost = colliding_ghost.ghost_name
    end
end

Beacons.events.on_built = function(event)
    local entity = event.entity
    local ghost = storage.last_beacon_ghost
    storage.last_beacon_ghost = nil
    if not entity.valid then return end
    if entity.type == "beacon" then
        if not our_beacons[entity.name] then return end
        -- If the ghost doesn't match the placed entity, then fix it
        -- TODO: find a way to have this action properly work with the undo stack
        if ghost and entity.name ~= ghost then
            change_frequency(entity, ghost)
            return
        end
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
    storage.beacon_interference_icons[entity.unit_number] = nil

    if entity.type == "beacon" then
        if not our_beacons[entity.name] then return end
        local recivers = entity.get_beacon_effect_receivers()
        entity.destroy() -- is needed for beacon check to remove interference if there was any
        for _, reciver in pairs(recivers) do
            beacon_check(reciver)
        end
        if table_size(recivers) ~= 0 and remote.interfaces["cryogenic-distillation"] then
            remote.call("cryogenic-distillation", "am_fm_beacon_destroyed", recivers, recivers[1].surface)
        end
    end
end

Beacons.events.on_entity_settings_pasted = function(event)
    local source, destination = event.source, event.destination
    if not source.valid or not destination.valid then
        return
    end

    local source_name = (source.type == "entity-ghost" and source.ghost_name) or source.name
    local destination_name = (destination.type == "entity-ghost" and destination.ghost_name) or destination.name
    -- Not a beacon or not changing
    if not (our_beacons[source_name] and our_beacons[destination_name]) or source_name == destination_name then
        return
    end

    change_frequency(destination, source_name, event.player_index)
end

Beacons.events.on_gui_opened = function(event)
    if event.gui_type ~= defines.gui_type.entity then return end
    local entity = event.entity
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    if entity.type ~= "beacon" and entity.type ~= "entity-ghost" then return end
    local name = (entity.type == "entity-ghost" and entity.ghost_name) or entity.name
    if player.gui.relative.Dials then
        player.gui.relative.Dials.destroy()
    end

    if not our_beacons[name] then return end
    local dial = player.gui.relative.add {
        type = "frame",
        name = "Dials",
        anchor = {
            gui = defines.relative_gui_type.beacon_gui,
            position = defines.relative_gui_position.right
        },
        direction = "vertical",
        caption = "Beacon Dials"
    }
    local AM = dial.add {type = "flow", name = "AM_flow"}
    AM.style.vertical_align = "center"
    AM.add {type = "label", name = "AM_label", caption = "AM"}
    AM.add {
        type = "slider",
        name = "AM",
        minimum_value = 1,
        maximum_value = 5,
        value = name:match("%d+"),
        discrete_slider = true,
        caption = "AM"
    }
    AM.add {
        type = "textfield",
        name = "AM_slider_num",
        text = name:match("%d+"),
        numeric = true,
        lose_focus_on_confirm = true,
    }.style.maximal_width = 50

    local FM = dial.add {type = "flow", name = "FM_flow"}
    FM.style.vertical_align = "center"
    FM.add {type = "label", name = "FM_label", caption = "FM"}
    FM.add {
        type = "slider",
        name = "FM",
        minimum_value = 1,
        maximum_value = 5,
        value = name:match("%d+$"),
        discrete_slider = true,
        caption = "FM"
    }
    FM.add {
        type = "textfield",
        name = "FM_slider_num",
        text = name:match("%d+$"),
        numeric = true,
        lose_focus_on_confirm = true,
    }.style.maximal_width = 50
    dial.add {type = "button", name = "py_beacon_confirm", caption = "CONFIRM"}
end

gui_events[defines.events.on_gui_value_changed]["AM"] = function(event)
    local AM = event.element
    AM.parent.AM_slider_num.text = tostring(AM.slider_value)
end

gui_events[defines.events.on_gui_value_changed]["FM"] = function(event)
    local FM = event.element
    FM.parent.FM_slider_num.text = tostring(FM.slider_value)
end

gui_events[defines.events.on_gui_text_changed]["AM_slider_num"] = function(event)
    local AM = event.element
    if tonumber(AM.text) then AM.parent.AM.slider_value = tonumber(AM.text) end
end

gui_events[defines.events.on_gui_text_changed]["FM_slider_num"] = function(event)
    local FM = event.element
    if tonumber(FM.text) then FM.parent.FM.slider_value = tonumber(FM.text) end
end

gui_events[defines.events.on_gui_click]["py_beacon_confirm"] = function(event)
    if event.element.name ~= "py_beacon_confirm" then return end

    local gui = event.element.parent
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
    local beacon = player.opened
    if not beacon then return end ---@cast beacon LuaEntity
    local init_name = (beacon.type == "entity-ghost" and beacon.ghost_name) or beacon.name
    local beacon_name_prefix = our_beacons[init_name] .. "-AM"
    local beacon_name = beacon_name_prefix .. gui.AM_flow.AM.slider_value .. "-FM" .. gui.FM_flow.FM.slider_value

    change_frequency(beacon, beacon_name, event.player_index)
end
