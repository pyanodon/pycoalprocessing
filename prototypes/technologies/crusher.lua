TECHNOLOGY {
    type = "technology",
    name = "crusher",
    icon = "__pycoalprocessing__/graphics/technology/crusher.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"engine", "coal-processing-2"},
    effects = {},
    unit = {
        count = 25,
        ingredients = {
            {"science-pack-1", 3},
            {"science-pack-2", 1}
        },
        time = 55
    }
}
