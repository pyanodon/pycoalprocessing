TECHNOLOGY {
    type = "technology",
    name = "desulfurization",
    icon = "__pycoalprocessing__/graphics/technology/desulfurization.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"sulfur-processing", "fluid-handling", "coal-processing-1"},
    effects = {},
    unit = {
        count = 10,
        ingredients = {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 1}
        },
        time = 45
    }
}
