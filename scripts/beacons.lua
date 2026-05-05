Beacons = {}
Beacons.events = {}

-- autofilled with alienlife buildings
local blacklist = {
    ["antelope-enclosure"] = true,
    ["arqad-hive"] = true,
    ["arthurian-pen"] = true,
    ["auog-paddock"] = true,
    ["cridren-enclosure"] = true,
    ["dhilmos-pool"] = true,
    ["dingrits-pack"] = true,
    ["fish-farm"] = true,
    ["kmauts-enclosure"] = true,
    ["mukmoux-pasture"] = true,
    ["phadai-enclosure"] = true,
    ["phagnot-corral"] = true,
    ["prandium-lab"] = true,
    ["ez-ranch"] = true,
    ["rc"] = true,
    ["scrondrix-pen"] = true,
    ["simik-den"] = true,
    ["trits-reef"] = true,
    ["ulric-corral"] = true,
    ["vonix-den"] = true,
    ["vrauks-paddock"] = true,
    ["xenopen"] = true,
    ["xyhiphoe-pool"] = true,
    ["zipir-reef"] = true,
    ["cadaveric-arum"] = true,
    ["fwf"] = true,
    ["grods-swamp"] = true,
    ["guar-gum-plantation"] = true,
    ["kicalk-plantation"] = true,
    ["moondrop-greenhouse"] = true,
    ["moss-farm"] = true,
    ["ralesia-plantation"] = true,
    ["rennea-plantation"] = true,
    ["sap-extractor"] = true,
    ["seaweed-crop"] = true,
    ["sponge-culture"] = true,
    ["tuuphra-plantation"] = true,
    ["yotoi-aloe-orchard"] = true,
    ["bhoddos-culture"] = true,
    ["fawogae-plantation"] = true,
    ["navens-culture"] = true,
    ["yaedols-culture"] = true,
}

remote.add_interface("py_beacons", {
    ---Adds the entity to the blacklist of buildings ignored by beacon overloading. Blacklist checking ignores '-mk0x'
    ---@param entity data.EntityID
    add_to_blacklist = function (entity)
        storage.farms[entity] = true
    end,
    ---Removes the entity from the blacklist of buildings ignored by beacon overloading. Blacklist checking ignores '-mk0x'
    ---@param entity data.EntityID
    remove_from_blacklist = function (entity)
        storage.farms[entity] = nil
    end
})

local our_beacons = {}
for i = 1, 5 do
    for j = 1, 5 do
        our_beacons["beacon-AM" .. i .. "-FM" .. j] = "beacon"
        our_beacons["diet-beacon-AM" .. i .. "-FM" .. j] = "diet-beacon"
    end
end

py.on_event(py.events.on_init(), function()
    storage.beacon_interference_icons = storage.beacon_interference_icons or {}
    storage.farms = storage.farms or blacklist
end)

local function enable_entity(entity)
    local name = entity.name:gsub("%-mk..+", "")
    if storage.farms[name] ~= nil then return end
    entity.active = true
    local unit_number = entity.unit_number
    local rendering_id = storage.beacon_interference_icons[unit_number]
    if not rendering_id then return end
    local rendering_object = rendering.get_object_by_id(rendering_id)
    if rendering_object then rendering_object.destroy() end
    storage.beacon_interference_icons[unit_number] = nil
    entity.custom_status = nil
    for _, player in pairs(game.players) do
        player.remove_alert{entity = entity, type = defines.alert_type.custom}
    end
end

local function disable_entity(entity)
    local name = entity.name:gsub("%-mk..+", "")
    if storage.farms[name] ~= nil then return end
    entity.active = false
    entity.custom_status = {
        diode = defines.entity_status_diode.red,
        label = {"entity-status.beacon-interference"}
    }
    local unit_number = entity.unit_number
    if storage.beacon_interference_icons[unit_number] then return end
    storage.beacon_interference_icons[unit_number] = py.draw_error_sprite(entity, "beacon-interference").id
    for _, player in pairs(game.players) do
        player.add_custom_alert(entity, {type = "virtual", name = "beacon-interference"}, {"entity-status.beacon-interference"}, true)
    end
end

---@param reciver LuaEntity
---@return boolean interference
local function beacon_check(reciver)
    ---@class LuaEntity[]
    local beacons = reciver.get_beacons()
    if not beacons or not next(beacons) then return false end

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
                    return true
                end
                effected_am[am] = true
                effected_fm[fm] = true
            else
                if effected_total[total] then
                    disable_entity(reciver)
                    return true
                end
                effected_total[total] = true
            end
        end
    end
    enable_entity(reciver)
    return false
end

