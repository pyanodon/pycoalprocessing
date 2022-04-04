TECHNOLOGY {
    type = "technology",
    name = "coated-container",
    icon = "__pycoalprocessinggraphics__/graphics/technology/coated-container.png",
    icon_size = 128,
    order = "c-a",
    effects = {
        {
            type = "unlock-recipe",
            recipe = "lead-container"
        },
        {
            type = "unlock-recipe",
            recipe = "science-coating"
        },
        {
            type = "unlock-recipe",
            recipe = "coated-container"
        },
    },
    unit = {
        count = 20,
        ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
        },
        time = 50
    }
}
