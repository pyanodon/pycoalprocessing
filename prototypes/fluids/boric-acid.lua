RECIPE {
    type = "recipe",
    name = "boric-acid",
    category = "gasifier", --bob electrolysis
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "diborane", amount = 100},
        {type = "fluid", name = "water",    amount = 500}
    },
    results = {
        {type = "fluid", name = "boric-acid", amount = 500}
    }
}:add_unlock("lab-instrument")

FLUID {
    type = "fluid",
    name = "boric-acid",
    icon = "__pycoalprocessinggraphics__/graphics/icons/boric-acid.png",
    icon_size = 32,
    default_temperature = 10,
    base_color = {r = 0.662, g = 0.752, b = 0.764},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    gas_temperature = 15,
    subgroup = "py-syngas",
    order = "z-[boric-acid]"
}
