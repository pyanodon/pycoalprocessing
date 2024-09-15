RECIPE {
    type = 'recipe',
    name = 'fluid-separator',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'storage-tank',        4},
        {'chemical-plant-mk01', 2},
        {'electronic-circuit',  15},
        {'pipe',                40},
        {'iron-gear-wheel',     15}
    },
    results = {
        {'fluid-separator', 1}
    }
}:add_unlock('fluid-separation')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'fluid-separator' or 'fluid-separator-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'm',
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
        fast_replaceable_group = 'fluid-separator',
        max_health = 400 * i,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'fluid-separator'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (900 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/fluid-separator/' .. name .. '.png',
                    width = 248,
                    height = 260,
                    frame_count = 1,
                    shift = {0.34, -0.57}
                },
            }
        },
        fluid_boxes = {
            --North
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_level = 1,
                pipe_connections = {{flow_direction = 'output', position = {2.0, -3.25}, direction = defines.direction.north}}
            },
            --North2
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_level = 1,
                pipe_connections = {{flow_direction = 'output', position = {0.0, -3.25}, direction = defines.direction.north}}
            },
            --North3
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_level = 1,
                pipe_connections = {{flow_direction = 'output', position = {-2.0, -3.25}, direction = defines.direction.north}}
            },
            --South3
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {0.0, 3.25}, direction = defines.direction.south}}
            },
            --South
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {2.0, 3.25}, direction = defines.direction.south}}
            },
            --South2
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {-2.0, 3.25}, direction = defines.direction.south}}
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/fluid-separator.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/fluid-separator.ogg', volume = 0.3},
            apparent_volume = 1.2
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'fluid-separator-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fluid-separator',  1},
        {'storage-tank',     1},
        {'nexelit-plate',    10},
        {'concrete',         40},
        {'plastic-bar',      10},
        {'advanced-circuit', 10}
    },
    results = {
        {'fluid-separator-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'fluid-separator-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fluid-separator-mk02', 1},
        {'storage-tank',         1},
        {'processing-unit',      5},
        {'niobium-plate',        15},
        {'electric-engine-unit', 5},
        {'kevlar',               30}
    },
    results = {
        {'fluid-separator-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'fluid-separator-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fluid-separator-mk03',  1},
        {'storage-tank',          1},
        {'low-density-structure', 10},
        {'nbfe-alloy',            5},
        {'niobium-pipe',          15},
    },
    results = {
        {'fluid-separator-mk04', 1}
    }
}
