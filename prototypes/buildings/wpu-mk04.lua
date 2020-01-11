RECIPE {
    type = "recipe",
    name = "wpu-mk04",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"wpu-mk03", 1},
        {"low-density-structure", 10},
        {"nbfe-alloy", 10},
    },
    results = {
        {"wpu-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "wpu-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/wpu-mk04.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk04",
    order = "c",
    place_result = "wpu-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "wpu-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/wpu-mk04.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "wpu-mk04"},
    fast_replaceable_group = "wpu",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"wpu"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "450kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/left-mk04.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {-1.5, -1.328},
                animation_speed = 0.42
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/right-mk04.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {1.5, -1.328},
                animation_speed = 0.42
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/wpu.ogg", volume = 1.0},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/wpu.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
