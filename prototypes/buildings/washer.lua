local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/pipe-north.png",
        priority = "low",
        width = 30,
        height = 44
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/north.png",
        priority = "low",
        width = 241,
        height = 241
    }
}

RECIPE {
    type = "recipe",
    name = "washer",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {"iron-plate", 10},
        {"steam-engine", 1},
        {"pipe", 25},
        {"stone-brick", 30},
        {"electronic-circuit", 2}
    },
    results = {
        {"washer", 1}
    }
}--:add_unlock("energy-1")

ITEM {
    type = "item",
    name = "washer",
    icon = "__pycoalprocessinggraphics__/graphics/icons/washer.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "z2",
    place_result = "washer",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "washer",
    icon = "__pycoalprocessinggraphics__/graphics/icons/washer.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "washer"},
    fast_replaceable_group = "washer",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "pollution", "productivity"},
    crafting_categories = {"washer"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "400kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/washer.png",
        width = 204,
        height = 204,
        frame_count = 80,
        line_length = 10,
        animation_speed = 0.9,
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
            pipe_connections = {{type = 'output', position = {0.5, -3.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 1.8},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 0.3},
        apparent_volume = 1.8
    },
    next_upgrade = mods['pyrawores'] and 'washer-mk02'
}
