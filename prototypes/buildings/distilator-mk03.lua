RECIPE {
    type = "recipe",
    name = "distilator-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"distilator-mk02", 1},
        {"electric-engine-unit", 4},
        {"steel-plate", 15},
        {"niobium-plate", 20},
        {"processing-unit", 5},
        {"niobium-pipe", 15},
    },
    results = {
        {"distilator-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "distilator-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/distilator-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk03",
    order = "k",
    place_result = "distilator-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "distilator-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/distilator-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "distilator-mk03"},
    fast_replaceable_group = "distilator",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "pollution", "productivity"},
    crafting_categories = {"distilator"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "500kW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-mk03-a.png",
                width = 96,
				height = 358,
                line_length = 20,
                frame_count = 100,
                animation_speed = 0.5,
                shift = util.by_pixel(-80, -50)
            },
			{
               filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-mk03-b.png",
               width = 96,
			   height = 358,
               line_length = 20,
               frame_count = 100,
               animation_speed = 0.5,
               shift = util.by_pixel(16, -50)
            },
			{
               filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-mk03-c.png",
               width = 96,
			   height = 358,
               line_length = 20,
               frame_count = 100,
               animation_speed = 0.5,
               shift = util.by_pixel(112, -50)
            },
        }
    },
    fluid_boxes = {
        --North, left
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{type = "input", position = {-1.5, -4.5}}}
        },
        --North, right
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{type = "output", position = {1.5, -4.5}}}
        },
        --South, left
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{type = "input", position = {-1.5, 4.5}}}
        },
        --South, right
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{type = "output", position = {1.5, 4.5}}}
        },
        --West, top
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{type = "input", position = {-4.5, -1.5}}}
        },
        --West, bottom
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{type = "output", position = {-4.5, 1.5}}}
        },
        --East, top
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{type = "input", position = {4.5, -1.5}}}
        },
        --East, bottom
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{type = "output", position = {4.5, 1.5}}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{type = "output", position = {4.5, 3.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/distilator.ogg", volume = 1.2},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/distilator.ogg", volume = 0.3},
        apparent_volume = 2.5
    },
    next_upgrade = 'distilator-mk04'
}
