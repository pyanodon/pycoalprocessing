local Skipped_fluids =
    {
        hydrogen = true
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
    if fluid.fuel_value ~= nil and Skipped_fluids[fluid.name] ~= true and fluid.auto_barrel ~= false then

        local fluid_icon = table.deepcopy(fluid.icons) or {{icon = fluid.icon}}
        -- Apply to each layer
        for _, icon in pairs(fluid_icon) do
            icon.icon_size = icon.icon_size or fluid_icon.icon_size or fluid.icon_size
            icon.scale = 16 / icon.icon_size -- 32 = 0.5, 64 = 0.25
        end

        ITEM {
            type = "item",
            name = fluid.name .. "-canister",
            localised_name = {"item-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            icons = util.combine_icons(
                {{icon = "__pycoalprocessinggraphics__/graphics/icons/jerry-can.png", icon_size = 64}},
                fluid_icon,
                {shift = {0, 2}}
            ),
            flags = {},
            subgroup = "py-items",
            order = "canister-b-[full-gas-canister]",
            fuel_value = "10MJ",
            fuel_category = "jerry",
            burnt_result = "empty-fuel-canister",
            stack_size = 20,
            ignore_for_dependencies = true
        }

        local fuel_amount

        if string.match(fluid.fuel_value, "KJ") ~= nil then
            fuel_amount = math.ceil(10/ (string.match(fluid.fuel_value, "[%d%.]+") / 1000))
        elseif string.match(fluid.fuel_value, "MJ") ~= nil then
            fuel_amount = math.ceil(10/ (string.match(fluid.fuel_value, "[%d%.]+")))
        end

        RECIPE {
            type = "recipe",
            name = "fill-" .. fluid.name .. "-canister",
            localised_name = {"recipe-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "fluid", name = fluid.name, amount =  fuel_amount},
                {type = "item", name = "empty-fuel-canister", amount = 1}
            },
            results = {
                {type = "item", name = fluid.name .. "-canister", amount = 1}
            },
            ignore_for_dependencies = true
            --icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
            --icon_size = 32
        }:add_unlock("plastics")


        RECIPE {
            type = "recipe",
            name = "empty-" .. fluid.name .. "-canister",
            localised_name = {"recipe-name.empty-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            icons = util.combine_icons(
                {
                    {icon = "__pycoalprocessinggraphics__/graphics/empty.png", icon_size = 32},
                    {icon = "__pycoalprocessinggraphics__/graphics/icons/empty-jerrycan.png", icon_size = 64, scale= 0.4, shift = {-6.4, -6.4}},
                },
                fluid_icon,
                {shift = {7.5, 7.5}}
            ),
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 0.2,
            ingredients = {
                {type = "item", name = fluid.name .. "-canister", amount = 1}
            },
            results = {
                {type = "fluid", name = fluid.name, amount = fuel_amount},
                {type = "item", name = "empty-fuel-canister", amount = 1}
            },
            ignore_for_dependencies = true,
            --icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
            --icon_size = 32,
            main_product = fluid.name,
            subgroup = "py-items",
            order = "canister-b-[empty-methanol-gas-canister]"
        }:add_unlock("plastics")
    end

    if data.raw.recipe['empty-' .. fluid.name .. '-barrel'] ~= nil then
        RECIPE('empty-' .. fluid.name .. '-barrel'):set_fields{ ignore_for_dependencies = true }
    end
    if data.raw.recipe['fill-' .. fluid.name .. '-barrel'] ~= nil then
        RECIPE('fill-' .. fluid.name .. '-barrel'):set_fields{ ignore_for_dependencies = true }
    end
    if data.raw.item[fluid.name .. '-barrel'] ~= nil then
        ITEM(fluid.name .. '-barrel'):set_fields{ ignore_for_dependencies = true }
    end
end
