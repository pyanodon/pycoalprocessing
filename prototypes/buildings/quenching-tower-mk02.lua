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
    name = "quenching-tower-mk02",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"quenching-tower", 1},
        {"plastic-bar", 20},
        {"pump", 4},
        {"advanced-circuit", 15}
    },
    results = {
        {"quenching-tower-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "quenching-tower-mk02",
    icon = "__pycoalprocessing__/graphics/icons/quenching-tower-mk02.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "u",
    place_result = "quenching-tower-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "quenching-tower-mk02",
    icon = "__pycoalprocessing__/graphics/icons/quenching-tower-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "quenching-tower-mk02"},
    fast_replaceable_group = "quenching-tower",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"quenching-tower"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 50,
    },
    energy_usage = "400kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/quenching-tower-anim-mk02.png",
        width = 232,
        height = 252,
        frame_count = 60,
        line_length = 8,
        animation_speed = 0.5,
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
