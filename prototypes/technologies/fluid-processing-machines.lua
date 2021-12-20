TECHNOLOGY {
    type = "technology",
    name = "fluid-processing-machines-1",
    icon = "__pyfusionenergygraphics__/graphics/icons/gas-separator-mk01.png",
    icon_size = 64,
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

