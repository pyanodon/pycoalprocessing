RECIPE {
    type = "recipe",
    name = "fts-reactor",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "concrete",           amount = 20},
        {type = "item", name = "steel-plate",        amount = 20},
        {type = "item", name = "stone-brick",        amount = 10},
        {type = "item", name = "steam-engine",       amount = 2},
        {type = "item", name = "iron-gear-wheel",    amount = 5},
        {type = "item", name = "iron-plate",         amount = 10},
        {type = "item", name = "electronic-circuit", amount = 20}
    },
    results = {
        {type = "item", name = "fts-reactor", amount = 1}
    }
}:add_unlock("coal-processing-2")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "fts-reactor" or "fts-reactor-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "n",
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = "fts-reactor",
        max_health = 300 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-4.35, -4.35}, {4.35, 4.35}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        crafting_categories = {"fts-reactor"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (1.5 * i) .. "MW",
        graphics_set = {
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
                    fadeout = true,
                    constant_speed = true,
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
                        tint = py.tints[i],
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
        },

        fluid_boxes = {
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = "input", position = {4.0, 0.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = "input", position = {4.0, 2.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = "input", position = {4.0, -2.0}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-4.0, 0.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-4.0, 2.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0, -0.9}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-4.0, -2.0}, direction = defines.direction.west}}
            }
        },
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.65},
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "fts-reactor-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"fts-reactor",      1},
        {"engine-unit",      6},
        {"nexelit-plate",    10},
        {"plastic-bar",      10},
        {"advanced-circuit", 20}
    },
    results = {
        {"fts-reactor-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "fts-reactor-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"fts-reactor-mk02",     1},
        {"electric-engine-unit", 6},
        {"kevlar",               15},
        {"processing-unit",      10},
    },
    results = {
        {"fts-reactor-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "fts-reactor-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"fts-reactor-mk03",      1},
        {"low-density-structure", 15},
        {"nbfe-alloy",            5},
    },
    results = {
        {"fts-reactor-mk04", 1}
    }
}
