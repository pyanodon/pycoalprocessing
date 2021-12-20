TECHNOLOGY {
    type = "technology",
    name = "fluid-processing-machines-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/fluid-processing-machines.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"coal-processing-2", "plastics"},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
        time = 30
    }
}

