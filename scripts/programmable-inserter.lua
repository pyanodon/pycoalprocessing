-- save a list of all valid targets, valid inventories for that target, and associated locale key for that inventory
local proxy_targets = {
  ["furnace"] = {
    input = defines.inventory.crafter_input,
    output = defines.inventory.crafter_output,
    fuel = defines.inventory.fuel,
    burnt_result = defines.inventory.burnt_result,
    modules = defines.inventory.crafter_modules,
    trash = defines.inventory.crafter_trash,
  },
  ["assembling-machine"] = {
    input = defines.inventory.crafter_input,
    output = defines.inventory.crafter_output,
    fuel = defines.inventory.fuel,
    burnt_result = defines.inventory.burnt_result,
    modules = defines.inventory.crafter_modules,
    trash = defines.inventory.crafter_trash,
    dump = defines.inventory.assembling_machine_dump,
  },
  ["lab"] = {
    input = defines.inventory.lab_input,
    trash = defines.inventory.lab_trash,
    fuel = defines.inventory.fuel,
    burnt_result = defines.inventory.burnt_result,
    modules = defines.inventory.lab_modules,
  },
  ["mining-drill"] = {
    fuel = defines.inventory.fuel,
    burnt_result = defines.inventory.burnt_result,
    modules = defines.inventory.mining_drill_modules,
  },
  ["car"] = {
    input = defines.inventory.car_trunk,
    fuel = defines.inventory.fuel
  },
  ["default"] = {
    input = defines.inventory.crafter_input,
    output = defines.inventory.crafter_output,
    fuel = defines.inventory.fuel,
    burnt_result = defines.inventory.burnt_result,
    modules = defines.inventory.crafter_modules,
    trash = defines.inventory.crafter_trash,
    dump = defines.inventory.assembling_machine_dump
  }
}

local proxy_pointers = {
  [defines.inventory.assembling_machine_dump] = "dump",
  [defines.inventory.burnt_result] = "burnt_result",
  [defines.inventory.crafter_input] = "input",
  [defines.inventory.crafter_modules] = "modules",
  [defines.inventory.crafter_output] = "output",
  [defines.inventory.crafter_trash] = "trash",
  [defines.inventory.fuel] = "fuel",
  [defines.inventory.lab_input] = "input",
  [defines.inventory.lab_modules] = "modules",
  [defines.inventory.lab_trash] = "trash",
  [defines.inventory.mining_drill_modules] = "modules"
}

local selection_indices ={
  input = {
    default = 1,
    input = 2,
    fuel = 3,
    modules = 4
  },
  output = {
    default = 1,
    output = 2,
    burnt_result = 3,
    modules = 4,
    trash = 5,
    dump = 6
  }
}

local function valid(metadata_index)
  local metadata = storage.programmable_inserters[metadata_index]
  -- if not valid, then remove entities (will most always be inserters being invalid)
  if not metadata then return true end
  if not metadata.inserter.valid or (metadata.pickup_target and not metadata.pickup_target.valid) or (metadata.drop_target and not metadata.drop_target.valid) then
    if metadata.inserter.valid then metadata.inserter.destroy() end
    if metadata.pickup_target and metadata.pickup_target.valid then metadata.pickup_target.destroy() end
    if metadata.drop_target and metadata.drop_target.valid then metadata.drop_target.destroy() end
    storage.programmable_inserters[metadata_index] = nil
    game.print("detected invalid programmable inserter data!")
    return false
  end
  return true
end

py.on_event(py.events.on_init(), function (event)
  storage.programmable_inserters = storage.programmable_inserters or {}
  for index in pairs(storage.programmable_inserters) do
    valid(index)
  end
end)

