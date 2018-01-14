Technology {
    type = "technology",
    name = "separation",
    icon = "__pycoalprocessing__/graphics/technology/separation.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-1"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "classifier"
        },
        {
            type = "unlock-recipe",
            recipe = "sand-classification"
        },
        {
            type = "unlock-recipe",
            recipe = "coarse-classification"
        },
        {
            type = "unlock-recipe",
            recipe = "tailings-classification"
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
        {
            type = "unlock-recipe",
            recipe = "fluid-separator"
        },
        {
            type = "unlock-recipe",
            recipe = "tailings-separation"
        },
        {
            type = "unlock-recipe",
            recipe = "lime"
        },
        {
            type = "unlock-recipe",
            recipe = "calcium-carbide"
        },
        {
            type = "unlock-recipe",
            recipe = "creosote-to-aromatics"
        },
        {
            type = "unlock-recipe",
            recipe = "ash-separation"
        }
    },
    unit = {
        count = 35,
        ingredients = {
            {"science-pack-1", 2}
        },
        time = 55
    }
}
