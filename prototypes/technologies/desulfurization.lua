TECHNOLOGY {
    type = "technology",
    name = "desulfurization",
    icon = "__pycoalprocessinggraphics__/graphics/technology/desulfurization.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"oil-processing", "coal-processing-1"},
    effects = {},
    unit = {
        count = 10,
        ingredients = {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 1}
        },
        time = 45
    }
}
