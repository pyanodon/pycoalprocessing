local pipe_pictures =
    function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north = {
            filename = "__pycoalprocessing__/graphics/entity/soil-extractormk01/long-pipe-north.png",
            priority = "low",
            width = 30,
            height = 44,
            shift = shift_north
        }
    else
        north = Data.Pipes.empty_sprite()
    end
    if shift_south then
        south = {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_south
        }
    else
        south = Data.Pipes.empty_sprite()
    end
    if shift_west then
        west = {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_west
        }
    else
        west = Data.Pipes.empty_sprite()
    end
    if shift_east then
        east = {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_east
        }
    else
        east = Data.Pipes.empty_sprite()
    end
    return {north = north, south = south, west = west, east = east}
end

Recipe {
    type = "recipe",
    name = "gasturbinemk03",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"processing-unit", 20},
        {"pipe", 20}, --bob bronze-pipe
        {"nexelit-plate", 50},
        {"iron-plate", 70}, --bob invar-alloy
        {"gasturbinemk02", 2}
    },
    results = {
      {"gasturbinemk03", 1}
    }
}

Item {
    type = "item",
    name = "gasturbinemk03",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk03.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "py-power",
    order = "a-d[gasturbinemk03]",
    place_result = "gasturbinemk03",
    stack_size = 10
}

Entity {
    type = "generator",
    name = "gasturbinemk03",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk03.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk03"},
    max_health = 500,
    corpse = "big-remnants",
    effectivity = 1.40,
    fluid_usage_per_tick = 1.5,
    maximum_temperature = 1000,
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-4.4, -4.4}, {4.4, 4.4}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    fluid_input = {
        name = "combustion-mixture1",
        amount = 0.0,
        minimum_temperature = 500.0
    },
    fluid_box = {
        filter = "combustion-mixture1",
        minimum_temperature = 500.0,
        base_area = 1,
        base_level = -1,
        pipe_covers = Data.Pipes.covers(false, true, false, false),
        pipe_picture = pipe_pictures({0, 0}, {0, 0}, {0, 0}, {0, 0}),
        production_type = "input-output",
        pipe_connections = {
            {type = "input-output", position = {4.9, 0.0}},
            {type = "input-output", position = {-4.9, 0.0}}
        }
    },
    energy_source = {
        type = "electric",
        usage_priority = "secondary-output",
        emissions = 0.04
    },
    horizontal_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-horizontal.png",
        width = 288,
        height = 344,
        frame_count = 31,
        line_length = 7,
        shift = {-0.05, -0.84}
    },
    vertical_animation = {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-vertical.png",
        width = 288,
        height = 344,
        frame_count = 31,
        line_length = 7,
        shift = {0.0, -0.82}
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
        sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk03.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/gasturbinemk03.ogg", volume = 2.3},
        apparent_volume = 2.3
    }
}
