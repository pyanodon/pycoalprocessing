TECHNOLOGY {
    type = "technology",
    name = "excavation-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/excavation-2.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"excavation-1", "chemical-science-pack"},
    --upgrade = true,
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
        time = 35
    }
}
