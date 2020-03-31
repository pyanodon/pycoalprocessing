local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/top-right.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/south-left.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/top-left.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/south-right.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}

RECIPE {
    type = "recipe",
    name = "quenching-tower-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"quenching-tower-mk03", 1},
        {"low-density-structure", 10},
        {"nbfe-alloy", 10},
        {"kevlar", 20},
    },
    results = {
        {"quenching-tower-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "quenching-tower-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/quenching-tower-mk04.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "u",
    place_result = "quenching-tower-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "quenching-tower-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/quenching-tower-mk04.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "quenching-tower-mk04"},
    fast_replaceable_group = "quenching-tower",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"quenching-tower"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "600kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/quenching-tower-anim-mk04.png",
        width = 232,
        height = 252,
        frame_count = 60,
        line_length = 8,
        animation_speed = 0.7,
        shift = {0.08, 0.0}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {1.08, 4.0}, {-0.82, -4.0}, nil, nil, pipes2),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, -1.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, 1.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.0, -1.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {1.08, 4.0}, {-0.82, -4.0}, nil, nil, pipes2),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.0, 1.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.0, 4.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/quenching-tower.ogg", volume = 0.42},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/quenching-tower.ogg", volume = 0.36},
        apparent_volume = 2.5
    }
}
