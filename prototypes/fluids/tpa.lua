RECIPE({
    type = "recipe",
    name = "tpa",
    category = "rectisol",
    enabled = false,
    energy_required = 4,
    ingredients = {
        { type = "fluid", name = "aromatics", amount = 100 },
        { type = "fluid", name = "steam",     amount = 600 },
        { type = "item",  name = "nichrome",  amount = 2 }
    },
    results = {
        { type = "fluid", name = "tpa", amount = 50 }
    }
}):add_unlock("kevlar")

FLUID({
    type = "fluid",
    name = "tpa",
    icon = "__pycoalprocessinggraphics__/graphics/icons/tpa.png",
    icon_size = 32,
    default_temperature = 10,
    gas_temperature = 15,
    base_color = { r = 0.937, g = 0.803, b = 0.007 },
    flow_color = { r = 1, g = 1, b = 1 },
    max_temperature = 100,
    subgroup = "py-syngas",
    order = "z-[tpa]"
})
