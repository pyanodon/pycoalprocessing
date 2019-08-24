local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/automated-factory/top-conection.png",
        priority = "extra-high",
        width = 244,
        height = 280
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk02",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"automated-factory-mk01", 1},
        {"assembling-machine-1", 2},
        {"plastic-bar", 20},
        {"fast-inserter", 4},
        {"engine-unit", 4},
        {"advanced-circuit", 15}
    },
    results = {
        {"automated-factory-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "automated-factory-mk02",
    icon = "__pycoalprocessing__/graphics/icons/automated-factory-mk02.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "c",
    place_result = "automated-factory-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "automated-factory-mk02",
    icon = "__pycoalprocessing__/graphics/icons/automated-factory-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "automated-factory-mk02"},
    fast_replaceable_group = "automated-factory",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"crafting", "crafting-with-fluid", "advanced-crafting"},
    crafting_speed = 2.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "200kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessing__/graphics/entity/automated-factory/mk02-left.png",
                width = 128,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {-1.5, -0.68},
                animation_speed = 0.3
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/automated-factory/mk02-right.png",
                width = 116,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {2.31, -0.68},
                animation_speed = 0.3
            }
        }
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {2.0, 4.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/automated-factory.ogg", volume = 1.0},
        idle_sound = {filename = "__pycoalprocessing__/sounds/automated-factory.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
