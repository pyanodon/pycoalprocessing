local pipes = {
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/gasifier/pipe-north.png',
        priority = 'low',
        width = 44,
        height = 25
    }
}

RECIPE {
    type = 'recipe',
    name = 'gasifier',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'steel-plate',        20},
        {'pipe',               20},
        {'iron-plate',         10},
        {'steam-engine',       2},
        {'electronic-circuit', 4}
    },
    results = {
        {'gasifier', 1}
    }
}:add_unlock('tar-processing')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'gasifier' or 'gasifier-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'o',
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
        fast_replaceable_group = 'gasifier',
        max_health = 350 * i,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
        selection_box = {{-4, -4}, {4, 4}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'gasifier'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = 0.06 * i,
        },
        energy_usage = (500 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/gasifier/gasifier-anim.png',
                    priority = 'high',
                    width = 269,
                    height = 269,
                    frame_count = 30,
                    line_length = 6,
                    animation_speed = 1,
                    shift = {0.15, 0.3},
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/gasifier/gasifier-anim-mask.png',
                    priority = 'high',
                    width = 269,
                    height = 269,
                    frame_count = 30,
                    line_length = 6,
                    animation_speed = 1,
                    shift = {0.15, 0.3},
                    tint = py.tints[i]
                },
            }
        },
        fluid_boxes = {
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {4.5, -0.5}}}
            },
            {
                production_type = 'input',
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{type = 'input', position = {4.5, -2.5}}}
            },
            {
                production_type = 'input',
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{type = 'input', position = {4.5, 2.5}}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_level = 1,
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{type = 'output', position = {-4.5, -0.5}}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_level = 1,
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{type = 'output', position = {-4.5, -2.5}}}
            },
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.05, 0.575}, {0.00, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                base_level = 1,
                pipe_connections = {{type = 'output', position = {-4.5, 2.5}}}
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/gasifier.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/gasifier.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'gasifier-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'gasifier',         1},
        {'storage-tank',     1},
        {'plastic-bar',      30},
        {'engine-unit',      2},
        {'advanced-circuit', 10}
    },
    results = {
        {'gasifier-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'gasifier-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'gasifier-mk02',        1},
        {'storage-tank',         1},
        {'electric-engine-unit', 2},
        {'kevlar',               15},
        {'processing-unit',      10},
        {'niobium-plate',        20},
    },
    results = {
        {'gasifier-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'gasifier-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'gasifier-mk03', 1},
        {'storage-tank',  1},
        {'nbfe-alloy',    20},
    },
    results = {
        {'gasifier-mk04', 1}
    }
}
