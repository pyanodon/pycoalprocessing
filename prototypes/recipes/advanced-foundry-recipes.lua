--NEXELIT PLATE
RECIPE {
    type = "recipe",
    name = "nexelit-plate",
    category = "advanced-foundry",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "nexelit-ore", amount = 2},
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "item", name = "limestone", amount = 2},
        {type = "item", name = "sand-casting", amount = 1}
    },
    results = {
        {type = "item", name = "nexelit-plate", amount = 4}
    },
    main_product = "nexelit-plate",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a1"
}:add_unlock("coal-processing-3")

--STEEL PLATE - cant change the base one,so i did that.
RECIPE {
    type = "recipe",
    name = "steel-plate2",
    category = "advanced-foundry",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "crushed-iron", amount = 2},
        {type = "item", name = "coke", amount = 2},
        {type = "item", name = "fuelrod-mk01", amount = 1},
        {type = "item", name = "limestone", amount = 2},
        {type = "item", name = "sand-casting", amount = 1}
    },
    results = {
        {type = "item", name = "steel-plate", amount = 12}
    },
    main_product = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a2"
}:add_unlock("coal-processing-3")

--Make foundry recipes from smelting recipes with 1 ingredient.
log("Creating additional foundry recipes")

local _filter_ing = function(v)
    return v.category == "smelting" and (v.ingredients and #v.ingredients == 1 or v.normal and v.normal.ingredients and #v.normal.ingredients == 1)
end

local function multiply(tab, count)
    for _, result in pairs(tab) do
        if result.amount then
            result.amount = result.amount * count
        elseif type(result[2]) == 'number' then
            result[2] = result[2] * count
        end
    end
    return tab
end

local function get_main(tab)
    return tab[#tab].name or tab[#tab][1]
end

if not mods["pyrawores"] and not mods["PyCoalTBaA"] then
    local table = require('__stdlib__/stdlib/utils/table')

    for _, recipe in pairs(table.filter(data.raw.recipe, _filter_ing)) do
        local ing1 = (recipe.ingredients and recipe.ingredients[1].name and recipe.ingredients[1]) or (recipe.ingredients and {type = "item", name = recipe.ingredients[1][1], amount = recipe.ingredients[1][2] * 5})
        ing1 = ing1 or (recipe.normal and recipe.normal.ingredients and recipe.normal.ingredients[1].name and recipe.normal.ingredients[1]) or (recipe.normal and {type = "item", name = recipe.normal.ingredients[1][1], amount = recipe.normal.ingredients[1][2] * 5})

        local res
        if recipe.result then
            res = {{type = "item", name = recipe.result or recipe.result[1], amount = 12}}
        elseif recipe.results then
            res = multiply(table.deepcopy(recipe.results), 12)
        elseif recipe.normal.result then
            res = {{type = "item", name = recipe.normal.result or recipe.normal.result[1], amount = 12}}
        elseif recipe.normal.results then
            res = multiply(table.deepcopy(recipe.normal.results), 12)
        end

        RECIPE {
            type = "recipe",
            name = "advanced-foundry-" .. recipe.name,
            category = "advanced-foundry",
            enabled = true,
            energy_required = 3,
            ingredients = {
                ing1,
                {type = "item", name = "fuelrod-mk01", amount = 1},
                {type = "item", name = "limestone", amount = 2},
                {type = "item", name = "sand-casting", amount = 1}
            },
            results = res,
            icon = recipe.icon,
            icons = recipe.icons,
            icon_size = 32,
            main_product = recipe.main_product or #res > 1 and get_main(res) or nil
        }
    end
end
