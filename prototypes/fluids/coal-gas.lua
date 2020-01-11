RECIPE {
    type = "recipe",
    name = "coal-gas",
    category = "distilator",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "coal", amount = 10}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 40},
        {type = "fluid", name = "tar", amount = 50},
        {type = "item", name = "iron-oxide", amount = 1, probability = 0.3},
        {type = "item", name = "coke", amount = 6}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-coal.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "e"
}

RECIPE {
    type = "recipe",
    name = "coal-gas-from-wood",
    category = "distilator",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "wood", amount = 10}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 10},
        {type = "fluid", name = "tar", amount = 30},
        {type = "item", name = "iron-oxide", amount = 1, probability = 0.3},
        {type = "item", name = "coal", amount = 10}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-wood.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "coal-gas-from-coke",
    category = "distilator",
    enabled = true,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "coke", amount = 20}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 20},
        {type = "fluid", name = "tar", amount = 20},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-coke.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "f"
}

FLUID {
    type = "fluid",
    name = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.921, g = 0.776, b = 0.541},
    flow_color = {r = 0.921, g = 0.776, b = 0.541},
    max_temperature = 100,
    gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "a-[coal-gas]"
}
