if not settings.startup["generator-equipment-manager"].value then return end

---@param player LuaPlayer
local function empty_generator_equipment(player)
    if not player.character then return end

    local grid = player.character.grid
    if not grid then return end
    local inventory = player.get_main_inventory()
    if not inventory then return end

    for _, equipment in pairs(grid.equipment) do
        if equipment.type ~= "generator-equipment" or equipment.prototype.hidden then goto continue end
        local burner = equipment.burner
        local burnt_result_inventory = burner and burner.burnt_result_inventory
        if not burnt_result_inventory then goto continue end

        for i = 1, #burnt_result_inventory do
            local stack = burnt_result_inventory[i]
            if stack.valid_for_read then
                stack.count = stack.count - inventory.insert(stack)
            end
        end
        ::continue::
    end
end

py.register_on_nth_tick(251, "generator-equipment-autofill", "pycp", function()
    if not script.active_mods["pyindustry"] then return end
    for _, player in pairs(game.connected_players) do
        empty_generator_equipment(player)
    end
end)