local pipe_pictures =
    function(shift_north, shift_south, shift_west, shift_east)
        local north, south, east, west
        if shift_north then
            north = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/soil-extractor/long-pipe-north.png",
                priority = "low",
                width = 30,
                height = 44,
                shift = shift_north
            }
        else
            north = py.empty_image()
        end
        if shift_south then
            south = {
                filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
                priority = "extra-high",
                width = 44,
                height = 31,
                shift = shift_south
            }
        else
            south = py.empty_image()
        end
        if shift_west then
            west = {
                filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
                priority = "extra-high",
                width = 19,
                height = 37,
                shift = shift_west
            }
        else
            west = py.empty_image()
        end
        if shift_east then
            east = {
                filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
                priority = "extra-high",
                width = 20,
                height = 38,
                shift = shift_east
            }
        else
            east = py.empty_image()
        end
        return {north = north, south = south, west = west, east = east}
    end

RECIPE {
    type = "recipe",
    name = "gasturbinemk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "processing-unit", amount = 20},
        {type = "item", name = "pipe",            amount = 20},
        {type = "item", name = "nexelit-plate",   amount = 50},
        {type = "item", name = "iron-plate",      amount = 70},
        {type = "item", name = "gasturbinemk02",  amount = 2}
    },
    results = {
        {type = "item", name = "gasturbinemk03", amount = 1}
    }
}:add_unlock("energy-3")

ITEM {
    type = "item",
    name = "gasturbinemk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-power",
    order = "a-d[gasturbinemk03]",
    place_result = "gasturbinemk03",
    stack_size = 10
}

ENTITY {
    type = "generator",
    name = "gasturbinemk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gas-turbinemk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk03"},
    max_health = 500,
    corpse = "big-remnants",
    effectivity = 1,
    fluid_usage_per_tick = 1.5,
    maximum_temperature = 3000,
    destroy_non_fuel_fluid = false,
    resistances = {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-4.4, -4.4}, {4.4, 4.4}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    fluid_box = {
        filter = "combustion-mixture1",
        minimum_temperature = 500.0,
        volume = 100,
        base_level = -1,
        pipe_covers = py.pipe_covers(false, true, false, false),
        pipe_picture = pipe_pictures({0, 0}, {0, 0}, {0, 0}, {0, 0}),
        production_type = "input-output",
        pipe_connections = {
            {flow_direction = "input-output", position = {4.0, 0.0},  direction = defines.direction.east},
            {flow_direction = "input-output", position = {-4.0, 0.0}, direction = defines.direction.west}
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
        filename = "__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-horizontal.png",
        width = 288,
        height = 344,
        frame_count = 31,
        animation_speed = 1 / 3,
        line_length = 7,
        shift = {-0.05, -0.84}
    },
    vertical_animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-vertical.png",
        width = 288,
        height = 344,
        frame_count = 31,
        animation_speed = 1 / 3,
        line_length = 7,
        shift = {0.0, -0.82}
    },
    smoke = {
        {
            name = "turbine-smoke",
            north_position = {0.5, 1.0},
            east_position = {0.5, 1.0},
            frequency = 5 / 16,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
        }
    },
    min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.3,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/gasturbinemk03.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/gasturbinemk03.ogg", volume = 0.3},
        apparent_volume = 2.3
    }
}
