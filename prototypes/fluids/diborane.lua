RECIPE {
    type = "recipe",
    name = "diborane",
    category = "hpf",
    enabled = false,
    energy_required = 7,
    ingredients = {
        {type = "fluid", name = "water", amount = 250},
        {type = "item", name = "borax", amount = 10}
    },
    results = {
        {type = "fluid", name = "diborane", amount = 150}
    }
}:add_unlock("energy-1")

FLUID {
    type = "fluid",
    name = "diborane",
    icon = "__pycoalprocessinggraphics__/graphics/icons/diborane.png",
    icon_size = 32,
    default_temperature = 15,
    base_flow_rate = 100,
    base_color = {r = 0.858, g = 0.929, b = 0.952},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    gas_temperature = 15,
    subgroup = "py-syngas",
    order = "z-[diborane]"
}
