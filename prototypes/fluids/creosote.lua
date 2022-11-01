RECIPE {
    type = "recipe",
    name = "creosote",
    category = "tar",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "tar", amount = 100}
    },
    results = {
        {type = "fluid", name = "creosote", amount = 80}
    },
    main_product = "creosote"
}:add_unlock("creosote")

FLUID {
    type = "fluid",
    name = "creosote",
    icon = "__pycoalprocessinggraphics__/graphics/icons/creosote.png",
    icon_size = 64,
    default_temperature = 10,
    gas_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.360, g = 0.250, b = 0.070},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    subgroup = "py-fluids",
    order = "creosote"
}
