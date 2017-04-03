local technology = {
    type = "technology",
    name = "fuel-production",
    icon = "__pycoalprocessing__/graphics/technology/fuel-production.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-3", "excavation-1"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "olefin-plant"
        },
        {
            type = "unlock-recipe",
            recipe = "heavy-oil_from_coal-gas"
        },
        {
            type = "unlock-recipe",
            recipe = "light-oil_from_syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "petgas_from_refsyngas"
        },
        {
            type = "unlock-recipe",
            recipe = "diesel"
        },
        {
            type = "unlock-recipe",
            recipe = "diesel2"
        },
        {
            type = "unlock-recipe",
            recipe = "aromatics"
        },
        {
            type = "unlock-recipe",
            recipe = "olefin"
        },
        {
            type = "unlock-recipe",
            recipe = "fts-reactor"
        },
        {
            type = "unlock-recipe",
            recipe = "ref_to_light_oil"
        },
        {
            type = "unlock-recipe",
            recipe = "sulfuric_petgas"
        },
        {
            type = "unlock-recipe",
            recipe = "tar_oil"
        },
        {
            type = "unlock-recipe",
            recipe = "anthraquinone"
        },
        {
            type = "unlock-recipe",
            recipe = "fuelrod-mk01"
        },
        {
            type = "unlock-recipe",
            recipe = "olefin-petgas"
        },
        {
            type = "unlock-recipe",
            recipe = "gasoline"
        },
        {
            type = "unlock-recipe",
            recipe = "combustion-olefin"
        },

    },

    unit =
    {
        count = 100,
        ingredients = {
            {"science-pack-1", 3},
            {"science-pack-2", 2},
            {"science-pack-3", 1},
        },
        time = 50
    },
}
data:extend({technology})
