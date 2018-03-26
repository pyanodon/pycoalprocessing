TECHNOLOGY {
    type = "technology",
    name = "coal-processing-2",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-2.png",
    icon_size = 128,
    order = "c-a",
    upgrade = true,
    prerequisites = {"separation", "desulfurization"},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1}
        },
        time = 35
    }
}
