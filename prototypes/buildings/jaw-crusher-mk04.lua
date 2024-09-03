RECIPE {
    type = "recipe",
    name = "jaw-crusher-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"jaw-crusher-mk03", 1},
        {"concrete", 40},
        {"nbfe-alloy", 15},
    },
    results = {
        {"jaw-crusher-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "jaw-crusher-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/jaw-crusher-mk04.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "s",
    place_result = "jaw-crusher-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "jaw-crusher-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/jaw-crusher-mk04.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "jaw-crusher-mk04"},
    fast_replaceable_group = "jaw-crusher",
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"crusher"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "600kW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-left-mk04.png",
                width = 96,
                height = 256,
                line_length = 21,
                frame_count = 161,
                shift = {-2.0, -0.5},
                animation_speed = 0.3
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-mid-mk04.png",
                width = 96,
                height = 256,
                line_length = 21,
                frame_count = 161,
                shift = {1.0, -0.5},
                animation_speed = 0.3
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-right-mk04.png",
                width = 32,
                height = 256,
                line_length = 64,
                frame_count = 161,
                shift = {3.0, -0.5},
                animation_speed = 0.3
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.85},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
