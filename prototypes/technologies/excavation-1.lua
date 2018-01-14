Technology {
    type = "technology",
    name = "excavation-1",
    icon = "__pycoalprocessing__/graphics/technology/excavation-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-3"}, --bob titatnium-processing
    effects = {
        {
            type = "unlock-recipe",
            recipe = "ground-borer"
        },
        {
            type = "unlock-recipe",
            recipe = "mining-nexelit"
        },
        {
            type = "unlock-recipe",
            recipe = "sand-extractor"
        },
        {
            type = "unlock-recipe",
            recipe = "extract-sand"
        },
        {
            type = "unlock-recipe",
            recipe = "extract-gravel"
        },
        {
            type = "unlock-recipe",
            recipe = "extract-stone"
        },
        {
            type = "unlock-recipe",
            recipe = "extract-coarse"
        },
        {
            type = "unlock-recipe",
            recipe = "extract-richdust"
        }
    },
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