---Replaces a beacon entity with a different frequency entity
---@param entity LuaEntity
---@param new_beacon_name string
---@param player_index integer? player whose undo queue this action is added to
---@return LuaEntity? entity the current beacon or whatever it was replaced with
local function change_frequency(entity, new_beacon_name, player_index)
    if not entity or not entity.valid then return end
    -- Ghost only?
    if entity.type == "entity-ghost" then
        if entity.ghost_name == new_beacon_name then return entity end
        -- Replace entity
        local new_entity = entity.surface.create_entity {
            name = entity.type,
            inner_name = new_beacon_name,
            position = entity.position,
            quality = entity.quality,
            force = entity.force_index,
            create_build_effect_smoke = false,
        }
        entity.destroy()
        return new_entity
    else -- No ghost
        if entity.name == new_beacon_name then return entity end
        -- Get current effect receivers
        local receivers = {}
        for _, receiver in pairs(entity.get_beacon_effect_receivers()) do
            receivers[receiver.unit_number] = receiver
        end
        local player = player_index and game.get_player(player_index)
        local index, action = py.find_latest_undo_action(player_index, entity, "built-entity")
        -- Replace entity
        local new_entity = entity.surface.create_entity {
            name = new_beacon_name,
            position = entity.position,
            quality = entity.quality,
            force = entity.force_index,
            player = index and player,
            undo_index = index,
            create_build_effect_smoke = false
        }
        entity.destroy()
        if action then
            -- needs to be done after the construction, ref https://forums.factorio.com/viewtopic.php?t=132714
            player.undo_redo_stack.remove_undo_action(index, action) -- remove old action from queue
        end
        -- Get new effect receivers
        for _, receiver in pairs(new_entity.get_beacon_effect_receivers()) do
            receivers[receiver.unit_number] = receiver
        end
        -- Check all receivers
        local alert
        for _, receiver in pairs(receivers) do
            alert = alert or beacon_check(receiver)
        end
        if player and alert then
            player.play_sound{path="utility/alert_destroyed"}
        end
        if remote.interfaces["cryogenic-distillation"] then
            remote.call("cryogenic-distillation", "am_fm_beacon_settings_changed", new_entity)
        end
        return new_entity
    end
end

-- storing in a local table is fine because it only exists for that tick
local beacon_ghosts = {}

-- If a pipette is placed on top of a ghost, the AM/FM setting is lost without script intervention
Beacons.events.on_pre_build = function(event)
    if event.build_mode ~= defines.build_mode.normal then return end
    local surface = game.get_player(event.player_index).surface
    local colliding_ghost = surface.find_entity("entity-ghost", event.position)
    beacon_ghosts[event.player_index] = colliding_ghost and our_beacons[colliding_ghost.ghost_name] and colliding_ghost.ghost_name or nil
end

Beacons.events.on_built = function(event)
    local entity = event.entity
    local ghost_name = beacon_ghosts[event.player_index]
    beacon_ghosts[event.player_index] = nil
    if not entity.valid then return end
    local alert
    if entity.type == "beacon" then
        if not our_beacons[entity.name] then return end
        -- If the ghost doesn't match the placed entity, then fix it
        if ghost_name and entity.name ~= ghost_name then
            change_frequency(entity, ghost_name, event.player_index)
            return -- recievers already updated and player notified of issues
        end
        for _, reciver in pairs(entity.get_beacon_effect_receivers()) do
            alert = alert or beacon_check(reciver)
        end
    else
        alert = beacon_check(entity)
    end
    if event.player_index and alert then
        game.get_player(event.player_index).play_sound{path="utility/alert_destroyed"}
    end
end

Beacons.events.on_destroyed = function(event)
    local entity = event.entity
    if not entity.valid or not entity.unit_number then return end
    storage.beacon_interference_icons[entity.unit_number] = nil

    if entity.type == "beacon" then
        if not our_beacons[entity.name] then return end
        local recievers = entity.get_beacon_effect_receivers()
        entity.destroy() -- is needed for beacon check to remove interference if there was any
        for _, reciever in pairs(recievers) do
            beacon_check(reciever)
        end
        if table_size(recievers) ~= 0 and remote.interfaces["cryogenic-distillation"] then
            remote.call("cryogenic-distillation", "am_fm_beacon_destroyed", recievers, recievers[1].surface)
        end
    end
end

Beacons.events.on_entity_settings_pasted = function(event)
    local source, destination = event.source, event.destination
    if not source.valid or not destination.valid then return end

    local source_name = (source.type == "entity-ghost" and source.ghost_name) or source.name
    local destination_name = (destination.type == "entity-ghost" and destination.ghost_name) or destination.name
    -- Not a beacon or not changing
    if not our_beacons[source_name] or not our_beacons[destination_name] or source_name == destination_name then return end

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
    AM.add {type = "label", name = "AM_label", caption = { "beacon-modifier.am" }}
    AM.add {
        type = "slider",
        name = "AM",
        minimum_value = 1,
        maximum_value = 5,
        value = name:match("%d+"),
        discrete_slider = true
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
    FM.add {type = "label", name = "FM_label", caption = { "beacon-modifier.fm" }}
    FM.add {
        type = "slider",
        name = "FM",
        minimum_value = 1,
        maximum_value = 5,
        value = name:match("%d+$"),
        discrete_slider = true
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

    player.opened = change_frequency(beacon, beacon_name, event.player_index)
end