local function update_targets(inserter)
  if not inserter or not storage.programmable_inserters[inserter.unit_number] or not valid(inserter.unit_number) then return end
  local metadata = storage.programmable_inserters[inserter.unit_number]
  for index, entity in pairs{
    drop_target = metadata.drop_target,
    pickup_target = metadata.pickup_target,
  } do
    -- move proxy to new target position
    entity.teleport(inserter[index:sub(1, -7) .. "position"])
    
    for _, target in pairs(entity.surface.find_entities_filtered{
      position = entity.position,
      type = {
        "furnace",
        "assembling-machine",
        "lab",
        "mining-drill",
        "car"
      }
    }) do
      -- make sure we dont select things that we aren't supposed to see, only target things we need
      if (target.type ~= "car" or target.name == "space-pod") and not target.prototype.hidden and proxy_targets[target.type][metadata[index .. "_inventory"]] then
        -- set new target and proper inventory target index
        entity.proxy_target_entity = target
        entity.proxy_target_inventory = proxy_targets[target.type][metadata[index .. "_inventory"]]
        break
      end
    end
  end
end

local function update_gui(entity, player_index)
  if not entity or (entity.type == "entity-ghost" and entity.ghost_type or entity.type) ~= "inserter" then return end
  if not valid(entity.unit_number) then return end
  local player = game.get_player(player_index)

  local tags = (entity.tags or {})["py-dynamic-inserter"]
  
  local metadata = storage.programmable_inserters[entity.unit_number] or {}
  local drop_target = metadata.drop_target and (proxy_targets[(metadata.drop_target.proxy_target_entity or {}).type or ""] or {}) and metadata.drop_target.proxy_target_entity or entity.drop_target
  if not drop_target and entity.type == "entity-ghost" then
    -- check for other ghost or normal entities
  end
  local pickup_target = metadata.pickup_target and (proxy_targets[(metadata.pickup_target.proxy_target_entity or {}).type or ""] or {}) and metadata.pickup_target.proxy_target_entity or entity.pickup_target
  if not pickup_target and entity.type == "entity-ghost" then
    -- check for other ghost or normal entities
  end

  local relative = player.gui.relative

  if not relative["programmable-inserter-gui"] then
    -- recreate main gui
    local window = player.gui.relative.add{
      type = "frame",
      name = "programmable-inserter-gui",
      style = "invisible_frame",
      anchor = {
        gui = defines.relative_gui_type.inserter_gui,
        position = defines.relative_gui_position.right
      }
    }

    -- add 'settings' button
    local mini_window = window.add{
      type = "frame",
      name = "mini-frame"
    }
    mini_window.style.top_padding = 5
    mini_window.style.bottom_padding = 5
    mini_window.style.left_padding = 5
    mini_window.style.right_padding = 5
    mini_window.add{
      type = "sprite-button",
      name = "show-inserter-settings",
      style = "close_button",
      sprite = "utility/tip_icon",
      tooltip = {"tooltip.show-inserter-settings"}
    }

    -- add main settings window
    local main_frame = window.add{
      type = "frame",
      name = "main-frame",
      direction = "vertical"
    }
    main_frame.visible = false
    main_frame.add{
      type = "flow",
      name = "titlebar",
      direction = "horizontal"
    }.add{
        type = "label",
        style = "frame_title",
        caption = {"tooltip.inserter-settings-title"}
    }
    local header = main_frame.titlebar.add{
      type = "empty-widget",
      style = "draggable_space_header"
    }
    header.style.horizontally_stretchable = true
    header.style.natural_height = 24
    header.style.height = 24
    header.style.right_margin = 5
    main_frame.titlebar.add{
        type = "sprite-button",
        name = "hide-inserter-settings",
        style = "close_button",
        sprite = "utility/close",
    }
    
    main_frame = main_frame.add{
      type = "frame",
      name = "sub-frame",
      style = "inside_shallow_frame_with_padding_and_vertical_spacing",
      direction = "vertical"
    }

    -- update checkboxes
    main_frame.add{
      type = "drop-down",
      name = "drop_target",
      items = {
        {"", {"inventory-target.default"}},
        {(proxy_targets[(drop_target or {}).type] or {}).input and "" or "tooltip.unavailable-insert-target", {"inventory-target.input"}},
        {(proxy_targets[(drop_target or {}).type] or {}).fuel and "" or "tooltip.unavailable-insert-target", {"inventory-target.fuel"}},
        {(proxy_targets[(drop_target or {}).type] or {}).modules and "" or "tooltip.unavailable-insert-target", {"inventory-target.modules"}},
      },
      tooltip = {"tooltip.inserter-drop-target-tooltip"},
      selected_index = selection_indices.input[(tags or metadata).drop_target_inventory] or 1
    }
    main_frame.add{
      type = "drop-down",
      name = "pickup_target",
      items = {
        {"", {"inventory-target.default"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).output and "" or "tooltip.unavailable-insert-target", {"inventory-target.output"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).burnt_result and "" or "tooltip.unavailable-insert-target", {"inventory-target.burnt_result"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).modules and "" or "tooltip.unavailable-insert-target", {"inventory-target.modules"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).trash and "" or "tooltip.unavailable-insert-target", {"inventory-target.trash"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).dump and "" or "tooltip.unavailable-insert-target", {"inventory-target.dump"}}
      },
      tooltip = {"tooltip.inserter-pickup-target-tooltip"},
      selected_index = selection_indices.output[(tags or metadata).pickup_target_inventory] or 1
    }
  else
    relative["programmable-inserter-gui"].visible = true
    local sub_frame = relative["programmable-inserter-gui"]["main-frame"]["sub-frame"]

    -- update checkboxes
    sub_frame.drop_target.items = {
      {"", {"inventory-target.default"}},
      {(proxy_targets[(drop_target or {}).type] or {}).input and "" or "tooltip.unavailable-insert-target", {"inventory-target.input"}},
      {(proxy_targets[(drop_target or {}).type] or {}).fuel and "" or "tooltip.unavailable-insert-target", {"inventory-target.fuel"}},
      {(proxy_targets[(drop_target or {}).type] or {}).modules and "" or "tooltip.unavailable-insert-target", {"inventory-target.modules"}},
    }
    sub_frame.drop_target.selected_index = selection_indices.input[(tags or metadata).drop_target_inventory] or 1
    sub_frame.pickup_target.items = {
        {"", {"inventory-target.default"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).output and "" or "tooltip.unavailable-insert-target", {"inventory-target.output"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).burnt_result and "" or "tooltip.unavailable-insert-target", {"inventory-target.burnt_result"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).modules and "" or "tooltip.unavailable-insert-target", {"inventory-target.modules"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).trash and "" or "tooltip.unavailable-insert-target", {"inventory-target.trash"}},
        {(proxy_targets[(pickup_target or {}).type] or {}).dump and "" or "tooltip.unavailable-insert-target", {"inventory-target.dump"}}
    }
    sub_frame.pickup_target.selected_index = selection_indices.output[(tags or metadata).pickup_target_inventory] or 1
  end
