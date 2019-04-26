local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/soil-extractormk01/long-pipe-north.png",
        priority = "low",
        width = 30,
        height = 44
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/soil-extractormk01/pipe-south.png",
        priority = "extra-high",
        width = 40,
        height = 45
    }
}

RECIPE {
    type = "recipe",
    name = "soil-extractormk02",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"soil-extractormk01", 1},
        {"plastic-bar", 20},
        {"pump", 4},
        {"advanced-circuit", 15},
        {"copper-cable", 50},
    },
    results = {
        {"soil-extractormk02", 1}
    }
}

ITEM {
    type = "item",
    name = "soil-extractormk02",
    icon = "__pycoalprocessing__/graphics/icons/soil-extractormk02.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-extraction",
    order = "g",
    place_result = "soil-extractormk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "soil-extractormk02",
    icon = "__pycoalprocessing__/graphics/icons/soil-extractormk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "soil-extractormk02"},
    fast_replaceable_group = "soil-extractormk01",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.48, -3.48}, {3.48, 3.48}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"soil-extraction"},
    crafting_speed = 1.2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "500kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/soil-extractormk01/soil-extractormk02.png",
        width = 235,
        height = 266,
        frame_count = 30,
        line_length = 6,
        animation_speed = 0.6,
        shift = {0.16, -0.609}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0, 1}, {0, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, 0.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/soil-extractormk01.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/soil-extractormk01.ogg", volume = 0.45},
        apparent_volume = 2.5
    }
}
