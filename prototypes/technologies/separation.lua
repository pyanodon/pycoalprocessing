TECHNOLOGY {
    type = "technology",
    name = "separation",
    icon = "__pycoalprocessinggraphics__/graphics/technology/separation.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"automation", "coal-processing-1"},
    effects = {},
    unit = {
        count = 35,
        ingredients = {
            {"automation-science-pack", 2}
        },
        time = 55
    }
}
