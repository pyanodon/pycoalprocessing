TECHNOLOGY {
    type = "technology",
    name = "methanol-processing-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/methanol-processing-2.png",
    icon_size = 128,
    order = "c-b",
    prerequisites = {"chemical-science-pack"},
    --upgrade = true,
    effects = {},
    unit = {
        count = 150,
        ingredients = {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 2},
            {"chemical-science-pack", 1}
        },
        time = 35
    }
}
