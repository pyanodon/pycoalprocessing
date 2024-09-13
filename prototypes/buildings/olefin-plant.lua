RECIPE {
    type = 'recipe',
    name = 'olefin-plant',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'storage-tank',        4},
        {'chemical-plant-mk01', 2},
        {'advanced-circuit',    5},
        {'steel-plate',         40},
        {'iron-gear-wheel',     15}
    },
    results = {
        {'olefin-plant', 1}
    }
}:add_unlock('lubricant')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'olefin-plant' or 'olefin-plant-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'r',
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = 'assembling-machine',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {'placeable-neutral', 'player-creation'},
        minable = {mining_time = 0.5, result = name},
        fast_replaceable_group = 'olefin-plant',
        max_health = i * 400,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
        selection_box = {{-4, -4}, {4, 4}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'olefin'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = i * 0.06,
        },
        energy_usage = (2 * i) .. 'MW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off.png',
                    width = 274,
                    height = 302,
                    frame_count = 1,
                    shift = util.by_pixel(9, -23),
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off-mask.png',
                    width = 274,
                    height = 302,
                    frame_count = 1,
                    shift = util.by_pixel(9, -23),
                    tint = py.tints[i],
                },
            }
        },
        working_visualisations = {
            {
                fadeout = true,
                constant_speed = true,
                north_position = util.by_pixel(0, -104.5),
                west_position = util.by_pixel(0, -104.5),
                south_position = util.by_pixel(0, -104.5),
                east_position = util.by_pixel(0, -104.5),
                animation = {
                    layers = {
                        {
                            filename = '__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim.png',
                            frame_count = 84,
                            line_length = 8,
                            width = 256,
                            height = 139,
                            animation_speed = 0.4,
                        },
                        {
                            filename = '__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim-mask.png',
                            frame_count = 84,
                            line_length = 8,
                            width = 256,
                            height = 139,
                            animation_speed = 0.4,
                            tint = py.tints[i],
                        }
                    }
                }
            }
        },
        fluid_boxes = {
            --North
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.0, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_level = 1,
                pipe_connections = {{type = 'output', position = {1.5, -4.5}}}
            },
            --North2
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.0, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_level = 1,
                pipe_connections = {{type = 'output', position = {-1.5, -4.5}}}
            },
            --South
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {-1.5, 4.5}}}
            },
            --South2
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {1.5, 4.5}}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/olefin-plant.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/olefin-plant.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'olefin-plant-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'olefin-plant',     1},
        {'storage-tank',     3},
        {'advanced-circuit', 10},
        {'pump',             4},
        {'concrete',         40},
        {'engine-unit',      2},
        {'nexelit-plate',    10}
    },
    results = {
        {'olefin-plant-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'olefin-plant-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'olefin-plant-mk02',    1},
        {'storage-tank',         3},
        {'processing-unit',      15},
        {'niobium-plate',        20},
        {'pump',                 4},
        {'electric-engine-unit', 4},
        {'kevlar',               20}
    },
    results = {
        {'olefin-plant-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'olefin-plant-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'olefin-plant-mk03',     1},
        {'storage-tank',          3},
        {'pump',                  4},
        {'nbfe-alloy',            20},
        {'low-density-structure', 10},
    },
    results = {
        {'olefin-plant-mk04', 1}
    }
}
