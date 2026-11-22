local skipped_fluids = {
    hydrogen = true,
    ["pressured-hydrogen"] = true
}

RECIPE {
    type = "recipe",
    name = "empty-jerry-can",
    category = "crafting",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "plastic-bar", amount = 2}
    },
    results = {
        {type = "item", name = "empty-fuel-canister", amount = 1}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/jerry-can.png",
    icon_size = 64,
    subgroup = "py-items",
    order = "c [methanol]"
}:add_unlock("plastics")

for f, fluid in pairs(data.raw.fluid) do
    if fluid.fuel_value and not skipped_fluids[fluid.name] and fluid.auto_barrel ~= false then
        local fluid_icon = table.deepcopy(fluid.icons) or {{icon = fluid.icon}}
        -- Apply to each layer
        for _, icon in pairs(fluid_icon) do
            icon.icon_size = icon.icon_size or fluid_icon.icon_size or fluid.icon_size or 64
            icon.scale = 16 / icon.icon_size -- 32 = 0.5, 64 = 0.25
        end

        local recipe_icon = {
            {icon = "__pycoalprocessinggraphics__/graphics/empty.png",                icon_size = 32},
            {icon = "__pycoalprocessinggraphics__/graphics/icons/empty-jerrycan.png", icon_size = 64, scale = 0.4, shift = {-6.4, -6.4}},
        }

        local icons = {{icon = "__pycoalprocessinggraphics__/graphics/icons/jerry-can.png", icon_size = 64}}

        for _, icon in pairs(fluid_icon) do
            icon.shift = icon.shift or {}
            local x, y = icon.shift[1] or icon.shift.x or 0, icon.shift[2] or icon.shift.y or 0
            icon.shift = {x, y + 2}
            table.insert(icons, icon)
            local icon = table.deepcopy(icon)
            icon.shift = {x + 7.5, y + 7.5}
            table.insert(recipe_icon, icon)
        end

        ITEM {
            type = "item",
            name = fluid.name .. "-canister",
            localised_name = {"item-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            icons = icons,
            flags = {},
            subgroup = "py-cans",
            order = "canister-b-[full-gas-canister]",
            fuel_value = "10MJ",
            fuel_category = "jerry",
            burnt_result = "empty-fuel-canister",
            stack_size = 20,
            autotech_ignore = true,
            unlock_results = false
        }

        local fuel_amount = 50
        if string.match(fluid.fuel_value, "[kK]J") then
            fuel_amount = math.ceil(10 / (string.match(fluid.fuel_value, "[%d%.]+") / 1000))
        elseif string.match(fluid.fuel_value, "[mM]J") then
            fuel_amount = math.ceil(10 / (string.match(fluid.fuel_value, "[%d%.]+")))
        end

        RECIPE {
            type = "recipe",
            name = "fill-" .. fluid.name .. "-canister",
            localised_name = {"recipe-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "fluid", name = fluid.name,            amount = fuel_amount},
                {type = "item",  name = "empty-fuel-canister", amount = 1}
            },
            results = {
                {type = "item", name = fluid.name .. "-canister", amount = 1}
            },
            autotech_ignore = true
        }:add_unlock("plastics")


        RECIPE {
            type = "recipe",
            name = "empty-" .. fluid.name .. "-canister",
            localised_name = {"recipe-name.empty-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            icons = recipe_icon,
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "item", name = fluid.name .. "-canister", amount = 1}
            },
            results = {
                {type = "fluid", name = fluid.name,            amount = fuel_amount},
                {type = "item",  name = "empty-fuel-canister", amount = 1}
            },
            autotech_ignore = true,
            unlock_results = false,
            main_product = fluid.name,
            subgroup = "py-items",
            order = "canister-b-[empty-methanol-gas-canister]"
        }:add_unlock("plastics")
    end
end
