local technology = {
    type = "technology",
    name = "methanol-processing-2",
    icon = "__pycoalprocessing__/graphics/technology/methanol-processing-2.png",
    icon_size = 128,
    order = "c-b",
    prerequisites = {"methanol-processing-1"},
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "methanol-from-syngas"
        },

        {
            type = "unlock-recipe",
            recipe = "refsyngas-from-meth"
        },
        {
            type = "unlock-recipe",
            recipe = "refsyngas-from-meth-canister"
        },
        {
            type = "unlock-recipe",
            recipe = "oleo-methanol"
        },
    },
    unit =
    {
        count = 150,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 35
    },
}
data:extend({technology})
