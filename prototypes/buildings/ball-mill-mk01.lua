RECIPE {
    type = "recipe",
    name = "ball-mill-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"assembling-machine-1", 1},
        {"copper-plate", 30},
        {"steel-plate", 40},
        {"iron-plate", 50},
    },
    results = {
        {"ball-mill-mk01", 1}
    }
}:add_unlock("crusher")

ITEM {
    type = "item",
    name = "ball-mill-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ball-mill-mk01.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "d",
    place_result = "ball-mill-mk01",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "ball-mill-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ball-mill-mk01.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ball-mill-mk01"},
    fast_replaceable_group = "ball-mill",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"ball-mill"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "1MW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ball-mill/ball-mill-mk01.png",
        width = 215,
        height = 198,
        frame_count = 80,
        line_length = 8,
        animation_speed = 0.8,
        shift = {0.318, -0.12}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
