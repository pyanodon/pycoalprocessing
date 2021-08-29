TECHNOLOGY {
    type = "technology",
    name = "filtration",
    icon = "__pycoalprocessinggraphics__/graphics/technology/filtration.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2", "wood-processing-2"},
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

TECHNOLOGY {
    type = "technology",
    name = "filtration-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/filtration-2.png",
    icon_size = 128,
    order = "c-b",
    prerequisites = {"chemical-science-pack"},
    effects = {},
    unit = {
        count = 40,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        time = 60
    }
}
