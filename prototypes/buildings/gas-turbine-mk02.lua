RECIPE {
    type = 'recipe',
    name = 'gasturbinemk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'advanced-circuit', 20},
        {'pipe',             20},
        {'steel-plate',      50},
        {'iron-plate',       30},
        {'iron-gear-wheel',  40}
    },
    results = {
        {'gasturbinemk02', 1}
    }
}:add_unlock('energy-2')

ITEM {
    type = 'item',
    name = 'gasturbinemk02',
    icon = '__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk02.png',
    icon_size = 64,
    flags = {},
    subgroup = 'py-power',
    order = 'a-d[gasturbinemk02]',
    place_result = 'gasturbinemk02',
    stack_size = 10
}

ENTITY {
    type = 'generator',
    name = 'gasturbinemk02',
    icon = '__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk02.png',
    icon_size = 64,
    flags = {'placeable-neutral', 'player-creation'},
    minable = {mining_time = 1, result = 'gasturbinemk02'},
    max_health = 500,
    corpse = 'big-remnants',
    effectivity = 1,
    fluid_usage_per_tick = 1.25,
    maximum_temperature = 2000,
    destroy_non_fuel_fluid = false,
    resistances = {
        {
            type = 'fire',
            percent = 70
        }
    },
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    fluid_box = {
        base_area = 1,
        base_level = -1,
        pipe_covers = py.pipe_covers(false, true, true, true),
        production_type = 'input-output',
        filter = 'combustion-mixture1',
        minimum_temperature = 500.0,
        pipe_connections = {
            {type = 'input-output', position = {4.0, 0.0}},
            {type = 'input-output', position = {-4.0, 0.0}}
        }
    },
    energy_source = {
        type = 'electric',
        usage_priority = 'secondary-output',
        emissions_per_minute = {
                pollution = 1
            },
    },
    horizontal_animation = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-vertical-anim.png',
        width = 238,
        height = 249,
        frame_count = 16,
        line_length = 4,
        shift = {0.195, -0.239}
    },
    vertical_animation = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-horizontal-anim.png',
        width = 238,
        height = 244,
        frame_count = 16,
        line_length = 4,
        shift = {0.155, -0.325}
    },
    smoke = {
        {
            name = 'light-smoke',
            north_position = {0.52, -3.1},
            east_position = {0.52, -3.1},
            frequency = 5 / 8,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
        }
    },
    min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.3,
    vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
    working_sound = {
        sound = {filename = '__pycoalprocessinggraphics__/sounds/gasturbinemk02.ogg'},
        idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/gasturbinemk02.ogg', volume = 0.3},
        apparent_volume = 2.5
    }
}
