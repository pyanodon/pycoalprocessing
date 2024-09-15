local pipes = {
    south = {
        filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-pipe-S.png",
        priority = "extra-high",
        width = 44,
        height = 31
    }
}

RECIPE {
    type = "recipe",
    name = "cooling-tower-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"storage-tank", 1},
        {"pump", 2},
        {"advanced-circuit", 5},
        {"pipe", 30}, --bob copper-pipe
        {"iron-plate", 30}, --bob brass-allloy
        {"concrete", 50}
    },
    results = {
        {"cooling-tower-mk02", 1}
    }
}:add_unlock("cooling-tower-2")

ITEM {
    type = "item",
    name = "cooling-tower-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "coal-processing",
    order = "i",
    place_result = "cooling-tower-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "cooling-tower-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    fixed_recipe = "cooling-water-2",
    minable = {mining_time = 1, result = "cooling-tower-mk02"},
    fast_replaceable_group = "cooling-tower",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    match_animation_speed_to_activity = false,
    module_slots = 4,
    allowed_effects = {"speed", "consumption"},
    crafting_categories = {"cooling"},
    crafting_speed = 4,
    energy_source = {type = "void"},
    energy_usage = "70kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/cooling-tower-mk02/cooling_tower_mk02.png",
        width = 192,
        height = 256,
        frame_count = 1,
        animation_speed = 1,
        shift = {0.5, -1.504}
    },
    working_visualisations = {
        {
            north_position = {-0.0, -5.01},
            west_position = {-0.0, -5.01},
            south_position = {-0.0, -5.01},
            east_position = {-0.0, -5.01},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/cooling-tower-mk02/smoke-sheet.png",
                frame_count = 96,
                line_length = 12,
                width = 160,
                height = 160,
                animation_speed = 0.2
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {-0.05, -0.7}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {1.0, -2.4}, direction = defines.direction.north}}
        },
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {-0.05, -0.7}, nil, nil, pipes),
            pipe_covers = py.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{flow_direction = "output", position = {-1.0, -2.4}, direction = defines.direction.north}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
