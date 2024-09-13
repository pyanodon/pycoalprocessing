RECIPE {
    type = "recipe",
    name = "coal-slurry",
    category = "fluid-separator",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "dirty-water-heavy", amount = 250}
    },
    results = {
        {type = "fluid", name = "water", amount = 100},
        {type = "fluid", name = "coal-slurry", amount = 150}
    },
    main_product = "coal-slurry"
}:add_unlock("fluid-separation")

FLUID {
    type = "fluid",
    name = "coal-slurry",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coal-slurry.png",
    icon_size = 32,
    default_temperature = 10,
    base_flow_rate = 100,
    heat_capacity = "1kJ",
    base_color = {r = 0.247, g = 0.247, b = 0.247},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 100,
    gas_temperature = 15,
    subgroup = "py-syngas",
    order = "z-[coal-slurry]"
}
