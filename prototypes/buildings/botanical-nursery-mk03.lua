local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/top.png",
        priority = "low",
        width = 260,
        height = 254
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/bottom.png",
        priority = "extra-high",
        width = 260,
        height = 254
    },
    west = {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/left.png",
        priority = "very-low",
        width = 260,
        height = 254
    },
    east = {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/right.png",
        priority = "extra-high",
        width = 260,
        height = 254
    }
}

RECIPE {
    type = "recipe",
    name = "botanical-nursery-mk03",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"botanical-nursery-mk02", 1},
        {"electric-engine-unit", 2},
        {"processing-unit", 10},
        {"niobium-plate", 40},
        {"kevlar", 15}
    },
    results = {
        {"botanical-nursery-mk03", 1}
    }
}

ITEM {
    type = "item",
    name = "botanical-nursery-mk03",
    icon = "__pycoalprocessing__/graphics/icons/botanical-nursery-mk03.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-extraction",
    order = "f",
    place_result = "botanical-nursery-mk03",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "botanical-nursery-mk03",
    icon = "__pycoalprocessing__/graphics/icons/botanical-nursery-mk03.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "botanical-nursery-mk03"},
    fast_replaceable_group = "botanical-nursery",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"nursery"},
    crafting_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = -25,
    },
    energy_usage = "330kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/botanical-nursery-mk03.png",
        width = 260,
        height = 254,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
        run_mode = "forward-then-backward",
        shift = {0.1, 0.1}
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {4.0, 0.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/botanical-nursery.ogg", volume = 1.8},
        idle_sound = {filename = "__pycoalprocessing__/sounds/botanical-nursery.ogg", volume = 0.95},
        apparent_volume = 2.5
    }
}
