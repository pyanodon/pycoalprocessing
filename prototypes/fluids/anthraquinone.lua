RECIPE {
    type = "recipe",
    name = "anthraquinone",
    category = "rectisol",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 100},
        {type = "fluid", name = "steam", amount = 600},
        {type = "item", name = "chromium", amount = 2}
    },
    results = {
        {type = "fluid", name = "anthraquinone", amount = 50}
    }
}:add_unlock("sulfur-processing")

FLUID {
    type = "fluid",
    name = "anthraquinone",
    icon = "__pycoalprocessinggraphics__/graphics/icons/anthraquinone.png",
    icon_size = 32,
    default_temperature = 10,
    base_color = {r = 0.737, g = 0.592, b = 0.917},
    flow_color = {r = 0.737, g = 0.592, b = 0.917},
    max_temperature = 100,
    gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[anthraquinone]"
}
