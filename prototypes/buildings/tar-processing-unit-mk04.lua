local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/north.png",
        priority = "extra-high",
        width = 236,
        height = 235
    }
}

RECIPE {
    type = "recipe",
    name = "tar-processing-unit-mk04",
    energy_required = 5,
    enabled = false,
    ingredients = {
        {"tar-processing-unit-mk03", 1},
        {"pump", 4},
        {"nbfe-alloy", 20},
        {"low-density-structure", 10},
    },
    results = {
        {"tar-processing-unit-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "tar-processing-unit-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/tar-processing-unit-mk04.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "z1",
    place_result = "tar-processing-unit-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "tar-processing-unit-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/tar-processing-unit-mk04.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "tar-processing-unit-mk04"},
    fast_replaceable_group = "tar-processing-unit",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"tar"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "400kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/tar-processing-mk04.png",
        width = 236,
        height = 229,
        frame_count = 1,
        shift = {0.15, -0.1}
    },
    working_visualisations = {
        {
            north_position = {1.212, -0.07},
            west_position = {1.212, -0.07},
            south_position = {1.212, -0.07},
            east_position = {1.212, -0.07},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/tar-anim-mk04.png",
                frame_count = 40,
                line_length = 8,
                width = 96,
                height = 67,
                animation_speed = 0.2
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.15, 3.8}, {-0.0, -0.95}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0, 4}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.15, 3.8}, {-0.0, -0.95}, nil, nil, pipes),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0, -4}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__base__/sound/oil-refinery.ogg"},
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
