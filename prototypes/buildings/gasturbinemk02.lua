local Pipes = require("stdlib.data.pipes")

local recipe1 = {
    type = "recipe",
    name = "gasturbinemk02",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"advanced-circuit", 20},
        {"pipe", 20}, --bob bronze-pipe
        {"steel-plate", 50},
        {"iron-plate", 30}, --bob invar-alloy
        {"iron-gear-wheel", 40}
    },
    result = "gasturbinemk02"
}

local item1 = {
    type = "item",
    name = "gasturbinemk02",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "py-power",
    order = "a-d[gasturbinemk02]",
    place_result = "gasturbinemk02",
    stack_size = 10
}

local entity1 = {
    type = "generator",
    name = "gasturbinemk02",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk02"},
    max_health = 500,
    corpse = "big-remnants",
    effectivity = 0.85,
    fluid_usage_per_tick = 1,
    maximum_temperature = 1000,
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    fluid_input = {
        name = "combustion-mixture1",
        amount = 0.0,
        minimum_temperature = 500.0
    },
    fluid_box = {
        base_area = 1,
        base_level = -1,
        pipe_covers = Pipes.covers(false, true, true, true),
        production_type = "input-output",
        filter = "combustion-mixture1",
        minimum_temperature = 500.0,
        pipe_connections = {
            {type = "input-output", position = {4.0, 0.0}},
            {type = "input-output", position = {-4.0, 0.0}}
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output",
        emissions = 0.04
    },
    horizontal_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-vertical-anim.png",
        width = 238,
        height = 249,
        frame_count = 16,
        line_length = 4,
        shift = {0.195, -0.239}
    },
    vertical_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-horizontal-anim.png",
        width = 238,
        height = 244,
        frame_count = 16,
        line_length = 4,
        shift = {0.155, -0.325}
    },
    smoke = {
        {
            name = "light-smoke",
            north_position = {-0.312, -2.93},
            east_position = {-1.5, -2},
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
        sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk02.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk02.ogg", volume = 0.65},
        apparent_volume = 2.5
    }
}

data:extend {recipe1, item1, entity1}
