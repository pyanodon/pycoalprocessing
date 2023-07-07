RECIPE {
    type = "recipe",
    name = "ground-borer-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ground-borer-mk02", 1},
        {"niobium-plate", 20},
        {"electric-engine-unit", 4},
        {"processing-unit", 10},
        {"kevlar", 15},
    },
    results = {
        {"ground-borer-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "ground-borer-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ground-borer-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk03",
    order = "c",
    place_result = "ground-borer-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "ground-borer-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ground-borer-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "ground-borer-mk03"},
    fast_replaceable_group = "ground-borer",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed"},
    crafting_categories = {"ground-borer"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "1020kW",
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
            tint = {r = 0.223, g = 0.490, b = 0.858, a = 1.0}
            },
        },
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 5.0}}}
        },
        --2
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
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
    next_upgrade = 'ground-borer-mk04'
}
