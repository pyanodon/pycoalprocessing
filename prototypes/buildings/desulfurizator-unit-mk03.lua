local pipe_left = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north1.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north2.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

RECIPE {
    type = "recipe",
    name = "desulfurizator-unit-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"desulfurizator-unit-mk02", 1},
        {"processing-unit", 5},
        {"niobium-plate", 10},
        {"electric-engine-unit", 4},
        {"kevlar", 30}
    },
    results = {
        {"desulfurizator-unit-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "desulfurizator-unit-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/desulfurizator-unit-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk03",
    order = "j",
    place_result = "desulfurizator-unit-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "desulfurizator-unit-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/desulfurizator-unit-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "desulfurizator-unit-mk03"},
    fast_replaceable_group = "desulfurizator-unit",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"desulfurization"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "450kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-anim-mk03.png",
        width = 196,
        height = 202,
        frame_count = 15,
        line_length = 5,
        animation_speed = 0.75,
        shift = {0.06, -0.1}
    },
    fluid_boxes = {
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.05, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_right),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {3.5, -1.5}}}
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {0.25, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_left),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.5, 1.5}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__base__/sound/chemical-plant.ogg"},
        --idle_sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.3},
        apparent_volume = 0.5
    },
    next_upgrade = 'desulfurizator-unit-mk04'
}
