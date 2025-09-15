TECHNOLOGY {
    type = "technology",
    name = "coal-processing-3",
    icon = "__pycoalprocessinggraphics__/graphics/technology/coal-processing-3.png",
    icon_size = 128,
    order = "c-a",
    --upgrade = true,
    prerequisites = {"coal-processing-2"},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack",   1},
            {"chemical-science-pack",   2}
        },
        time = 35
    }
}
