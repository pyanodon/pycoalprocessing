local technology = {
    type = "technology",
    name = "energy2",
    icon = "__pycoalprocessing__/graphics/technology/energy-2.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"energy1" , "methanol-processing-2"},
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "gasturbinemk02"
        },
        {
            type = "unlock-recipe",
            recipe = "refsyngas-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "coalslurry-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "acetylene-combustion"
        },
    },
    unit =
    {
        count = 100,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 45
    },
}
data:extend({technology})
