TECHNOLOGY {
    type = "technology",
    name = "cooling-tower",
    icon = "__pycoalprocessing__/graphics/technology/cooling-tower.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"electric-engine", "coal-processing-1"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "cooling-tower-mk01"
        },
        {
            type = "unlock-recipe",
            recipe = "cooling-tower-mk02"
        },
        {
            type = "unlock-recipe",
            recipe = "cooling-water"
        }
    },
    unit = {
        count = 20,
        ingredients = {
            {"science-pack-1", 2},
            {"science-pack-2", 1}
        },
        time = 45
    }
}
