RECIPE {
    type = "recipe",
    name = "hpf",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "stone-brick",        amount = 20},
        {type = "item", name = "copper-plate",       amount = 20},
        {type = "item", name = "iron-gear-wheel",    amount = 5}, --bob steel-bearing
        {type = "item", name = "iron-plate",         amount = 10}, --bob invar-alloy
        {type = "item", name = "electronic-circuit", amount = 3},
        {type = "item", name = "steam-engine",       amount = 1},
    },
    results = {
        {type = "item", name = "hpf", amount = 1}
    }
}:add_unlock("coal-processing-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "hpf" or "hpf-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "p",
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.5, result = name},
        fast_replaceable_group = "hpf",
        max_health = 300 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"hpf"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (2 * i) .. "MW",
        graphics_set = {
            working_visualisations = {
                {
                    fadeout = true,
                    constant_speed = true,
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
                    fadeout = true,
                    constant_speed = true,
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
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/bottom.png",
                        width = 224,
                        height = 32,
                        frame_count = 1,
                        shift = util.by_pixel(0, 96),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/off.png",
                        width = 224,
                        height = 320,
                        frame_count = 1,
                        shift = util.by_pixel(0, -80),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/hpf/mask.png",
                        width = 224,
                        height = 320,
                        frame_count = 1,
                        tint = py.tints[i],
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
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, 0.0}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.0, 0.0}, direction = defines.direction.west}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/hpf.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/hpf.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "hpf-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"hpf",              1},
        {"nexelit-plate",    10},
        {"advanced-circuit", 10},
        {"steel-plate",      15},
        {"concrete",         10},
    },
    results = {
        {"hpf-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "hpf-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"hpf-mk02",             1},
        {"electric-engine-unit", 1},
        {"kevlar",               10},
        {"processing-unit",      5},
        {"niobium-pipe",         10},
    },
    results = {
        {"hpf-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "hpf-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"hpf-mk03",              1},
        {"low-density-structure", 20},
        {"nbfe-alloy",            10},
    },
    results = {
        {"hpf-mk04", 1}
    }
}
