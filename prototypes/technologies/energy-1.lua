TECHNOLOGY {
    type = "technology",
    name = "energy-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/energy-1.png",
    icon_size = 128,
    order = "c-a",
    --upgrade = true,
    prerequisites = {"coal-processing-1"},
    effects = {},
    unit = {
        count = 30,
        ingredients = {
            {"automation-science-pack", 1}
        },
        time = 45
    }
}
