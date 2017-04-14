local technology = {
    type = "technology",
    name = "coal-processing-3",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-3.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2", "methanol-processing-2"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "nichrome"
        },
        {
            type = "unlock-recipe",
            recipe = "making_chromium"
        },
        {
            type = "unlock-recipe",
            recipe = "nexelit-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "sand_casting"
        },
        {
            type = "unlock-recipe",
            recipe = "organics_processing"
        },
        {
            type = "unlock-recipe",
            recipe = "combustion-mixture2"
        },
        {
            type = "unlock-recipe",
            recipe = "gasturbinemk03"
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
            recipe = "co2_absorber"
        },
        {
            type = "unlock-recipe",
            recipe = "co2"
        },
        {
            type = "unlock-recipe",
            recipe = "air_pollution"
        },
        {
            type = "unlock-recipe",
            recipe = "advanced-foundry"
        },
        {
            type = "unlock-recipe",
            recipe = "organics_processing"
        },
        {
            type = "unlock-recipe",
            recipe = "lime"
        },
        {
            type = "unlock-recipe",
            recipe = "slacked-lime"
        },
        {
            type = "unlock-recipe",
            recipe = "lithium-peroxide"
        },
        {
            type = "unlock-recipe",
            recipe = "nexelit-cartridge"
        },
        {
            type = "unlock-recipe",
            recipe = "solid-separator"
        },
        {
            type = "unlock-recipe",
            recipe = "soil_separation"
        },
    },

    unit =
    {
        count = 50,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
            {"science-pack-3", 2},
        },
        time = 35
    },
}
data:extend({technology})
