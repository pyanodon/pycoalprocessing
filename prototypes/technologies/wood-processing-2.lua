TECHNOLOGY {
    type = "technology",
    name = "wood-processing-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/wood-processing-2.png",
    icon_size = 128,
    order = "c-a",
    --upgrade = true,
    prerequisites = {"wood-processing", "logistic-science-pack"},
    effects = {},
    unit = {
        count = 30,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 45
    }
}
