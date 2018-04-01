RECIPE {
    type = "recipe",
    name = "treated-wood",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "creosote", amount = 100},
        {type = "item", name = "wood", amount = 1}
    },
    results = {
        {type = "item", name = "treated-wood", amount = 2}
    }
}:add_unlock("coal-processing-1")

ITEM {
    type = "item",
    name = "treated-wood",
    icon = "__pycoalprocessing__/graphics/icons/treated-wood.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "treated-wood",
    fuel_value = "3MJ",
    fuel_category = "chemical",
    stack_size = 100
}
