local technology =
{
    type = "technology",
    name = "methanol-processing-1",
    icon = "__pycoalprocessing__/graphics/technology/methanol-processing-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "methanol-reactor"
        },
        {
            type = "unlock-recipe",
            recipe = "rectisol"
        },
        {
            type = "unlock-recipe",
            recipe = "empty-gas-canister"
        },
        {
            type = "unlock-recipe",
            recipe = "refsyngas-from-meth-canister"
        },
        {
            type = "unlock-recipe",
            recipe = "methanol-from-syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "empty-methanol-gas-canister"
        },
        {
            type = "unlock-recipe",
            recipe = "fill-methanol-gas-canister"
        },
    },
    unit =
    {
        count = 100,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 30
    },
}
data:extend({technology})
