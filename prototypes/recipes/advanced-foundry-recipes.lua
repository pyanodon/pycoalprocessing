--NEXELIT PLATE
RECIPE {
    type = "recipe",
    name = "nexelit-plate",
    category = "advanced-foundry",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item",  name = "nexelit-ore",   amount = 4},
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "item",  name = "limestone",     amount = 2},
        {type = "item",  name = "sand-casting",  amount = 1}
    },
    results = {
        {type = "item", name = "nexelit-plate", amount = 4}
    },
    main_product = "nexelit-plate",
    icon = "__pycoalprocessinggraphics__/graphics/icons/nexelit-plate.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a1"
}:add_unlock("nexelit")

if mods.pyrawores then
    data.raw.recipe["nexelit-plate"] = nil
end

--STEEL PLATE - cant change the base one,so i did that.
RECIPE {
    type = "recipe",
    name = "steel-plate2",
    category = "advanced-foundry",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "crushed-iron", amount = 15},
        {type = "item", name = "coke",         amount = 2},
        {type = "item", name = "fuelrod-mk01", amount = 1},
        {type = "item", name = "limestone",    amount = 2},
        {type = "item", name = "sand-casting", amount = 1}
    },
    results = {
        {type = "item", name = "steel-plate", amount = 12}
    },
    main_product = "steel-plate",
    icon = "__base__/graphics/icons/steel-plate.png",
    icon_size = 64,
    subgroup = "py-items",
    order = "a2"
}:add_unlock("advanced-material-processing-2")
