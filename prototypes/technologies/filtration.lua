TECHNOLOGY {
    type = "technology",
    name = "filtration",
    icon = "__pycoalprocessing__/graphics/technology/filtration.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "carbon-filter"
        },
        {
            type = "unlock-recipe",
            recipe = "refsyngas-from-filtered-syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "fluegas_to-syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "bone-solvent"
        },
        {
            type = "unlock-recipe",
            recipe = "biofilm"
        },
        {
            type = "unlock-recipe",
            recipe = "dirty-acid"
        },
        {
            type = "unlock-recipe",
            recipe = "filtration-media"
        },
        {
            type = "unlock-recipe",
            recipe = "filtration-dirty-water"
        },
        {
            type = "unlock-recipe",
            recipe = "coalgas-syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "oleochemicals-crude-oil"
        },
        {
            type = "unlock-recipe",
            recipe = "fluegas-filtration"
        }
    },
    unit = {
        count = 40,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1}
        },
        time = 55
    }
}
