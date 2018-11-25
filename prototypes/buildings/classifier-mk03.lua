RECIPE {
    type = "recipe",
    name = "classifier-mk03",
    energy_required = 35,
    enabled = false,
    ingredients = {
        {"classifier-mk02", 1},
        {"electric-engine-unit", 4},
        {"express-transport-belt", 20},
        {"kevlar", 15},
        {"processing-unit", 5},
        {"niobium-plate", 10},
    },
    results = {
        {"classifier-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "classifier-mk03",
    icon = "__pycoalprocessing__/graphics/icons/classifier-mk03.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "f",
    place_result = "classifier-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "classifier-mk03",
    icon = "__pycoalprocessing__/graphics/icons/classifier-mk03.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "classifier-mk03"},
    fast_replaceable_group = "classifier",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.45, -3.45}, {3.45, 3.45}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"classifier"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 2.6
    },
    energy_usage = "370kW",
    ingredient_count = 4,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/classifier/classifier-mk03.png",
        width = 256,
        height = 257,
        frame_count = 34,
        line_length = 8,
        animation_speed = 0.7,
        shift = {0.495, -0.48}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/classifier.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.55},
        apparent_volume = 2.5
    }
}
