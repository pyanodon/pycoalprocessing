TECHNOLOGY {
    type = "technology",
    name = "filtration",
    icon = "__pycoalprocessing__/graphics/technology/filtration.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2"},
    effects = {},
    unit = {
        count = 40,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 55
    }
}
