TECHNOLOGY {
    type = "technology",
    name = "desulfurization",
    icon = "__pycoalprocessing__/graphics/technology/desulfurization.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"sulfur-processing", "fluid-handling", "coal-processing-1"},
    effects = {},
    unit = {
        count = 10,
        ingredients = {
            {"science-pack-1", 2},
            {"science-pack-2", 1}
        },
        time = 45
    }
}
