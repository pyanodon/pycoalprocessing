local technology = {
    type = "technology",
    name = "energy1",
    icon = "__pycoalprocessing__/graphics/technology/energy-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-1"},
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "gasturbinemk01"
        },
        {
            type = "unlock-recipe",
            recipe = "coalgas-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "syngas-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "diborane-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "power-house"
        },
    },
    unit =
    {
        count = 30,
        ingredients = {
            {"science-pack-1", 1},
        },
        time = 45
    },
}
data:extend({technology})
