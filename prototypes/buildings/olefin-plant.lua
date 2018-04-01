RECIPE {
    type = "recipe",
    name = "olefin-plant",
    energy_required = 15,
    enabled = false,
    ingredients = {
        {"storage-tank", 4},
        {"chemical-plant", 2}, --bob electrolyser
        {"electronic-circuit", 30},
        {"steel-plate", 40},
        {"iron-gear-wheel", 15} --bob steel-bearing
    },
    results = {
        {"olefin-plant", 1}
    }
}:add_unlock("fuel-production")

ITEM {
    type = "item",
    name = "olefin-plant",
    icon = "__pycoalprocessing__/graphics/icons/olefin-plant.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "r",
    place_result = "olefin-plant",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "olefin-plant",
    icon = "__pycoalprocessing__/graphics/icons/olefin-plant.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "olefin-plant"},
    fast_replaceable_group = "olefin-plant",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
    selection_box = {{-3, -3}, {3, 3}},
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"olefin"},
    crafting_speed = 0.65,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03
    },
    energy_usage = "350kW",
    ingredient_count = 5,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/olefin-plant/olefin-off.png",
        width = 205,
        height = 224,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = util.by_pixel(7, -16)
    },
    working_visualisations = {
        {
            north_position = util.by_pixel(7.5, -16),
            west_position = util.by_pixel(7.5, -16),
            south_position = util.by_pixel(7.5, -16),
            east_position = util.by_pixel(7.5, -16),
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/olefin-plant/olefin-plant.png",
                frame_count = 69,
                line_length = 9,
                width = 205,
                height = 224,
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
            pipe_connections = {{type = "output", position = {0.5, -3.5}}}
        },
        --North2
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-1.5, -3.5}}}
        },
        --South
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-0.5, 3.5}}}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {1.5, 3.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/olefin-plant.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/olefin-plant.ogg", volume = 0.75},
        apparent_volume = 2.5
    }
}
