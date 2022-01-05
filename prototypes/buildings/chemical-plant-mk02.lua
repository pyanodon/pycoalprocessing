RECIPE {
    type = "recipe",
    name = "chemical-plant-mk02",
    energy_required = 1,
    enabled = false,
    ingredients = {
        {"chemical-plant-mk01", 1},
        {"concrete", 30},
        {"titanium-plate", 20},
        {"nickel-plate", 50},
        {"engine-unit", 5},
    },
    results = {
        {"chemical-plant-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "chemical-plant-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/chemical-plant-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "d",
    place_result = "chemical-plant-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "chemical-plant-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/chemical-plant-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "chemical-plant-mk02"},
    fast_replaceable_group = "chemical-plant",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"chemistry"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.1,
    },
    energy_usage = "2MW",
    animation = {
        layers = {
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/bottom.png",
            width = 288,
            height = 32,
            frame_count = 1,
            repeat_count = 80,
            animation_speed = 0.35,
            shift = util.by_pixel(-0, 128),
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/sh.png",
            width = 320,
            height = 256,
            frame_count = 1,
            repeat_count = 80,
            animation_speed = 0.35,
            draw_as_shadow = true,
            shift = util.by_pixel(16, 16),
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/left.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(-96, -64),
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/mid.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(0, -64),
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/right.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(96, -64),
            },
            --MASKS
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/left-mask.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(-96, -64),
            tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0},
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/mid-mask.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(0, -64),
            tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0},
            },
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/right-mask.png",
            width = 96,
            height = 352,
            frame_count = 80,
            line_length = 20,
            animation_speed = 0.35,
            shift = util.by_pixel(96, -64),
            tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0},
            },
        },
    },
    working_visualisations = {
        {
            north_position = util.by_pixel(96, -64),
            west_position = util.by_pixel(96, -64),
            south_position = util.by_pixel(96, -64),
            east_position = util.by_pixel(96, -64),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/reator.png",
                frame_count = 80,
                line_length = 20,
                draw_as_glow = true,
                width = 96,
                height = 96,
                animation_speed = 0.35,
            }
        },
        {
            north_position = util.by_pixel(0, -48),
            west_position = util.by_pixel(0, -48),
            south_position = util.by_pixel(0, -48),
            east_position = util.by_pixel(0, -48),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/light-y.png",
                frame_count = 1,
                repeat_count = 80,
                draw_as_light = true,
                draw_as_glow = true,
                width = 288,
                height = 384,
                animation_speed = 0.35,
            }
        },
        {
            north_position = util.by_pixel(0, -48),
            west_position = util.by_pixel(0, -48),
            south_position = util.by_pixel(0, -48),
            east_position = util.by_pixel(0, -48),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/light-b.png",
                frame_count = 1,
                repeat_count = 80,
                draw_as_light = true,
                draw_as_glow = true,
                width = 288,
                height = 384,
                animation_speed = 0.35,
            }
        },
        {
            north_position = util.by_pixel(32, -80),
            west_position = util.by_pixel(32, -80),
            south_position = util.by_pixel(32, -80),
            east_position = util.by_pixel(32, -80),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/smoke.png",
                frame_count = 80,
                line_length = 20,
                width = 96,
                height = 128,
                animation_speed = 0.35,
            }
        },
        {
            north_position = util.by_pixel(-48, 80),
            west_position = util.by_pixel(-48, 80),
            south_position = util.by_pixel(-48, 80),
            east_position = util.by_pixel(-48, 80),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/tira-light.png",
                frame_count = 80,
                line_length = 16,
                draw_as_glow = true,
                width = 128,
                height = 64,
                animation_speed = 0.35,
            }
        },
    },
    fluid_boxes = {
        --North
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {4.0, -5.0}}}
        },
        --North2
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0.0, -5.0}}}
        },
        --North3
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {2.0, -5.0}}}
        },
        --South3
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 5.0}}}
        },
        --South
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {2.0, 5.0}}}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, 5.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/chemical-plant.ogg", volume = 1.0},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/chemical-plant.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