end

-- TODO fix upgrade events breaking it

py.on_event(py.events.on_gui_opened(), function (event)
  if game.get_player(event.player_index).opened_gui_type ~= defines.gui_type.entity then return end
  update_gui(event.entity, event.player_index)
end)

py.on_event(defines.events.on_gui_closed, function (event)
  if game.get_player(event.player_index).gui.relative["programmable-inserter-gui"] and game.get_player(event.player_index).gui.relative["programmable-inserter-gui"].visible then
    game.get_player(event.player_index).gui.relative["programmable-inserter-gui"].visible = false
  end
end)

py.on_event(defines.events.on_gui_selection_state_changed, function (event)
  local element = event.element
  if not element or element.get_mod() ~= "pycoalprocessing" or element.type ~= "drop-down" then return end

  local player = game.get_player(event.player_index)
  local inserter = player.opened
  if not inserter then return end

  local selection = element.items[element.selected_index][2][1]:sub(18)
  
  if inserter.type == "entity-ghost" then
    local tags = inserter.tags or {}
    tags["py-dynamic-inserter"] = tags["py-dynamic-inserter"] or {}
    tags["py-dynamic-inserter"][element.name .. "_inventory"] = element.selected_index ~= 1 and selection or nil
    if not tags["py-dynamic-inserter"].drop_target_inventory and not tags["py-dynamic-inserter"].pickup_target_inventory then tags["py-dynamic-inserter"] = nil end
    inserter.tags = tags
  else
    local metadata = storage.programmable_inserters[inserter.unit_number] or { inserter = inserter }
    -- "default" logic
    if element.selected_index == 1 then
      -- delete proxy container and remove it's reference
      metadata[element.name].destroy()
      metadata[element.name] = nil
      metadata[element.name .. "_inventory"] = nil
      -- set target entity
      inserter[element.name] = nil
      -- remove from storage if neither exists
      if not metadata.drop_target and not metadata.pickup_target then
        storage.programmable_inserters[inserter.unit_number] = nil
      end
    else
      -- save the target inventory
      metadata[element.name .. "_inventory"] = selection
      -- create proxy container if required
      metadata[element.name] = metadata[element.name] or inserter.surface.create_entity{
        name = "py-dynamic-inserter-target",
        force = inserter.force,
        position = inserter[element.name:sub(1, -7) .. "position"]
      }
      -- set target entity
      inserter[element.name] = metadata[element.name]
      
      storage.programmable_inserters[inserter.unit_number] = metadata
      update_targets(inserter)
    end
  end

  update_gui(inserter, event.player_index)
end)

