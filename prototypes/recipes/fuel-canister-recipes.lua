
RECIPE {
    type = "recipe",
    name = "empty-jerry-can",
    category = "crafting",
    enabled = false,
    energy_required = 2,
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
    if fluid.fuel_value ~= nil then
        local scale
        if fluid.icon_size == 32 then
            scale = .5
        elseif fluid.icon_size == 64 then
            scale = .25
        end

        ITEM {
            type = "item",
            name = "filled-canister-" .. fluid.name,
            localised_name = {"item-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            icons = {
                {icon = "__pycoalprocessinggraphics__/graphics/icons/jerry-can.png", icon_size = 64},
                {icon = fluid.icon, icon_size = fluid.icon_size, scale = scale, shift = {7.5,7.5}}
            },
            flags = {},
            subgroup = "py-items",
            order = "canister-b-[full-gas-canister]",
            fuel_value = "10MJ",
            fuel_category = "jerry",
            burnt_result = "empty-fuel-canister",
            stack_size = 25
        }

        local fuel_amount

        if string.match(fluid.fuel_value, "KJ") ~= nil then
            fuel_amount = math.ceil(10/ (string.match(fluid.fuel_value, "[%d%.]+") / 1000))
        elseif string.match(fluid.fuel_value, "MJ") ~= nil then
            fuel_amount = math.ceil(10/ (string.match(fluid.fuel_value, "[%d%.]+")))
        end

        RECIPE {
            type = "recipe",
            name = "fill-canister-" .. fluid.name,
            localised_name = {"recipe-name.fill-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1,
            ingredients = {
                {type = "fluid", name = fluid.name, amount =  fuel_amount},
                {type = "item", name = "empty-fuel-canister", amount = 1}
            },
            results = {
                {type = "item", name = "filled-canister-" .. fluid.name, amount = 1}
            },
            --icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
            --icon_size = 32
        }:add_unlock("plastics")


        RECIPE {
            type = "recipe",
            name = "empty-canister-" .. fluid.name,
            localised_name = {"recipe-name.empty-can", fluid.localised_name or {"fluid-name." .. fluid.name}},
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 1,
            ingredients = {
                {type = "item", name = "filled-canister-" .. fluid.name, amount = 1}
            },
            results = {
                {type = "fluid", name = fluid.name, amount = fuel_amount},
                {type = "item", name = "empty-fuel-canister", amount = 1}
            },
            --icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
            --icon_size = 32,
            main_product = fluid.name,
            subgroup = "py-items",
            order = "canister-b-[empty-methanol-gas-canister]"
        }:add_unlock("plastics")

        if data.raw.item[fluid.name .. '-barrel'] ~= nil then
            if data.raw.recipe['empty-' .. fluid.name .. '-barrel'] ~= nil then
                RECIPE('empty-' .. fluid.name .. '-barrel'):remove_unlock('fluid-handling'):set_fields{hidden = true}
            end
            if data.raw.recipe['fill-' .. fluid.name .. '-barrel'] ~= nil then
                RECIPE('fill-' .. fluid.name .. '-barrel'):remove_unlock('fluid-handling'):set_fields{hidden = true}
            end
            ITEM(fluid.name .. '-barrel'):set_fields{hidden = true}
        end
    end
end
