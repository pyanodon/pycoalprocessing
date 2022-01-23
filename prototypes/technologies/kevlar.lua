TECHNOLOGY {
    type = "technology",
    name = "kevlar",
    icon = "__pycoalprocessinggraphics__/graphics/technology/kevlar.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"filtration"},
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

if mods['pypetroleumhandling'] then
    TECHNOLOGY {
        type = "technology",
        name = "kevlar-2",
        icon = "__pycoalprocessinggraphics__/graphics/technology/kevlar-2.png",
        icon_size = 128,
        order = "c-a",
        prerequisites = {},
        dependencies = {"kevlar"},
        effects = {},
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 30
        }
    }
end
