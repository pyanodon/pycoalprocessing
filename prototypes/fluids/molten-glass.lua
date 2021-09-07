
RECIPE {
    type = "recipe",
    name = "glass",
    category = 'glassworks',
    enabled = true,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "sand", amount = 20},
    },
    results = {
        {type = "fluid", name = "molten-glass", amount = 20}
    },
    main_product= "molten-glass",
    subgroup = "py-items",
    order = "aac"
}

RECIPE {
    type = "recipe",
    name = "glass-2",
    category = 'glassworks',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "powdered-quartz", amount = 2},
        {type = "item", name = "pure-sand", amount = 10},
    },
    results = {
        {type = "fluid", name = "molten-glass", amount = 50}
    },
    main_product= "molten-glass",
    subgroup = "py-items",
    order = "aac"
}:add_unlock("advanced-material-processing")


FLUID {
    type = "fluid",
    name = "molten-glass",
    icon = "__pycoalprocessinggraphics__/graphics/icons/molten-glass.png",
	icon_size = 64,
    default_temperature = 10, -- less than 15 = liquid / equal a 15 = gas
    base_color = {r = 0.7, g = 0.7, b = 0.7},
    flow_color = {r = 0.7, g = 0.7, b = 0.7},
    max_temperature = 100,
    gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-items",
    order = "c"
}
