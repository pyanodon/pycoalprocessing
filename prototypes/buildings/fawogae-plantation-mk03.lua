local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/pipe-north.png",
        priority = "low",
        width = 32,
        height = 32
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/pipe-south.png",
        priority = "extra-high",
        width = 32,
        height = 32
    }
}

RECIPE {
    type = "recipe",
    name = "fawogae-plantation-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"fawogae-plantation-mk02", 1},
        {"niobium-plate", 15},
        {"electric-engine-unit", 1},
        {"processing-unit", 10},
        {"treated-wood", 20}, --pyht fiberboard
        {"niobium-pipe", 20},
    },
    results = {
        {"fawogae-plantation-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "fawogae-plantation-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fawogae-plantation-mk03.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "b",
    place_result = "fawogae-plantation-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "fawogae-plantation-mk03",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fawogae-plantation-mk03.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fawogae-plantation-mk03"},
    fast_replaceable_group = "fawogae-plantation",
    max_health = 300,
    corpse = "big-remnants",
    --fixed_recipe = "fawogae",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fawogae"},
    crafting_speed = 0.9,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = -5,
    },
    energy_usage = "400kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/fawogae-mk03.png",
        width = 200,
        height = 193,
        frame_count = 100,
        line_length = 10,
        animation_speed = 0.4,
        shift = {0.13, -0.03}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-3.5, 0.5}}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.5, -0.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/fawogae-plantation.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/fawogae-plantation.ogg", volume = 0.3},
        apparent_volume = 1.2
    }
}
