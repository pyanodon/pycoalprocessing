local SHORTCUT = "py-toggle-equipment-fuel-manager"

local function restock_generator_equipment(player)
    if not player.character then return end
    if not player.is_shortcut_toggled(SHORTCUT) then return end

    local grid = player.character.grid
    if not grid then return end
    local inventory = player.get_main_inventory()
    if not inventory then return end

    for _, equipment in pairs(grid.equipment) do
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

        if burner_inventory.is_empty() then
            local fuel_categories = burner.fuel_categories
            for i = 1, math.max(100, #inventory) do
                local stack = inventory[i]
                if stack.valid_for_read and fuel_categories[stack.prototype.fuel_category] then
                    local inserted_count = burner_inventory.insert(stack)
                    if inserted_count ~= 0 then
                        stack.count = stack.count - inserted_count
                        goto added_fuel
                    end
                end
            end

            -- https://github.com/pyanodon/pybugreports/issues/877
            pcall(
                player.add_custom_alert,
                player.character,
                {type = "virtual", name = "no-fuel"},
                {"alerts.equipment-out-of-fuel", equipment.prototype.take_result.name, equipment.prototype.localised_name},
                false
            )

            ::added_fuel::
        end

        ::continue::
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
