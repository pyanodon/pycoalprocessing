TECHNOLOGY {
    type = "technology",
    name = "coal-processing-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/coal-processing-2.png",
    icon_size = 128,
    order = "c-a",
    upgrade = true,
    prerequisites = {"separation", "desulfurization"},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 35
    }
}
