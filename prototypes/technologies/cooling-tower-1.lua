local technology = {
    type = "technology",
    name = "cooling-tower-mk1",
    icon = "__pycoalprocessing__/graphics/technology/cooling-towermk01.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"energy1"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "cooling-tower-mk01"
        },
        {
            type = "unlock-recipe",
            recipe = "cooling-water"
        }
    },
    unit = {
        count = 25,
        ingredients = {
            {"science-pack-1", 2}
        },
        time = 45
    }
}
data:extend {technology}
