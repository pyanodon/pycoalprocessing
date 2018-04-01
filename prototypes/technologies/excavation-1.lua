TECHNOLOGY {
    type = "technology",
    name = "excavation-1",
    icon = "__pycoalprocessing__/graphics/technology/excavation-1.png",
    icon_size = 128,
    order = "c-a",
    upgrade = true,
    prerequisites = {"coal-processing-3"}, --bob titatnium-processing
    effects = {},
    unit = {
        count = 45,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1}
        },
        time = 35
    }
}
