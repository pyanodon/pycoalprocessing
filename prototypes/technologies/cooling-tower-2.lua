Technology {
    type = "technology",
    name = "cooling-tower-mk2",
    icon = "__pycoalprocessing__/graphics/technology/cooling-towermk02.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"cooling-tower-mk1", "coal-processing-2"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "cooling-tower-mk02"
        }
    },
    unit = {
        count = 20,
        ingredients = {
            {"science-pack-1", 2},
            {"science-pack-2", 1}
        },
        time = 45
    }
}
