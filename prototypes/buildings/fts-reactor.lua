RECIPE {
    type = "recipe",
    name = "fts-reactor",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"concrete", 20},
        {"steel-plate", 20},
        {"stone-brick", 10},
        {"steam-engine", 2},
        {"iron-gear-wheel", 5},
        {"iron-plate", 10},
        {"electronic-circuit", 20}
    },
    results = {
        {"fts-reactor", 1}
    }
}:add_unlock("coal-processing-2")

ITEM {
    type = "item",
    name = "fts-reactor",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fts-reactor.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "n",
    place_result = "fts-reactor",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "fts-reactor",
    icon = "__pycoalprocessinggraphics__/graphics/icons/fts-reactor.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fts-reactor"},
    fast_replaceable_group = "fts-reactor",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-4.35, -4.35}, {4.35, 4.35}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fts-reactor"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "1.5MW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/bottom.png",
                width = 288,
                height = 32,
                line_length = 1,
                repeat_count = 100,
                shift = util.by_pixel(-0, 128),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/bot-still.png",
                width = 288,
                height = 160,
                line_length = 1,
                repeat_count = 100,
                shift = util.by_pixel(-0, 32),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/bot-still-mask.png",
                width = 288,
                height = 160,
                line_length = 1,
                repeat_count = 100,
                shift = util.by_pixel(-0, 32),
                tint = {r = 1.0, g = 1.0, b = 0.0, a = 1.0},
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/ao-bottom.png",
                width = 352,
                height = 608,
                line_length = 1,
                repeat_count = 100,
                shift = util.by_pixel(-0, -128),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/sh.png",
                width = 320,
                height = 256,
                line_length = 1,
                repeat_count = 100,
                draw_as_shadow = true,
                shift = util.by_pixel(16, 16),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/t1.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(-96, -192),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/t2.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(0, -192),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/t3.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(96, -192),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/ao1.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(-96, -192),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/ao2.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(0, -192),
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/ao3.png",
                width = 96,
                height = 288,
                line_length = 20,
                frame_count = 100,
                shift = util.by_pixel(96, -192),
                animation_speed = 0.5
            },
        }
    },

    working_visualisations = {
        {
            north_position = util.by_pixel(-0, -160),
            west_position = util.by_pixel(-0, -160),
            south_position = util.by_pixel(-0, -160),
            east_position = util.by_pixel(-0, -160),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/glow.png",
                frame_count = 100,
                line_length = 10,
                width = 160,
                height = 160,
                draw_as_glow = true,
                animation_speed = 0.5,
            }
        },
        {
            north_position = util.by_pixel(-0, -348),
            west_position = util.by_pixel(-0, -348),
            south_position = util.by_pixel(-0, -348),
            east_position = util.by_pixel(-0, -348),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/fts-reactor/fire.png",
                frame_count = 100,
                line_length = 10,
                width = 96,
                height = 192,
                draw_as_glow = true,
                animation_speed = 0.5,
            }
        },
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {5.0, -0.0}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {5.0, 2.0}}}
        },
        {
            production_type = "input",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {5.0, -2.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-5.0, -0.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-5.0, 2.0}}}
        },
        {
            production_type = "output",
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-5.0, -2.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg", volume = 0.3},
        apparent_volume = 2.5
    },
    next_upgrade = mods['pyrawores'] and 'fts-reactor-mk02'
}
