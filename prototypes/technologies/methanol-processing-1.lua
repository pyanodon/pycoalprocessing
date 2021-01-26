TECHNOLOGY {
    type = "technology",
    name = "methanol-processing-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/methanol-processing-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-1", "logistic-science-pack"},
    --upgrade = true,
    effects = {},
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 30
    }
}
