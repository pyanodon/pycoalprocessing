RECIPE {
    type = "recipe",
    name = "fluid-separator-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"fluid-separator-mk02", 1},
        {"storage-tank", 1},
        {"processing-unit", 5},
        {"niobium-plate", 15},
        {"electric-engine-unit", 5},
        {"kevlar", 30}
    },
    results = {
        {"fluid-separator-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "fluid-separator-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fluid-separator-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk03",
    order = "m",
    place_result = "fluid-separator-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "fluid-separator-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fluid-separator-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fluid-separator-mk03"},
    fast_replaceable_group = "fluid-separator",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fluid-separator"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "500kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/fluid-separator/fluid-separator-mk03.png",
        width = 248,
        height = 260,
        frame_count = 1,
        shift = {0.34, -0.57}
    },
    fluid_boxes = {
        --North
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {2.0, -4.0}}}
        },
        --North2
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0.0, -4.0}}}
        },
        --North3
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-2.0, -4.0}}}
        },
        --South3
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        },
        --South
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {2.0, 4.0}}}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-2.0, 4.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/fluid-separator.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/fluid-separator.ogg", volume = 0.3},
        apparent_volume = 1.2
    },
    next_upgrade = 'fluid-separator-mk04'
}
