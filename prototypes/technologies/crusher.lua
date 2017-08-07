local technology = {
    type = "technology",
    name = "crusher",
    icon = "__pycoalprocessing__/graphics/technology/crusher.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"engine","coal-processing-2"},
    effects =
    {
		{
            type = "unlock-recipe",
            recipe = "jaw-crusher"
        },
        {
            type = "unlock-recipe",
            recipe = "ball-mill"
        },
        {
            type = "unlock-recipe",
            recipe = "stone-to-gravel"
        },
        {
            type = "unlock-recipe",
            recipe = "gravel-to-sand"
        },
        {
            type = "unlock-recipe",
            recipe = "crushing-iron"
        },
        {
            type = "unlock-recipe",
            recipe = "crushing-copper"
        },
        {
            type = "unlock-recipe",
            recipe = "crushed-iron"
        },
        {
            type = "unlock-recipe",
            recipe = "crushed-copper"
        },
    },
    unit =
    {
        count = 25,
        ingredients = {
            {"science-pack-1", 3},
			{"science-pack-2", 1},
        },
        time = 55
    },
}
data:extend({technology})
