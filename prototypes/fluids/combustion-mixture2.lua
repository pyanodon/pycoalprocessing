RECIPE {
    type = "recipe",
    name = "combustion-mixture2",
    category = "combustion",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 100},
        {type = "fluid", name = "water",     amount = 500},
        {type = "fluid", name = "light-oil", amount = 50},
        {type = "item",  name = "nichrome",  amount = 10}
    },
    results = {
        {type = "fluid", name = "combustion-mixture2", amount = 200},
        {type = "fluid", name = "water",               amount = 500, temperature = 100}
    },
    main_product = "combustion-mixture2"
}

FLUID {
    type = "fluid",
    name = "combustion-mixture2",
    icon = "__pycoalprocessinggraphics__/graphics/icons/combustion-mixture2.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1kJ",
    base_color = {r = 0.811, g = 0.325, b = 0.0},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    gas_temperature = 15,
    subgroup = "py-syngas",
    order = "z-[combustion-mixture2]"
}
