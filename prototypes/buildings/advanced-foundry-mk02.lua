RECIPE {
    type = "recipe",
    name = "advanced-foundry-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"advanced-foundry-mk01", 1},
        {"nexelit-plate", 20},
        {"concrete", 60},
        {"engine-unit", 4},
        {"steel-plate", 40},
        {"plastic-bar", 10},
        {"advanced-circuit", 10}
    },
    results = {
        {"advanced-foundry-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "advanced-foundry-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/advanced-foundry-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "b",
    place_result = "advanced-foundry-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "advanced-foundry-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/advanced-foundry-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "advanced-foundry-mk02"},
    fast_replaceable_group = "advanced-foundry",
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"advanced-foundry", "smelting"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "3.4MW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-base-mk02.png",
                width = 224,
                height = 224,
                line_length = 9,
                frame_count = 76,
                shift = {0.3, -0.5},
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-top-mk02.png",
                width = 224,
                height = 41,
                line_length = 9,
                frame_count = 76,
                shift = {0.3, -4.63},
                animation_speed = 0.5
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.88}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.4, -0.5}}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.88}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.5, 3.4}}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.88}, nil, nil),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-3.4, -0.5}}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.88}, nil, nil),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-0.5, 3.4}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/advanced-foundry.ogg", volume = 0.45},
    }
}
