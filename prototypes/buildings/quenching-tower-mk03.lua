local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/top-right.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/south-left.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/top-left.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/south-right.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}

RECIPE {
    type = "recipe",
    name = "quenching-tower-mk03",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"quenching-tower-mk02", 1},
        {"electric-engine-unit", 4},
        {"niobium-plate", 20},
        {"pipe", 20},
        {"processing-unit", 10}
    },
    results = {
        {"quenching-tower-mk03", 1}
    }
}:replace_ingredient("pipe", "niobium-pipe")

ITEM {
    type = "item",
    name = "quenching-tower-mk03",
    icon = "__pycoalprocessing__/graphics/icons/quenching-tower-mk03.png",
    icon_size = 32,
    flags = {},
    subgroup = "coal-processing",
    order = "u",
    place_result = "quenching-tower-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "quenching-tower-mk03",
    icon = "__pycoalprocessing__/graphics/icons/quenching-tower-mk03.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "quenching-tower-mk03"},
    fast_replaceable_group = "quenching-tower",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"quenching-tower"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.001,
    },
    energy_usage = "500kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/quenching-tower-anim-mk03.png",
        width = 232,
        height = 252,
        frame_count = 60,
        line_length = 8,
        animation_speed = 0.25,
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
        sound = {filename = "__pycoalprocessing__/sounds/quenching-tower.ogg", volume = 0.42},
        idle_sound = {filename = "__pycoalprocessing__/sounds/quenching-tower.ogg", volume = 0.36},
        apparent_volume = 2.5
    }
}
