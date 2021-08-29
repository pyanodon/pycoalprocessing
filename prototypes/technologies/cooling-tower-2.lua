TECHNOLOGY {
    type = "technology",
    name = "cooling-tower-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/cooling-towermk02.png",
    icon_size = 128,
    order = "c-a",
    --upgrade = true,
    prerequisites = {"cooling-tower-1", "energy-2"},
    effects = {},
    unit = {
        count = 20,
        ingredients = {
            {"automation-science-pack", 2},
            {"logistic-science-pack", 1}
        },
        time = 45
    }
}
