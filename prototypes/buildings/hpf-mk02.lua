RECIPE {
    type = "recipe",
    name = "hpf-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"hpf", 1},
        {"nexelit-plate", 10},
        {"advanced-circuit", 10},
        {"steel-plate", 15},
        {"concrete", 10},
    },
    results = {
        {"hpf-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "hpf-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/hpf-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "p",
    place_result = "hpf-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "hpf-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/hpf-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "hpf-mk02"},
    fast_replaceable_group = "hpf",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"hpf"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "4MW",
    animation = {
        layers = {
            {
            filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/bottom.png",
            width = 224,
            height = 32,
            frame_count = 1,
            --animation_speed = 0.5,
            shift = util.by_pixel(0, 96),
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/off.png",
                width = 224,
                height = 320,
                frame_count = 1,
                --animation_speed = 0.5,
                shift = util.by_pixel(0, -80),
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/mask.png",
                width = 224,
                height = 320,
                frame_count = 1,
                tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0},
                shift = util.by_pixel(0, -80),
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/sh.png",
                width = 288,
                height = 224,
                frame_count = 1,
                draw_as_shadow = true,
                shift = util.by_pixel(32, -0),
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/ao.png",
                width = 320,
                height = 384,
                frame_count = 1,
                shift = util.by_pixel(16, -48),
            },
    },
},
    working_visualisations = {
        {
            north_position = util.by_pixel(0, -80),
            west_position = util.by_pixel(0, -80),
            south_position = util.by_pixel(0, -80),
            east_position = util.by_pixel(0, -80),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/on.png",
                frame_count = 40,
                line_length = 10,
                width = 224,
                height = 320,
                animation_speed = 0.5
            }
        },
        {
            north_position = util.by_pixel(0, -80),
            west_position = util.by_pixel(0, -80),
            south_position = util.by_pixel(0, -80),
            east_position = util.by_pixel(0, -80),
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/g.png",
                frame_count = 40,
                line_length = 10,
                width = 224,
                height = 320,
                animation_speed = 0.5,
                draw_as_glow = true,
            }
        },
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {4.0, -0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-4.0, -0.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/hpf.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/hpf.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
