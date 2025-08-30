TECHNOLOGY({
    type = "technology",
    name = "fluid-processing-machines-1",
    icon = "__pycoalprocessinggraphics__/graphics/technology/fluid-processing-machines.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    effects = {},
    unit = {
        count = 50,
        ingredients = {
            { "automation-science-pack", 1 },
        },
        time = 30
    }
})

if mods[ "pypetroleumhandling" ] then
    TECHNOLOGY({
        type = "technology",
        name = "fluid-processing-machines-2",
        icon = "__pycoalprocessinggraphics__/graphics/technology/fluid-processing-machines-2.png",
        icon_size = 128,
        order = "c-a",
        prerequisites = {},
        dependencies = { "fluid-processing-machines-1" },
        effects = {},
        unit = {
            count = 50,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 }
            },
            time = 30
        }
    })
end
