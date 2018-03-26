TECHNOLOGY {
    type = 'technology',
    name = 'cooling-tower-1',
    icon = '__pycoalprocessing__/graphics/technology/cooling-towermk01.png',
    icon_size = 128,
    order = 'c-a',
    upgrade = true,
    prerequisites = {'energy-1'},
    effects = {},
    unit = {
        count = 25,
        ingredients = {
            {'science-pack-1', 2}
        },
        time = 45
    }
}
