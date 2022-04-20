local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gasifier/pipe-north.png",
        priority = "low",
        width = 44,
        height = 25
    }
}

RECIPE {
    type = "recipe",
    name = "gasifier",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"steel-plate", 20},
        {"pipe", 20},
        {"iron-plate", 10},
        {"steam-engine", 2},
        --{"storage-tank", 1},
        {"electronic-circuit", 4}
    },
    results = {
        {"gasifier", 1}
    }
}:add_unlock("tar-processing")

ITEM {
    type = "item",
    name = "gasifier",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gasifier.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "o",
    place_result = "gasifier",
    stack_size = 5
}

ENTITY {
    type = "assembling-machine",
    name = "gasifier",
    icon = "__pycoalprocessinggraphics__/graphics/icons/gasifier.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "gasifier"},
    fast_replaceable_group = "gasifier",
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"gasifier"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "500kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gasifier/gasifier-anim.png",
        priority = "high",
        width = 269,
        height = 269,
        frame_count = 30,
        line_length = 6,
        animation_speed = 1,
        shift = {0.15, 0.3}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.5, -0.5}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
            pipe_connections = {{type = "input", position = {4.5, -2.5}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
            pipe_connections = {{type = "input", position = {4.5, 2.5}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
            pipe_connections = {{type = "output", position = {-4.5, -1.5}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.05, 0.575}, {0.00, -0.95}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.5, 1.5}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/gasifier.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/gasifier.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
