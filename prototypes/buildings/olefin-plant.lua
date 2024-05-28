RECIPE {
    type = "recipe",
    name = "olefin-plant",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"storage-tank", 4},
        {"chemical-plant-mk01", 2},
        {"advanced-circuit", 5},
        {"steel-plate", 40},
        {"iron-gear-wheel", 15}
    },
    results = {
        {"olefin-plant", 1}
    }
}:add_unlock("lubricant")

ITEM {
    type = "item",
    name = "olefin-plant",
    icon = "__pycoalprocessinggraphics__/graphics/icons/olefin-plant.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "r",
    place_result = "olefin-plant",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "olefin-plant",
    icon = "__pycoalprocessinggraphics__/graphics/icons/olefin-plant.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "olefin-plant"},
    fast_replaceable_group = "olefin-plant",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
    selection_box = {{-4, -4}, {4, 4}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"olefin"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "2MW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off.png",
        width = 274,
        height = 302,
        frame_count = 1,
        shift = util.by_pixel(9, -23)
    },
    working_visualisations = {
        {
            north_position = util.by_pixel(0, -104.5),
            west_position = util.by_pixel(0, -104.5),
            south_position = util.by_pixel(0, -104.5),
            east_position = util.by_pixel(0, -104.5),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim.png",
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
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {1.5, -4.5}}}
        },
        --North2
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.5, -4.5}}}
        },
        --South
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-1.5, 4.5}}}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = py.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {1.5, 4.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg", volume = 0.3},
        apparent_volume = 2.5
    },
    next_upgrade = mods['pyrawores'] and 'olefin-plant-mk02'
}
