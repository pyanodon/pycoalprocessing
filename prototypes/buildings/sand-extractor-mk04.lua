RECIPE {
    type = "recipe",
    name = "sand-extractor-mk04",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"sand-extractor-mk03", 1},
        {"low-density-structure", 20},
        {"nbfe-alloy", 10},
    },
    results = {
        {"sand-extractor-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "sand-extractor-mk04",
    icon = "__pycoalprocessing__/graphics/icons/sand-extractor-mk04.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-extraction",
    order = "e",
    place_result = "sand-extractor-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "sand-extractor-mk04",
    icon = "__pycoalprocessing__/graphics/icons/sand-extractor-mk04.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "sand-extractor-mk04"},
    fast_replaceable_group = "sand-extractor",
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "productivity", "pollution", "speed"},
    crafting_categories = {"sand-extractor"},
    crafting_speed = 4,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "450kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/sand-extractor/sand-extractor-mk04.png",
        width = 192,
        height = 202,
        frame_count = 90,
        line_length = 10,
        animation_speed = 0.35,
        shift = {0.0, -0.312}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/sand-extractor.ogg", volume = 0.9},
        idle_sound = {filename = "__pycoalprocessing__/sounds/sand-extractor.ogg", volume = 0.65},
        apparent_volume = 0.45
    }
}
