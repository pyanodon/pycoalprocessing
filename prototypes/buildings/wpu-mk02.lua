RECIPE {
    type = "recipe",
    name = "wpu-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"wpu", 1},
        {"engine-unit", 2},
        {"advanced-circuit", 25},
        {"plastic-bar", 50},
        {"nexelit-plate", 15},
        {"fast-inserter", 4},
    },
    results = {
        {"wpu-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "wpu-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/wpu-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "c",
    place_result = "wpu-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "wpu-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/wpu-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "wpu-mk02"},
    fast_replaceable_group = "wpu",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"wpu"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "250kW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/left-mk02.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {-1.5, -1.328},
                animation_speed = 0.42
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/right-mk02.png",
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
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/wpu.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
