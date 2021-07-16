TECHNOLOGY {
    type = "technology",
    name = "niobium",
    icon = "__pycoalprocessinggraphics__/graphics/technology/niobium.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"crusher", "separation", "filtration", "chromium","coal-processing-2"},
    effects = {},
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}

        },
        time = 60
    }
}
