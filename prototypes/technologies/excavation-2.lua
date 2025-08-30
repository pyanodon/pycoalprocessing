TECHNOLOGY({
    type = "technology",
    name = "excavation-2",
    icon = "__pycoalprocessinggraphics__/graphics/technology/excavation-2.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    dependencies = { "excavation-1" },
    --upgrade = true,
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            { "automation-science-pack", 1 },
            { "logistic-science-pack",   1 },
            { "chemical-science-pack",   1 }
        },
        time = 35
    }
})

if mods["pypetroleumhandling"] then
    TECHNOLOGY({
        type = "technology",
        name = "excavation-3",
        icon = "__pycoalprocessinggraphics__/graphics/technology/excavation-3.png",
        icon_size = 128,
        order = "c-a",
        prerequisites = {},
        dependencies = { "excavation-2" },
        --upgrade = true,
        effects = {},
        unit = {
            count = 50,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
            },
            time = 35
        }
    })
end
