TECHNOLOGY {
    type = "technology",
    name = "excavation-2",
    icon = "__pycoalprocessing__/graphics/technology/excavation-2.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"excavation-1"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "mining-stone"
        },
        {
            type = "unlock-recipe",
            recipe = "mining-limestone"
        }
    },
    unit = {
        count = 50,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 1}
        },
        time = 35
    }
}
