local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/washer/pipe-north.png",
        priority = "low",
        width = 30,
        height = 44
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/washer/north.png",
        priority = "low",
        width = 241,
        height = 241
    }
}

RECIPE {
    type = "recipe",
    name = "washer-mk02",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"washer", 1},
        {"engine-unit", 2},
        {"advanced-circuit", 5},
        {"nexelit-plate", 30}
    },
    results = {
        {"washer-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "washer-mk02",
    icon = "__pycoalprocessing__/graphics/icons/washer-mk02.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "z2",
    place_result = "washer-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "washer-mk02",
    icon = "__pycoalprocessing__/graphics/icons/washer-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "washer-mk02"},
    fast_replaceable_group = "washer",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.0, -3.0}, {3.0, 3.0}},
    selection_box = {{-3.1, -3.1}, {3.1, 3.1}},
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"washer"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "200kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/washer/washer-mk02.png",
        width = 204,
        height = 204,
        frame_count = 80,
        line_length = 10,
        animation_speed = 0.6,
        shift = {0.17, -0.17}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {1.17, 2.78}, {-0.05, -0.8}, nil, nil, pipes2),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.5, 3.5}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {-0.05, -0.8}, nil, nil, pipes),
            base_level = 1,
            pipe_connections = {{position = {0.5, -3.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/washer.ogg", volume = 1.8},
        idle_sound = {filename = "__pycoalprocessing__/sounds/washer.ogg", volume = 1.5},
        apparent_volume = 1.8
    }
}
