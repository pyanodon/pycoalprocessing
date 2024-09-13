RECIPE {
    type = "recipe",
    name = "methanol-from-syngas",
    category = "methanol",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 150},
        {type = "item", name = "copper-plate", amount = 3},
        {type = "item", name = "iron-plate", amount = 1} --bob zinc-plate
    },
    results = {
        {type = "fluid", name = "methanol", amount = 150}
    },
    subgroup = "py-methanol",
    order = "a"
}:add_unlock("methanol-processing-1")

RECIPE {
    type = "recipe",
    name = "oleo-methanol",
    category = "methanol",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 100},
        {type = "item", name = "chromium", amount = 5}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 250},
        {type = "fluid", name = "water", amount = 150}
    },
    main_product = "methanol",
    icon = "__pycoalprocessinggraphics__/graphics/icons/methanol-oleochemicals.png",
    icon_size = 32,
    subgroup = "py-methanol",
    order = "c"
}:add_unlock("methanol-processing-2")

--bob-additions: methanol_from_hydrogen

FLUID {
    type = "fluid",
    name = "methanol",
    icon = "__pycoalprocessinggraphics__/graphics/icons/methanol.png",
    icon_size = 32,
    default_temperature = 10,
    gas_temperature = 15,
    heat_capacity = "1kJ",
    base_color = {r = 0.231, g = 0.776, b = 0.333},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    subgroup = "py-fluids",
}
