local technology = {
    type = "technology",
    name = "fine-electronics",
    icon = "__pycoalprocessing__/graphics/technology/fine-electronics.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "glass-core"
        },
        {
            type = "unlock-recipe",
            recipe = "cladding"
        },
        {
            type = "unlock-recipe",
            recipe = "cladded-core"
        },
        {
            type = "unlock-recipe",
            recipe = "kevlar"
        },
        {
            type = "unlock-recipe",
            recipe = "ppd"
        },
        {
            type = "unlock-recipe",
            recipe = "tpa"
        },
        {
            type = "unlock-recipe",
            recipe = "copper-coating"
        },
        {
            type = "unlock-recipe",
            recipe = "kevlar-coating"
        },
        {
            type = "unlock-recipe",
            recipe = "nbfe-alloy"
        },
        {
            type = "unlock-recipe",
            recipe = "nbfe-coating"
        },
        {
            type = "unlock-recipe",
            recipe = "optical-fiber"
        },
        {
            type = "unlock-recipe",
            recipe = "nas-battery"
        },
        {
            type = "unlock-recipe",
            recipe = "science-pack-3"
        }
    },
    unit = {
        count = 30,
        ingredients = {
            {"science-pack-1", 2},
            {"science-pack-2", 1}
        },
        time = 55
    }
}
data:extend {technology}
