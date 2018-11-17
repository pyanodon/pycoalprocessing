RECIPE {
    type = "recipe",
    name = "distilator-mk02",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"distilator", 1},
        {"steel-plate", 10},
        {"nexelit-plate", 10},
        {"advanced-circuit", 5},
        {"plastic-bar", 10},
    },
    results = {
        {"distilator-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "distilator-mk02",
    icon = "__pycoalprocessing__/graphics/icons/distilator-mk02.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "k",
    place_result = "distilator-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "distilator-mk02",
    icon = "__pycoalprocessing__/graphics/icons/distilator-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "distilator-mk02"},
    fast_replaceable_group = "distilator-mk02",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution", "productivity"},
    crafting_categories = {"distilator"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2
    },
    energy_usage = "400kW",
    ingredient_count = 4,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessing__/graphics/entity/distilator/distilator-mk02.png",
                width = 283,
                height = 266,
                frame_count = 1,
                shift = {0.45, -0.156}
            }
        }
    },
    fluid_boxes = {
        --North, left
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{position = {-0.5, -4.5}}}
        },
        --North, right
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{position = {0.5, -4.5}}}
        },
        --South, left
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{position = {-0.5, 4.5}}}
        },
        --South, right
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{position = {0.5, 4.5}}}
        },
        --West, top
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{position = {-4.5, -0.5}}}
        },
        --West, bottom
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{position = {-4.5, 0.5}}}
        },
        --East, top
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{position = {4.5, -0.5}}}
        },
        --East, bottom
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{position = {4.5, 0.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__base__/sound/oil-refinery.ogg"},
        idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