py.on_event(py.events.on_gui_click(), function (event)
  local button = event.element
  if not button or not button.valid then return end
  if button.get_mod() ~= "pycoalprocessing" then return end

  if button.name == "show-inserter-settings" then
    local base = button.parent.parent
    button.parent.visible = false
    base["main-frame"].visible = true
  elseif button.name == "hide-inserter-settings" then
    local base = button.parent.parent.parent
    button.parent.parent.visible = false
    base["mini-frame"].visible = true
  end
end)

local search_range = script.active_mods.bobinserters and 4 or script.active_mods["quick-adjustable-inserters"] and 3 or 2

py.on_event(py.events.on_built(), function (event)
  if event.entity.type == "inserter" and event.tags and event.tags["py-dynamic-inserter"] then
    -- create relevant entities
    local metadata = event.tags["py-dynamic-inserter"]
    metadata.inserter = event.entity
    for index in pairs(metadata) do
      if index:sub(-9) == "inventory" then
        metadata[index:sub(1,-11)] = event.entity.surface.create_entity{
          name = "py-dynamic-inserter-target",
          force = event.entity.force,
          position = event.entity[index:sub(1,-17) .. "position"]
        }
      end
    end
    -- save data to storage
    storage.programmable_inserters[event.entity.unit_number] = metadata
    update_targets(event.entity)
  elseif (event.entity.type ~= "car" or event.entity.name == "space-pod") and proxy_targets[event.entity.type] then
    -- connect proxies to newly created entity
    local target = event.entity
    for _, inserter in pairs(target.surface.find_entities_filtered{
      area = {
        {
          target.bounding_box.left_top.x - search_range,
          target.bounding_box.left_top.y - search_range
        },
        {
          target.bounding_box.right_bottom.x + search_range,
          target.bounding_box.right_bottom.y + search_range
        }
      },
      type = "inserter"
    }) do
      update_targets(inserter)
    end
  end
end)

py.on_event(py.events.on_destroyed(), function (event)
  if event.entity.type ~= "inserter" then return end

  for _, entity in pairs(storage.programmable_inserters[event.entity.unit_number] or {}) do
    if entity.type == "proxy-container" and entity.valid then entity.destroy() end
  end
  storage[event.entity.unit_number] = nil
end)

py.on_event(defines.events.on_player_rotated_entity, function (event)
  update_targets(event.entity)
end)

