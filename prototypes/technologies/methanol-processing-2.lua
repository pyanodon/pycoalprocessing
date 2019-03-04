TECHNOLOGY {
    type = "technology",
    name = "methanol-processing-2",
    icon = "__pycoalprocessing__/graphics/technology/methanol-processing-2.png",
    icon_size = 128,
    order = "c-b",
    prerequisites = {"methanol-processing-1"},
    upgrade = true,
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 35
    }
}
