RECIPE({
    type = "recipe",
    name = "hydrogen-peroxide",
    category = "carbonfilter",
    enabled = false,
    energy_required = 2.7,
    ingredients = {
        { type = "fluid", name = "anthraquinone", amount = 100 },
        { type = "item",  name = "iron-plate",    amount = 5 }
    },
    results = {
        { type = "fluid", name = "hydrogen-peroxide", amount = 50 }
    }
}):add_unlock("sulfur-processing")

FLUID({
    type = "fluid",
    name = "hydrogen-peroxide",
    icon = "__pycoalprocessinggraphics__/graphics/icons/hydrogen-peroxide.png",
    icon_size = 32,
    default_temperature = 10,
    gas_temperature = 15,
    base_color = { r = 0.674, g = 1, b = 0.929 },
    flow_color = { r = 1, g = 1, b = 1 },
    max_temperature = 100,
    subgroup = "py-syngas",
    order = "z-[hydrogen-peroxide]"
})
