TECHNOLOGY {
    type = "technology",
    name = "rare-earth",
    icon = "__pycoalprocessing__/graphics/technology/rare-earth-tech.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "rare-earth-extractor"
        },
        {
            type = "unlock-recipe",
            recipe = "rare-earth-powder"
        },
        {
            type = "unlock-recipe",
            recipe = "rare-earth-dust"
        },
        {
            type = "unlock-recipe",
            recipe = "rare-earth-beneficiation"
        }
    },
    unit = {
        count = 40,
        ingredients = {
            {"science-pack-1", 3},
            {"science-pack-2", 2},
            {"science-pack-3", 1}
        },
        time = 55
    }
}
