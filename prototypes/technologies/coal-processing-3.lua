TECHNOLOGY {
    type = "technology",
    name = "coal-processing-3",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-3.png",
    icon_size = 128,
    order = "c-a",
    upgrade = true,
    prerequisites = {"methanol-processing-2"},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 2}
        },
        time = 35
    }
}
