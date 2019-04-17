RECIPE {
    type = "recipe",
    name = "wpu-mk02",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"wpu", 1},
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
    icon = "__pycoalprocessing__/graphics/icons/wpu-mk02.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "c",
    place_result = "wpu-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "wpu-mk02",
    icon = "__pycoalprocessing__/graphics/icons/wpu-mk02.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "wpu-mk02"},
    fast_replaceable_group = "wpu",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"wpu"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_second_per_watt = 1e-06,
    },
    energy_usage = "250kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessing__/graphics/entity/wpu/left-mk02.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {-1.5, -1.328},
                animation_speed = 0.3
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/wpu/right-mk02.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {1.5, -1.328},
                animation_speed = 0.3
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/wpu.ogg", volume = 1.0},
        idle_sound = {filename = "__pycoalprocessing__/sounds/wpu.ogg", volume = 0.6},
        apparent_volume = 2.5
    }
}
