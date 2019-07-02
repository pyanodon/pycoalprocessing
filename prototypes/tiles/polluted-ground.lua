local sand_vehicle_speed_modifier = _G.sand_vehicle_speed_modifier

DATA {
    type = 'tile',
    name = 'polluted-ground',
    collision_mask = {'ground-tile'},
    walking_speed_modifier = .50,
    autoplace = nil,
    layer = 36,
    variants = {
        main = {
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground1.png',
                count = 16,
                size = 1
            },
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground2.png',
                count = 16,
                size = 2,
                probability = 0.39,
                weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
            },
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground4.png',
                count = 16,
                line_length = 11,
                size = 4,
                probability = 1,
                weights = {0.090, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
            }
        },
        inner_corner = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-inner-corner.png',
            count = 8
        },
        outer_corner = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-outer-corner.png',
            count = 8
        },
        side = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-side.png',
            count = 8
        }
    },
    walking_sound = {
        {
            filename = '__base__/sound/walking/sand-01.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-02.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-03.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-04.ogg',
            volume = 0.8
        }
    },
    map_color = defines.color.brown,
    pollution_absorption_per_second = 0.0002,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
}

DATA {
    type = 'tree',
    name = 'ninja-tree',
    icon = '__pycoalprocessing__/graphics/empty.png',
    icon_size = 32,
    flags = {'placeable-neutral', 'placeable-off-grid', 'breaths-air'},
    minable = {
        minable = false,
        mining_particle = 'wooden-particle',
        mining_time = 0.5,
        result = 'wood',
        count = 2
    },
    emissions_per_second = 0,
    max_health = 20,
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    collision_mask = {},
    subgroup = 'trees',
    order = 'a[tree]-b[dead-tree]',
    vehicle_impact_sound = {filename = '__base__/sound/car-wood-impact.ogg', volume = 1.0},
    pictures = {
        --dry-hairy-tree
        {
            filename = '__pycoalprocessing__/graphics/empty.png',
            width = 32,
            height = 32,
            shift = util.by_pixel(45.5, -28.75)
        }
    }
}

DATA {
    type = 'tile',
    name = 'polluted-ground-burnt',
    collision_mask = {'ground-tile'},
    walking_speed_modifier = .50,
    autoplace = nil,
    layer = 36,
    tint = {0.25, 0.25, 0.25, 0.25},
    variants = {
        main = {
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground1.png',
                count = 16,
                size = 1
            },
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground2.png',
                count = 16,
                size = 2,
                probability = 0.39,
                weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
            },
            {
                picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground4.png',
                count = 16,
                line_length = 11,
                size = 4,
                probability = 1,
                weights = {0.090, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
            }
        },
        inner_corner = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-inner-corner.png',
            count = 8
        },
        outer_corner = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-outer-corner.png',
            count = 8
        },
        side = {
            picture = '__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-side.png',
            count = 8
        }
    },
    walking_sound = {
        {
            filename = '__base__/sound/walking/sand-01.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-02.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-03.ogg',
            volume = 0.8
        },
        {
            filename = '__base__/sound/walking/sand-04.ogg',
            volume = 0.8
        }
    },
    map_color = defines.color.brown,
    pollution_absorption_per_second = 0.0002,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
}
