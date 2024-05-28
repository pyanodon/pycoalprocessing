RECIPE {
    type = "recipe",
    name = "ground-borer-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ground-borer", 1},
        {"nexelit-plate", 10},
        {"concrete", 40},
        {"plastic-bar", 10},
        {"engine-unit", 4},
        {"advanced-circuit", 10}
    },
    results = {
        {"ground-borer-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "ground-borer-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ground-borer-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "c",
    place_result = "ground-borer-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "ground-borer-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ground-borer-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ground-borer-mk02"},
    fast_replaceable_group = "ground-borer",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed"},
    crafting_categories = {"ground-borer"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "720kW",
    animation = {
        layers = {
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer.png",
            width = 307,
            height = 311,
            line_length = 6,
            frame_count = 30,
            animation_speed = 0.8,
            shift = {0.2, -0.03}
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer-mask.png",
            width = 307,
            height = 311,
            line_length = 6,
            frame_count = 30,
            animation_speed = 0.8,
            shift = {0.2, -0.03},
            tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0}
            },
        },
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 5.0}}}
        },
        --2
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -5.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/ground-borer.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/ground-borer.ogg", volume = 0.3},
        apparent_volume = 2.5
    },
    next_upgrade = 'ground-borer-mk03'
}
