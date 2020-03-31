RECIPE {
    type = "recipe",
    name = "solid-separator-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"solid-separator", 1},
        {"engine-unit", 6},
        {"nexelit-plate", 10},
        {"plastic-bar", 10},
        {"advanced-circuit", 20}
    },
    results = {
        {"solid-separator-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "solid-separator-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/solid-separator-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "x",
    place_result = "solid-separator-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "solid-separator-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/solid-separator-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "solid-separator-mk02"},
    fast_replaceable_group = "solid-separator",
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
    crafting_categories = {"solid-separator"},
    crafting_speed = 1.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "250kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/solid-separator/solid-separator-mk02.png",
        width = 249,
        height = 298,
        frame_count = 20,
        line_length = 5,
        animation_speed = 1,
        shift = {0.37, -1.169}
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/solid-separator.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/solid-separator.ogg", volume = 0.75},
        apparent_volume = 2.5
    }
}
