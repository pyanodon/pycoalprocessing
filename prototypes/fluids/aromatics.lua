RECIPE {
    type = "recipe",
    name = "aromatics2",
    category = "gasifier",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 150},
        {type = "fluid", name = "water", amount = 500}, --Added Bob hydrogen
        {type = "item", name = "organics", amount = 10}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 300}
    }
}:add_unlock("advanced-oil-processing")

ITEM {
    type = "fluid",
    name = "aromatics",
    icon = "__pycoalprocessinggraphics__/graphics/icons/aromatics.png",
    icon_size = 64,
    default_temperature = 10,
    base_color = {r = 0.74, g = 0.403, b = 0.388},
    flow_color = {r = 0.74, g = 0.403, b = 0.388},
    max_temperature = 100,
    gas_temperature = 15,
    subgroup = "py-syngas",
    order = "z-[aromatics]"
}
