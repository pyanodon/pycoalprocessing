RECIPE {
    type = "recipe",
    name = "olefin-plant-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"olefin-plant", 1},
        {"storage-tank", 3},
        {"advanced-circuit", 10},
        {"pump", 4},
        {"concrete", 40},
        {"nexelit-plate", 10}
    },
    results = {
        {"olefin-plant-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "olefin-plant-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/olefin-plant-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "r",
    place_result = "olefin-plant-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "olefin-plant-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/olefin-plant-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "olefin-plant-mk02"},
    fast_replaceable_group = "olefin-plant",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
    selection_box = {{-4, -4}, {4, 4}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"olefin"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "450kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off-mk02.png",
        width = 274,
        height = 302,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = util.by_pixel(9, -23)
    },
    working_visualisations = {
        {
            north_position = util.by_pixel(0, -104.5),
            west_position = util.by_pixel(0, -104.5),
            south_position = util.by_pixel(0, -104.5),
            east_position = util.by_pixel(0, -104.5),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim-mk02.png",
                frame_count = 84,
                line_length = 8,
                width = 256,
                height = 139,
                animation_speed = 0.4
            }
        }
    },
    fluid_boxes = {
        --North
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {1.5, -4.5}}}
        },
        --North2
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.5, -4.5}}}
        },
        --South
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-1.5, 4.5}}}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {1.5, 4.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg", volume = 0.75},
        apparent_volume = 2.5
    }
}
