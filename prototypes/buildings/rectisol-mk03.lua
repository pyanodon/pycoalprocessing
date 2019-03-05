local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/rectisol/pipe-north.png",
        priority = "extra-high",
        width = 44,
        height = 25
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/rectisol/pipe-ending-down.png",
        priority = "extra-high",
        width = 40,
        height = 32
    }
}

RECIPE {
    type = "recipe",
    name = "rectisol-mk03",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"rectisol-mk02", 1},
        {"storage-tank", 2},
        {"processing-unit", 20},
        {"niobium-plate", 30},
        {"pump", 2},
    },
    results = {
        {"rectisol-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "rectisol-mk03",
    icon = "__pycoalprocessing__/graphics/icons/rectisol-mk03.png",
    icon_size = 32,
    flags = {},
    subgroup = "coal-processing",
    order = "v",
    place_result = "rectisol-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "rectisol-mk03",
    icon = "__pycoalprocessing__/graphics/icons/rectisol-mk03.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "rectisol-mk03"},
    fast_replaceable_group = "rectisol",
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"rectisol"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2
    },
    energy_usage = "500kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/rectisol/rectisol-mk03.png",
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
                filename = "__pycoalprocessing__/graphics/entity/rectisol/rec-tanks-anim-mk03.png",
                frame_count = 80,
                line_length = 10,
                width = 121,
                height = 55,
                animation_speed = 0.2
            }
        },
        {
            north_position = {2.03, -1.28},
            west_position = {2.03, -1.28},
            south_position = {2.03, -1.28},
            east_position = {2.03, -1.28},
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/rectisol/rec-lifter-anim-mk03.png",
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
        sound = {filename = "__pycoalprocessing__/sounds/rectisol.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/rectisol.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
