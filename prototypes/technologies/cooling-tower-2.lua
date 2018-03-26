TECHNOLOGY {
    type = "technology",
    name = "cooling-tower-2",
    icon = "__pycoalprocessing__/graphics/technology/cooling-towermk02.png",
    icon_size = 128,
    order = "c-a",
    upgrade = true,
    prerequisites = {"coal-processing-2"},
    effects = {},
    unit = {
        count = 20,
        ingredients = {
            {"science-pack-1", 2},
            {"science-pack-2", 1}
        },
        time = 45
    }
}
