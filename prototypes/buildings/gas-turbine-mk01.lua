RECIPE {
    type = "recipe",
    name = "gasturbinemk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-plate",     amount = 15},
        {type = "item", name = "pipe",            amount = 10},
        {type = "item", name = "iron-plate",      amount = 25},
        {type = "item", name = "iron-stick",      amount = 30},
        {type = "item", name = "iron-gear-wheel", amount = 40}
    },
    results = {
        {type = "item", name = "gasturbinemk01", amount = 1}
    }
}:add_unlock("energy-1")

ITEM {
    type = "item",
    name = "gasturbinemk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk01.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-power",
    order = "a-d[gasturbinemk01]",
    place_result = "gasturbinemk01",
    stack_size = 10
}

ENTITY {
    type = "generator",
    name = "gasturbinemk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk01.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk01"},
    max_health = 300,
    corpse = "big-remnants",
    effectivity = 1,
    fluid_usage_per_tick = 1,
    maximum_temperature = 1000,
    destroy_non_fuel_fluid = false,
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-1.49, -1.49}, {1.49, 1.49}},
    selection_box = {{-1.53, -1.53}, {1.53, 1.53}},
    fluid_box = {
        volume = 100,
        pipe_covers = py.pipe_covers(false, true, true, true),
        production_type = "input-output",
        filter = "combustion-mixture1",
        minimum_temperature = 500.0,
        pipe_connections = {
            {flow_direction = "input-output", position = {0.00, 1.00},  direction = defines.direction.south},
            {flow_direction = "input-output", position = {0.00, -1.00}, direction = defines.direction.north}
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output",
        emissions_per_minute = {
            pollution = 1
        },
    },
    horizontal_animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk01/gasturbinemk01_horizontal.png",
        width = 131,
        height = 288,
        frame_count = 25,
        line_length = 5,
        shift = {0.5, -3.0},
        animation_speed = 0.8
    },
    vertical_animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk01/gasturbinemk01_vertical.png",
        width = 128,
        height = 288,
        frame_count = 25,
        line_length = 5,
        shift = {0.5, -3.0},
        animation_speed = 0.8
    },
    smoke = {
        {
            name = "light-smoke",
            north_position = {-1.2, -2},
            east_position = {-0.75, -2},
            frequency = 5 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
        },
        {
            name = "light-smoke",
            north_position = {1.2, -2},
            east_position = {1.2, -2},
            frequency = 5 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
        }
    },
    min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.3,
    impact_category = "metal-large",
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/gasturbinemk01.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/gasturbinemk01.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
