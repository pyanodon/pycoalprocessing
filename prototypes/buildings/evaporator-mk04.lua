local pipes = {
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/south-mk04.png",
        priority = "extra-high",
        width = 168,
        height = 194
    }
}

RECIPE {
    type = "recipe",
    name = "evaporator-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"evaporator-mk03", 1},
        {"low-density-structure", 10},
        {"nbfe-alloy", 5},
    },
    results = {
        {"evaporator-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "evaporator-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator-mk04.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "l",
    place_result = "evaporator-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "evaporator-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator-mk04.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "evaporator-mk04"},
    fast_replaceable_group = "evaporator",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.48, -2.48}, {2.48, 2.48}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"evaporator"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "800kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-off-mk04.png",
        width = 168,
        height = 177,
        frame_count = 1,
        shift = {0.1, 0.0}
    },
    working_visualisations = {
        {
            north_position = {0.1, -0.0},
            west_position = {0.1, -0.0},
            south_position = {0.1, -0.0},
            east_position = {0.1, -0.0},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-anim-mk04.png",
                frame_count = 80,
                line_length = 10,
                width = 168,
                height = 177,
                animation_speed = 0.25
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, 0.0}}}
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 3.0}}}
        },
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-3.0, 0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0.0, -3.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
