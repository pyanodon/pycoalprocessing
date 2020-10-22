local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/top.png",
        priority = "low",
        width = 224,
        height = 230
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/bottom.png",
        priority = "extra-high",
        width = 224,
        height = 230
    },
    west = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/left.png",
        priority = "extra-high",
        width = 224,
        height = 230
    },
    east = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/right.png",
        priority = "extra-high",
        width = 224,
        height = 230
    }
}

RECIPE {
    type = "recipe",
    name = "ralesia-plantation-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ralesia-plantation-mk03", 1},
        {"low-density-structure", 10},
        {"nbfe-alloy", 10},
        {"kevlar", 20},
    },
    results = {
        {"ralesia-plantation-mk04", 1}
    }
}

ITEM {
    type = "item",
    name = "ralesia-plantation-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ralesia-plantation-mk04.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-extraction",
    order = "f",
    place_result = "ralesia-plantation-mk04",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "ralesia-plantation-mk04",
    icon = "__pycoalprocessinggraphics__/graphics/icons/ralesia-plantation-mk04.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ralesia-plantation-mk04"},
    fast_replaceable_group = "ralesia-plantation",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"ralesia"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = -35,
    },
    energy_usage = "250kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/ralesia-plantation-mk04.png",
        width = 224,
        height = 230,
        frame_count = 50,
        line_length = 8,
        animation_speed = 0.5,
        run_mode = "forward-then-backward",
        shift = {0.0, -0.163}
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/ralesia-plantation.ogg", volume = 1.2},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/ralesia-plantation.ogg", volume = 0.70},
        apparent_volume = 2.5
    }
}
