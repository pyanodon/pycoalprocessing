local technology = {
    type = "technology",
    name = "storage-tanks",
    icon = "__pycoalprocessing__/graphics/technology/storage-tanks.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"steel-processing"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "py-tank-1500"
        },
        {
            type = "unlock-recipe",
            recipe = "py-tank-4000"
        },
        {
            type = "unlock-recipe",
            recipe = "py-tank-5000"
        },
        {
            type = "unlock-recipe",
            recipe = "py-tank-6500"
        },
        {
            type = "unlock-recipe",
            recipe = "py-tank-8000"
        },

    },
    unit =
    {
        count = 35,
        ingredients = {
            {"science-pack-1", 2},
        },
        time = 45
    },
}
data:extend({technology})
