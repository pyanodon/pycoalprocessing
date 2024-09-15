RECIPE {
    type = 'recipe',
    name = 'tar-processing-unit',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'steel-plate',        20},
        {'steam-engine',       3},
        {'iron-plate',         20},
        {'pipe',               20},
        {'stone-furnace',      3},
        {'electronic-circuit', 7}
    },
    results = {
        {'tar-processing-unit', 1}
    }
}:add_unlock('tar-processing')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'tar-processing-unit' or 'tar-processing-unit-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'z1',
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = 'assembling-machine',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {'placeable-neutral', 'player-creation'},
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = 'tar-processing-unit',
        max_health = i * 250,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-5.3, -5.3}, {5.3, 5.3}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'pollution', 'productivity'},
        crafting_categories = {'tar'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (500 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/r.png',
                    width = 352,
                    height = 384,
                    frame_count = 1,
                    shift = util.by_pixel(0, -16),
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/mask.png',
                    width = 352,
                    height = 384,
                    frame_count = 1,
                    shift = util.by_pixel(0, -16),
                    tint = py.tints[i],
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/l.png',
                    width = 352,
                    height = 384,
                    frame_count = 1,
                    shift = util.by_pixel(0, -16),
                    draw_as_glow = true,
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/sh.png',
                    width = 416,
                    height = 416,
                    frame_count = 1,
                    shift = util.by_pixel(0, -16),
                    draw_as_shadow = true,
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/ao.png',
                    width = 416,
                    height = 416,
                    frame_count = 1,
                    shift = util.by_pixel(0, -0),
                },
            },
        },
        working_visualisations = {
            --flat liquid
            {
                fadeout = true,
                constant_speed = true,
                apply_recipe_tint = 'primary',
                north_position = util.by_pixel(-0, -16),
                west_position = util.by_pixel(-0, -16),
                south_position = util.by_pixel(-0, -16),
                east_position = util.by_pixel(-0, -16),
                animation = {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/liquid.png',
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
                apply_recipe_tint = 'secondary',
                north_position = util.by_pixel(-0, -128),
                west_position = util.by_pixel(-0, -128),
                south_position = util.by_pixel(-0, -128),
                east_position = util.by_pixel(-0, -128),
                animation = {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/tar-processing-unit/anim.png',
                    frame_count = 40,
                    line_length = 5,
                    width = 352,
                    height = 96,
                    animation_speed = 0.25,
                    draw_as_glow = true,
                }
            },
        },
        fluid_boxes = {
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {0, 6}, direction = defines.direction.south}}
            },
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {2, 6}, direction = defines.direction.south}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = 'output', position = {-3, -6}, direction = defines.direction.north}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = 'output', position = {1, -6}, direction = defines.direction.north}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = 'output', position = {-1, -6}, direction = defines.direction.north}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0.0, -0.96}, nil, nil),
                volume = 100,
                pipe_connections = {{flow_direction = 'output', position = {3, -6}, direction = defines.direction.north}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__base__/sound/oil-refinery.ogg'},
            idle_sound = {filename = '__base__/sound/idle1.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'tar-processing-unit-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'tar-processing-unit', 1},
        {'engine-unit',         1},
        {'nexelit-plate',       20},
        {'concrete',            60},
        {'plastic-bar',         10},
        {'advanced-circuit',    10}
    },
    results = {
        {'tar-processing-unit-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'tar-processing-unit-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'tar-processing-unit-mk02', 1},
        {'processing-unit',          20},
        {'niobium-plate',            30},
        {'electric-engine-unit',     2},
        {'pump',                     2},
    },
    results = {
        {'tar-processing-unit-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'tar-processing-unit-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'tar-processing-unit-mk03', 1},
        {'pump',                     4},
        {'nbfe-alloy',               20},
        {'low-density-structure',    10},
    },
    results = {
        {'tar-processing-unit-mk04', 1}
    }
}
