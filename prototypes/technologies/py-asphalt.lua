local technology = {
    type = "technology",
    name = "py-asphalt",
    icon = "__pycoalprocessing__/graphics/technology/py-asphalt.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"concrete" , "coal-processing-1"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "py-asphalt"
        },
        {
            type = "unlock-recipe",
            recipe = "py-coal-tile"
        },
    },
    unit =
    {
        count = 10,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 35
    },
}
data:extend({technology})
