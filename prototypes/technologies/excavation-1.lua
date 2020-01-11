TECHNOLOGY {
    type = "technology",
    name = "excavation-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/excavation-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-3"},
    effects = {},
    unit = {
        count = 45,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        time = 35
    }
}
