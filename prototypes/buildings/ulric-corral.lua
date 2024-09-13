RECIPE {
    type = 'recipe',
    name = 'ulric-corral-mk01',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'steel-plate',        20},
        {'steam-engine',       1},
        {'stone-brick',        10},
        {'iron-gear-wheel',    5}, --bob steel-bearing
        {'iron-plate',         10},
        {'electronic-circuit', 10}
    },
    results = {
        {'ulric-corral-mk01', 1}
    }
}:add_unlock('ulric')

ITEM {
    type = 'item',
    name = 'ulric-corral-mk01',
    icon = '__pycoalprocessinggraphics__/graphics/icons/ulric-corral.png',
    icon_size = 64,
    flags = {},
    subgroup = 'coal-processing',
    order = 'h',
    place_result = 'ulric-corral-mk01',
    stack_size = 10
}

ENTITY {
    type = 'assembling-machine',
    name = 'ulric-corral-mk01',
    icon = '__pycoalprocessinggraphics__/graphics/icons/ulric-corral.png',
    icon_size = 64,
    flags = {'placeable-neutral', 'player-creation'},
    minable = {mining_time = 1, result = 'ulric-corral-mk01'},
    fast_replaceable_group = 'ulric-corral',
    max_health = 100,
    corpse = 'big-remnants',
    dying_explosion = 'big-explosion',
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4.0, -4.0}, {4.0, 4.0}},
    match_animation_speed_to_activity = false,
    module_slots = 2,
    allowed_effects = {'consumption', 'productivity', 'pollution', 'speed'},
    crafting_categories = {'ulric'},
    crafting_speed = 1,
    energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        emissions_per_minute = -5,
    },
    energy_usage = '100kW',
    animation = {
        layers = {
            {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-corral-base.png',
                width = 256,
                height = 256,
                frame_count = 60,
                line_length = 8,
                shift = {0.0, 0.0},
                animation_speed = 0.6
            },
            {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-corral-base-mask.png',
                width = 256,
                height = 256,
                frame_count = 60,
                line_length = 8,
                shift = {0.0, 0.0},
                animation_speed = 0.6,
                tint = {r = 1.0, g = 1.0, b = 0.0, a = 1.0}
            },
            {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-corral-top.png',
                width = 256,
                height = 12,
                frame_count = 60,
                line_length = 8,
                shift = {0.0, -4.0},
                animation_speed = 0.6
            },
        }
    },
    working_visualisations = {
        {
            north_position = {-2.0, 3.0},
            west_position = {-2.0, 3.0},
            south_position = {-2.0, 3.0},
            east_position = {-2.0, 3.0},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/mother-2.png',
                frame_count = 50,
                line_length = 10,
                width = 70,
                height = 46,
                animation_speed = 0.2
            }
        },
        {
            north_position = {-0.25, 1.62},
            west_position = {-0.25, 1.62},
            south_position = {-0.25, 1.62},
            east_position = {-0.25, 1.62},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-middle-pastando-2.png',
                frame_count = 75,
                line_length = 10,
                width = 32,
                height = 48,
                run_mode = 'forward-then-backward',
                animation_speed = 0.2
            }
        },
        {
            north_position = {1.87, 0.46},
            west_position = {1.87, 0.46},
            south_position = {1.87, 0.46},
            east_position = {1.87, 0.46},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-right-pastando-2.png',
                frame_count = 50,
                line_length = 10,
                width = 64,
                height = 64,
                animation_speed = 0.2
            }
        },
        {
            north_position = {2.5, 2.81},
            west_position = {2.5, 2.81},
            south_position = {2.5, 2.81},
            east_position = {2.5, 2.81},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-bottom-right-cub-spritesheet.png',
                frame_count = 1,
                width = 32,
                height = 32,
                animation_speed = 0.6
            }
        },
        {
            north_position = {-2.0, 2.56},
            west_position = {-2.0, 2.56},
            south_position = {-2.0, 2.56},
            east_position = {-2.0, 2.56},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-bottom-cub-spritesheet.png',
                frame_count = 1,
                width = 32,
                height = 32,
                --animation_speed = 0.6
            }
        },
        {
            north_position = {2.5, 2.81},
            west_position = {2.5, 2.81},
            south_position = {2.5, 2.81},
            east_position = {2.5, 2.81},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-bottom-right-cub-spritesheet.png',
                frame_count = 1,
                width = 32,
                height = 32,
                --animation_speed = 0.6
            }
        },
        {
            north_position = {1.81, 3.12},
            west_position = {1.81, 3.12},
            south_position = {1.81, 3.12},
            east_position = {1.81, 3.12},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-bottom-pink-cub-2.png',
                frame_count = 80,
                line_length = 10,
                width = 40,
                height = 25,
                animation_speed = 0.2
            }
        },
        {
            north_position = {2.56, 1.0},
            west_position = {2.56, 1.0},
            south_position = {2.56, 1.0},
            east_position = {2.56, 1.0},
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/ulric-corral/ulric-mid-right-stand-spritesheet.png',
                frame_count = 1,
                width = 32,
                height = 68,
                --animation_speed = 0.5
            }
        },
    },
    vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
    working_sound = {
        sound = {filename = '__pycoalprocessinggraphics__/sounds/ulric-corral.ogg', volume = 0.55},
        idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/ulric-corral.ogg', volume = 0.3},
        apparent_volume = 0.45
    }
}
