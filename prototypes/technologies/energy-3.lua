TECHNOLOGY {
    type = "technology",
    name = "energy-3",
    icon = "__pycoalprocessing__/graphics/technology/energy-3.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"fuel-production"},
    upgrade = true,
    effects = {},
    unit = {
        count = 120,
        ingredients = {
            {"automation-science-pack", 3},
            {"logistic-science-pack", 2},
            {"chemical-science-pack", 1}
        },
        time = 45
    }
}
