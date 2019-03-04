TECHNOLOGY {
    type = "technology",
    name = "fuel-production",
    icon = "__pycoalprocessing__/graphics/technology/fuel-production.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"excavation-1"},
    effects = {},
    unit = {
        count = 100,
        ingredients = {
            {"automation-science-pack", 3},
            {"logistic-science-pack", 2},
            {"chemical-science-pack", 1}
        },
        time = 50
    }
}
