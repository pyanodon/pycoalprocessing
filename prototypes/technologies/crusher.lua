TECHNOLOGY {
    type = "technology",
    name = "crusher",
    icon = "__pycoalprocessinggraphics__/graphics/technology/crusher.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"engine", "coal-processing-2"},
    effects = {},
    unit = {
        count = 25,
        ingredients = {
            {"automation-science-pack", 3},
            {"logistic-science-pack", 1}
        },
        time = 55
    }
}
