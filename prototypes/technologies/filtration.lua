TECHNOLOGY {
    type = "technology",
    name = "filtration",
    icon = "__pycoalprocessinggraphics__/graphics/technology/filtration-mk01.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
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
    name = "filtration-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/technology/filtration-mk02.png",
    icon_size = 128,
    order = "c-b",
    prerequisites = {},
    dependencies = {"filtration"},
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
