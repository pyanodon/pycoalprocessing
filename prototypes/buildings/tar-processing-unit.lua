RECIPE {
    type = "recipe",
    name = "tar-processing-unit",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-plate",        amount = 20},
        {type = "item", name = "steam-engine",       amount = 3},
        {type = "item", name = "iron-plate",         amount = 20},
        {type = "item", name = "pipe",               amount = 20},
        {type = "item", name = "stone-furnace",      amount = 3},
        {type = "item", name = "electronic-circuit", amount = 7}
    },
    results = {
        {type = "item", name = "tar-processing-unit", amount = 1}
    }
}:add_unlock("tar-processing")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "tar-processing-unit" or "tar-processing-unit-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "z1",
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
        fast_replaceable_group = "tar-processing-unit",
        max_health = i * 250,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.3, -5.3}, {5.3, 5.3}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"consumption", "speed", "pollution", "productivity"},
        crafting_categories = {"tar"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (500 * i) .. "kW",
        graphics_set = {
            working_visualisations = {
                --flat liquid
                {
                    fadeout = true,
                    constant_speed = true,
                    apply_recipe_tint = "primary",
                    north_position = util.by_pixel(-0, -16),
                    west_position = util.by_pixel(-0, -16),
                    south_position = util.by_pixel(-0, -16),
                    east_position = util.by_pixel(-0, -16),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/liquid.png",
                        frame_count = 1,
                        repeat_count = 40,
                        width = 352,
                        height = 384,
                        animation_speed = 0.25,
                        draw_as_glow = true,
                    }
                },
                --bubbles
                {
                    fadeout = true,
                    constant_speed = true,
                    apply_recipe_tint = "secondary",
                    north_position = util.by_pixel(-0, -128),
                    west_position = util.by_pixel(-0, -128),
                    south_position = util.by_pixel(-0, -128),
                    east_position = util.by_pixel(-0, -128),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/anim.png",
                        frame_count = 40,
                        line_length = 5,
                        width = 352,
                        height = 96,
                        animation_speed = 0.25,
                        draw_as_glow = true,
                    }
                },
            },
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/r.png",
                        width = 352,
                        height = 384,
                        frame_count = 1,
                        shift = util.by_pixel(0, -16),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/mask.png",
                        width = 352,
                        height = 384,
                        frame_count = 1,
                        shift = util.by_pixel(0, -16),
                        tint = py.tints[i],
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/l.png",
                        width = 352,
                        height = 384,
                        frame_count = 1,
                        shift = util.by_pixel(0, -16),
                        draw_as_glow = true,
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/sh.png",
                        width = 416,
                        height = 416,
                        frame_count = 1,
                        shift = util.by_pixel(0, -16),
                        draw_as_shadow = true,
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/ao.png",
                        width = 416,
                        height = 416,
                        frame_count = 1,
                        shift = util.by_pixel(0, -0),
                    },
                },
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0, 5.0}, direction = defines.direction.south}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {2, 5.0}, direction = defines.direction.south}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {-3, -5.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {1, -5.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {-1, -5.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {0.0, -0.96}, nil, nil),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {3, -5.0}, direction = defines.direction.north}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__base__/sound/oil-refinery.ogg"},
            idle_sound = {filename = "__base__/sound/idle1.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "tar-processing-unit-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "tar-processing-unit", amount = 1},
        {type = "item", name = "engine-unit",         amount = 1},
        {type = "item", name = "nexelit-plate",       amount = 20},
        {type = "item", name = "concrete",            amount = 60},
        {type = "item", name = "plastic-bar",         amount = 10},
        {type = "item", name = "advanced-circuit",    amount = 10}
    },
    results = {
        {type = "item", name = "tar-processing-unit-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "tar-processing-unit-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "tar-processing-unit-mk02", amount = 1},
        {type = "item", name = "processing-unit",          amount = 20},
        {type = "item", name = "niobium-plate",            amount = 30},
        {type = "item", name = "electric-engine-unit",     amount = 2},
        {type = "item", name = "pump",                     amount = 2},
    },
    results = {
        {type = "item", name = "tar-processing-unit-mk03", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "tar-processing-unit-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "tar-processing-unit-mk03", amount = 1},
        {type = "item", name = "pump",                     amount = 4},
        {type = "item", name = "nbfe-alloy",               amount = 20},
        {type = "item", name = "low-density-structure",    amount = 10},
    },
    results = {
        {type = "item", name = "tar-processing-unit-mk04", amount = 1}
    }
}
