RECIPE {
    type = "recipe",
    name = "classifier-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"classifier", 1},
        {"nexelit-plate", 15},
        {"advanced-circuit", 10},
        {"engine-unit", 2},
        {"fast-transport-belt", 30},
        {"steel-plate", 15},
    },
    results = {
        {"classifier-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "classifier-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/classifier-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "f",
    place_result = "classifier-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "classifier-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/classifier-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "classifier-mk02"},
    fast_replaceable_group = "classifier",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.45, -3.45}, {3.45, 3.45}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"classifier"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "270kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/classifier/classifier-mk02.png",
        width = 256,
        height = 257,
        frame_count = 34,
        line_length = 8,
        animation_speed = 0.6,
        shift = {0.495, -0.48}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.3},
        apparent_volume = 2.5
    },
    next_upgrade = 'classifier-mk03'
}
