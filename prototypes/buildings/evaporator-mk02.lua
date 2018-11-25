local pipes = {
    south = {
        filename = "__pycoalprocessing__/graphics/entity/evaporator/south-mk02.png",
        priority = "extra-high",
        width = 168,
        height = 194
    }
}

RECIPE {
    type = "recipe",
    name = "evaporator-mk02",
    energy_required = 15,
    enabled = false,
    ingredients = {
        {"evaporator", 1},
        {"engine-unit", 1},
        {"nexelit-plate", 10},
        {"advanced-circuit", 10},
    },
    results = {
        {"evaporator-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "evaporator-mk02",
    icon = "__pycoalprocessing__/graphics/icons/evaporator-mk02.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "l",
    place_result = "evaporator-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "evaporator-mk02",
    icon = "__pycoalprocessing__/graphics/icons/evaporator-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "evaporator-mk02"},
    fast_replaceable_group = "evaporator",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.48, -2.48}, {2.48, 2.48}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"evaporator"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2
    },
    energy_usage = "600kW",
    ingredient_count = 2,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/evaporator/evaporator-off-mk02.png",
        width = 168,
        height = 177,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.1, 0.0}
    },
    working_visualisations = {
        {
            north_position = {0.1, -0.0},
            west_position = {0.1, -0.0},
            south_position = {0.1, -0.0},
            east_position = {0.1, -0.0},
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/evaporator/evaporator-anim-mk02.png",
                frame_count = 80,
                line_length = 10,
                width = 168,
                height = 177,
                animation_speed = 0.2
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, 0.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 3.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-3.0, 0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0.0, -3.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/evaporator.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/evaporator.ogg", volume = 0.65},
        apparent_volume = 2.5
    }
}
