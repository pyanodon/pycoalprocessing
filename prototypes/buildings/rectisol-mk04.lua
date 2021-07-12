local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/pipe-north.png",
        priority = "extra-high",
        width = 44,
        height = 25
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/pipe-ending-down.png",
        priority = "extra-high",
        width = 40,
        height = 32
    }
}

RECIPE {
    type = "recipe",
    name = "rectisol-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"rectisol-mk03", 1},
        {"storage-tank", 2},
        {"kevlar", 30},
        {"nbfe-alloy", 15},
        {"low-density-structure", 10},
    },
    results = {
        {"rectisol-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "rectisol-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/rectisol-mk04.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "v",
    place_result = "rectisol-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "rectisol-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/rectisol-mk04.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "rectisol-mk04"},
    fast_replaceable_group = "rectisol",
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"rectisol"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "600kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rectisol-mk04.png",
        width = 250,
        height = 239,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.38, -0.0}
    },
    working_visualisations = {
        {
            north_position = {-1.07, 1.132},
            west_position = {-1.07, 1.132},
            south_position = {-1.07, 1.132},
            east_position = {-1.07, 1.132},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-tanks-anim-mk04.png",
                frame_count = 80,
                line_length = 10,
                width = 121,
                height = 55,
                animation_speed = 0.35
            }
        },
        {
            north_position = {2.03, -1.28},
            west_position = {2.03, -1.28},
            south_position = {2.03, -1.28},
            east_position = {2.03, -1.28},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-lifter-anim-mk04.png",
                frame_count = 80,
                line_length = 40,
                width = 47,
                height = 77,
                animation_speed = 0.45
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, -2.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, 2.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, 0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.0, 1.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.0, -1.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {1.0, -4.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    pipe_covers = DATA.Pipes.covers(true, true, true, true),
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/rectisol.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/rectisol.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
