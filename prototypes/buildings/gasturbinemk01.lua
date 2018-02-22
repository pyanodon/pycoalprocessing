Recipe {
    type = "recipe",
    name = "gasturbinemk01",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"steel-plate", 15},
        {"pipe", 10},
        {"iron-plate", 25},
        {"iron-stick", 30},
        {"iron-gear-wheel", 40}
    },
    results = {
      {"gasturbinemk01", 1}
    }
}

Item {
    type = "item",
    name = "gasturbinemk01",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk01.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "py-power",
    order = "a-d[gasturbinemk01]",
    place_result = "gasturbinemk01",
    stack_size = 15
}

Entity {
    type = "generator",
    name = "gasturbinemk01",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk01.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk01"},
    max_health = 300,
    corpse = "big-remnants",
    effectivity = 0.40,
    fluid_usage_per_tick = 1,
    maximum_temperature = 1000,
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-1.49, -1.49}, {1.49, 1.49}},
    selection_box = {{-1.53, -1.53}, {1.53, 1.53}},
    fluid_input = {
        name = "combustion-mixture1",
        amount = 0.0,
        minimum_temperature = 500.0
    },
    fluid_box = {
        base_area = 1,
        base_level = -1,
        pipe_covers = Data.Pipes.covers(false, true, true, true),
        production_type = "input-output",
        filter = "combustion-mixture1",
        minimum_temperature = 500.0,
        pipe_connections = {
            {type = "input-output", position = {0.00, 2.00}},
            {type = "input-output", position = {0.00, -2.00}}
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output",
        emissions = 0.04
    },
    horizontal_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk01/gasturbinemk01_horizontal.png",
        width = 131,
        height = 288,
        frame_count = 25,
        line_length = 5,
        shift = {0.5, -3.0},
        animation_speed = 0.8
    },
    vertical_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk01/gasturbinemk01_vertical.png",
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
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk01.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk01.ogg", volume = 0.45},
        apparent_volume = 2.5
    }
}
