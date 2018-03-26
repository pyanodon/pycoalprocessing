TECHNOLOGY {
    type = "technology",
    name = "methanol-processing-2",
    icon = "__pycoalprocessing__/graphics/technology/methanol-processing-2.png",
    icon_size = 128,
    order = "c-b",
    upgrade = true,
    effects = {
        {
            type = "unlock-recipe",
            recipe = "refsyngas-from-meth"
        },
        {
            type = "unlock-recipe",
            recipe = "oleo-methanol"
        },
        {
            type = "unlock-recipe",
            recipe = "methanol-combustion"
        }
    },
    unit = {
        count = 150,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1}
        },
        time = 35
    }
}
