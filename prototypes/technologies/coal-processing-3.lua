local technology = {
    type = "technology",
    name = "coal-processing-3",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-3.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2", "methanol-processing-2"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "nexelit-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "steel-plate2"
        },
        {
            type = "unlock-recipe",
            recipe = "tar-oil"
        },
        {
            type = "unlock-recipe",
            recipe = "sand-casting"
        },
        {
            type = "unlock-recipe",
            recipe = "hydrogen-peroxide"
        },
        {
            type = "unlock-recipe",
            recipe = "lithium-peroxide"
        },
        {
            type = "unlock-recipe",
            recipe = "co2-absorber"
        },
        {
            type = "unlock-recipe",
            recipe = "co2"
        },
        {
            type = "unlock-recipe",
            recipe = "glycerol-hydrogen"
        },
        {
            type = "unlock-recipe",
            recipe = "glycerol-syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "air-pollution"
        },
        {
            type = "unlock-recipe",
            recipe = "advanced-foundry"
        },
        {
            type = "unlock-recipe",
            recipe = "organics-processing"
        },
        {
            type = "unlock-recipe",
            recipe = "slacked-lime"
        },
        {
            type = "unlock-recipe",
            recipe = "nexelit-cartridge"
        },
        {
            type = "unlock-recipe",
            recipe = "oleo-solidfuel"
        },
        {
            type = "unlock-recipe",
            recipe = "lightoil-to-syngas"
        }
    },
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
data:extend {technology}