py.on_event(defines.events.on_entity_settings_pasted, function (event)
  local source = event.source
  local destination = event.destination
  local data -- store the data in an ambiguous table, save as tags or in storage depending on the destination
  -- both things must be inserters
  if (source.type == "entity-ghost" and source.ghost_type or source.type) ~= "inserter" or (destination.type == "entity-ghost" and destination.ghost_type or destination.type) ~= "inserter" then return end

  local metadata = storage.programmable_inserters[destination.unit_number]
  if source.type == "entity-ghost" then
    data = (source.tags or {})["py-dynamic-inserter"] or {}
  elseif storage.programmable_inserters[source.unit_number] then
    data = {
      drop_target_inventory = storage.programmable_inserters[source.unit_number].drop_target_inventory,
      pickup_target_inventory = storage.programmable_inserters[source.unit_number].pickup_target_inventory
    }
  end

  if destination.type == "entity-ghost" then
    local tags = (destination.tags or {}) or {}
    tags["py-dynamic-inserter"] = data
    destination.tags = tags
  else
    if not data and storage.programmable_inserters[destination.unit_number] then
      -- remove old references
      if metadata.drop_target then metadata.drop_target.destroy() end
      if metadata.pickup_target then metadata.pickup_target.destroy() end
      storage.programmable_inserters[destination.unit_number] = nil
    elseif data and storage.programmable_inserters[destination.unit_number] then
      -- just update things
      local metadata = storage.programmable_inserters[destination.unit_number]
      metadata.drop_target_inventory = data.drop_target_inventory
      if not metadata.drop_target and metadata.drop_target_inventory then
        metadata.drop_target = destination.surface.create_entity{
          name = "py-dynamic-inserter-target",
          force = destination.force,
          position = destination.drop_position
        }
        destination.drop_target = metadata.drop_target
      elseif metadata.drop_target and not metadata.drop_target_inventory then
        metadata.drop_target.destroy()
        metadata.drop_target = nil
      end
      metadata.pickup_target_inventory = data.pickup_target_inventory
      if not metadata.pickup_target and metadata.pickup_target_inventory then
        metadata.pickup_target = destination.surface.create_entity{
          name = "py-dynamic-inserter-target",
          force = destination.force,
          position = destination.pickup_position
        }
        destination.pickup_target = metadata.pickup_target
      elseif metadata.pickup_target and not metadata.pickup_target_inventory then
        metadata.pickup_target.destroy()
        metadata.pickup_target = nil
      end
      update_targets(destination)
    elseif data then
      -- add all the things
      storage.programmable_inserters[destination.unit_number] = {
        inserter = destination,
        drop_target = data.drop_target_inventory and destination.surface.create_entity{
          name = "py-dynamic-inserter-target",
          force = destination.force,
          position = destination.drop_position
        } or nil,
        drop_target_inventory = data.drop_target_inventory,
        pickup_target = data.pickup_target_inventory and destination.surface.create_entity{
          name = "py-dynamic-inserter-target",
          force = destination.force,
          position = destination.pickup_position
        } or nil,
        pickup_target_inventory = data.pickup_target_inventory
      }
      update_targets(destination)
    end
  end

end)

py.on_event(defines.events.on_player_setup_blueprint, function (event)
	local blueprint = game.get_player(event.player_index).blueprint_to_setup
  -- if normally invalid
	if not blueprint or not blueprint.valid_for_read then blueprint = game.get_player(event.player_index).cursor_stack end
  -- if non existant, cancel
  if not blueprint then return end
  local entities = blueprint.get_blueprint_entities()
  if not entities then return end
  -- update entities
  local mapping -- we might need it, might not
  for index, entity in pairs(entities) do
    -- add tags and remove proxy inventories as necessary
    if prototypes.entity[entity.name].type == "inserter" then
      mapping = mapping or event.mapping.get()
      local tags = entity.tags or {}
      if mapping[index].type == "entity-ghost" then
        tags["py-dynamic-inserter"] = (mapping[index].tags or {})["py-dynamic-inserter"]
      elseif storage.programmable_inserters[mapping[index].unit_number] then
        -- we only need to add data if data is in storage
        tags["py-dynamic-inserter"] = {
          drop_target_inventory = storage.programmable_inserters[mapping[index].unit_number].drop_target_inventory,
          pickup_target_inventory = storage.programmable_inserters[mapping[index].unit_number].pickup_target_inventory
        }
      end
      entity.tags = tags
    end
  end
  blueprint.set_blueprint_entities(entities)
end)

if script.active_mods["quick-adjustable-inserters"] then
  if defines.events.on_qai_inserter_vectors_changed then
    ---@param event EventData.on_qai_inserter_vectors_changed
    script.on_event(defines.events.on_qai_inserter_vectors_changed, function(event)
        update_targets(event.inserter)
    end)
  end

  if defines.events.on_qai_inserter_adjustment_finished then
    ---@param event EventData.on_qai_inserter_adjustment_finished
    script.on_event(defines.events.on_qai_inserter_adjustment_finished, function(event)
      update_targets(event.inserter)
    end)
  end
end

if script.active_mods["bobinserters"] and defines.events.on_bobs_inserter_adjusted then
  script.on_event(defines.events.on_bobs_inserter_adjusted, function (event)
    update_targets(event.entity)
  end)
end