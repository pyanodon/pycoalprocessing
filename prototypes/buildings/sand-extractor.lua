RECIPE {
    type = "recipe",
    name = "sand-extractor",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"iron-plate", 40},
        {"niobium-plate", 20},
        {"steam-engine", 1},
        {"chromium", 10},
        {"iron-gear-wheel", 20},
        {"electronic-circuit", 12}
    },
    results = {
        {"sand-extractor", 1}
    }
}:add_unlock("excavation-1")

ITEM {
    type = "item",
    name = "sand-extractor",
    icon = "__pycoalprocessinggraphics__/graphics/icons/sand-extractor.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "e",
    place_result = "sand-extractor",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "sand-extractor",
    icon = "__pycoalprocessinggraphics__/graphics/icons/sand-extractor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "sand-extractor"},
    fast_replaceable_group = "sand-extractor",
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "productivity", "pollution", "speed"},
    crafting_categories = {"sand-extractor"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "1MW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/sand-extractor/sand-extractor.png",
        width = 192,
        height = 202,
        frame_count = 90,
        line_length = 10,
        animation_speed = 0.35,
        shift = {0.0, -0.312}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/sand-extractor.ogg", volume = 0.9},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/sand-extractor.ogg", volume = 0.3},
        apparent_volume = 0.45
    }
}
