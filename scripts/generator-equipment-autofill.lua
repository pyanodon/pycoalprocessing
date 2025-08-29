local SHORTCUT = "py-toggle-equipment-fuel-manager"

local function restock_generator_equipment(player)
    if not player.character then return end
    if not player.is_shortcut_toggled(SHORTCUT) then return end

    local grid = player.character.grid
    if not grid then return end
    local inventory = player.get_main_inventory()
    if not inventory then return end
    local burners = {}
    local burner_count = 0

    for _, equipment in pairs(grid.equipment) do
        do
            if equipment.type ~= "generator-equipment" then goto continue end
            if equipment.prototype.hidden then goto continue end
            local burner = equipment.burner
            if not burner then goto continue end
            local burner_inventory, burnt_result_inventory = burner.inventory, burner.burnt_result_inventory
            if not burner_inventory then goto continue end

            if burnt_result_inventory then
                for i = 1, #burnt_result_inventory do
                    local stack = burnt_result_inventory[i]
                    if stack.valid_for_read then
                        stack.count = stack.count - inventory.insert(stack)
                    end
                end
            end

            if not burner_inventory.is_full() then
                -- Save for adding fuel
                burner_count = burner_count + 1
                burners[burner_count] = {
                    equipment = equipment,
                    burner_inventory = burner_inventory,
                    fuel_categories = burner.fuel_categories,
                }
            end
        end
        ::continue::
    end

    -- add fuel if not full
    if burner_count > 0 then
        local burner_index_offset = 0
        for _, item_stack in pairs(inventory.get_contents()) do
            ::again::
            local inserted_some = false
            for i = 1, burner_count do
                local index = i + burner_index_offset
                -- Simple modulo (should only loop once normally and twice in edge case where index equals burner_index_offset and that burner is filled)
                while index > burner_count do
                    index = index - burner_count
                end
                local burner_data = burners[index]
                if burner_data.fuel_categories[prototypes.item[item_stack.name].fuel_category] then
                    local item_stack_size = prototypes.item[item_stack.name].stack_size
                    local inserted_count = burner_data.burner_inventory.insert{
                            name = item_stack.name,
                            quality = item_stack.quality,
                            count = math.min(item_stack.count, item_stack_size)
                        }
                    if inserted_count ~= 0 then -- if items were inserted then remove them from the player's inventory
                        inventory.remove{
                            name = item_stack.name,
                            quality = item_stack.quality,
                            count = inserted_count
                        }
                        -- Manually adjust item stack for iteration
                        item_stack.count = item_stack.count - inserted_count
                        inserted_some = true
                    end
                    -- if now full, remove the burner data from the list by swapping with last item
                    if burner_data.burner_inventory.is_full() then
                        burners[index] = burners[burner_count]
                        burners[burner_count] = nil
                        burner_count = burner_count - 1
                    end
                    -- if all burners are full, end inventory iteration early
                    if burner_count == 0 then break end
                    -- If none left in the stack, move onto next inventory item, otherwise try the next burner
                    if item_stack.count == 0 then break end
                end
            end

            -- if all burners are full, end inventory iteration early
            if burner_count == 0 then break end

            -- We inserted soe of the items, but there's more we could insert. Try again
            if inserted_some and item_stack.count ~= 0 then goto again end
        end
    end

    -- Check remaining unfilled burners to see if any are empty
    for _, burner_data in pairs(burners) do
        if burner_data.burner_inventory.is_empty() then
            -- https://github.com/pyanodon/pybugreports/issues/877
            pcall(
                player.add_custom_alert,
                player.character,
                {type = "virtual", name = "no-fuel"},
                {"alerts.equipment-out-of-fuel", burner_data.equipment.prototype.take_result.name, burner_data.equipment.prototype.localised_name},
                false
            )
            break
        end
    end
end

py.register_on_nth_tick(251, "generator-equipment-autofill", "pycp", function()
    if not script.active_mods["pyindustry"] then return end
    for _, player in pairs(game.connected_players) do
        restock_generator_equipment(player)
    end
end)

py.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name ~= SHORTCUT then return end
    local player = game.get_player(event.player_index)

    player.set_shortcut_toggled(SHORTCUT, not player.is_shortcut_toggled(SHORTCUT))
end)
