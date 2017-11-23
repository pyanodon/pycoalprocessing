local technology = {
    type = "technology",
    name = "energy3",
    icon = "__pycoalprocessing__/graphics/technology/energy-3.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"energy2", "fuel-production"},
    effects = {
        {
            type = "unlock-recipe",
            recipe = "gasturbinemk03"
        },
        {
            type = "unlock-recipe",
            recipe = "gasoline-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "diesel-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "olefin-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "supercritical-combustion"
        },
        {
            type = "unlock-recipe",
            recipe = "ultrasupercritical-combustion"
        }
    },
    unit = {
        count = 120,
        ingredients = {
            {"science-pack-1", 3},
            {"science-pack-2", 2},
            {"science-pack-3", 1}
        },
        time = 45
    }
}
data:extend {technology}
