local technology = {
    type = "technology",
    name = "separation",
    icon = "__pycoalprocessing__/graphics/technology/separation.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-1"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "classifier"
        },
        {
            type = "unlock-recipe",
            recipe = "pure_sand-classification"
        },
        {
            type = "unlock-recipe",
            recipe = "coarse-classification"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-slurry"
        },
        {
            type = "unlock-recipe",
            recipe = "co2-organics"
        },
        {
            type = "unlock-recipe",
            recipe = "solid-separator"
        },
        {
            type = "unlock-recipe",
            recipe = "soil-separation"
        },

    },
    unit =
    {
        count = 35,
        ingredients = {
            {"science-pack-1", 2},
        },
        time = 55
    },
}
data:extend({technology})
