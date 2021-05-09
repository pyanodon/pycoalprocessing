TECHNOLOGY {
    type = "technology",
    name = "coal-processing-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/coal-processing-1.png",
    icon_size = 128,
    order = "c-a",
    --upgrade = true,
    prerequisites = {"steel-processing"},
    effects = {},
    unit = {
        count = 30,
        ingredients = {
            {"automation-science-pack", 1}
        },
        time = 35
    }
}
