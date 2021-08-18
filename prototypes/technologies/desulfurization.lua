TECHNOLOGY {
    type = "technology",
    name = "desulfurization",
    icon = "__pycoalprocessinggraphics__/graphics/technology/desulfurization.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"oil-processing", "filtration-2"},
    effects = {},
    unit = {
        count = 10,
        ingredients = {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        time = 45
    }
}
