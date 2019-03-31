RECIPE {
    type = "recipe",
    name = "fts-reactor-mk04",
    energy_required = 10,
    enabled = false,
    ingredients = {
        {"fts-reactor-mk03", 1},
        {"low-density-structure", 15},
        {"nbfe-alloy", 5},
    },
    results = {
        {"fts-reactor-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "fts-reactor-mk04",
    icon = "__pycoalprocessing__/graphics/icons/fts-reactor-mk04.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "n",
    place_result = "fts-reactor-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "fts-reactor-mk04",
    icon = "__pycoalprocessing__/graphics/icons/fts-reactor-mk04.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fts-reactor-mk04"},
    fast_replaceable_group = "fts-reactor",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fts-reactor"},
    crafting_speed = 3.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_second_per_watt = 1e-06,
    },
    energy_usage = "700kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessing__/graphics/entity/fts-reactor/base-anim-mk04.png",
                width = 192,
                height = 160,
                line_length = 10,
                frame_count = 99,
                shift = {0.507, 0},
                animation_speed = 0.15
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/fts-reactor/top-anim-mk04.png",
                width = 185,
                height = 226,
                line_length = 11,
                frame_count = 99,
                shift = {-0.243, -6.0},
                animation_speed = 0.15
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, -0.0}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, 2.0}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, -2.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, -0.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, 2.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, -2.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/evaporator.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/evaporator.ogg", volume = 0.5},
        apparent_volume = 2.5
    }
}
