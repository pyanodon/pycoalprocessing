local pipes = {
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/soil-extractor/long-pipe-north.png',
        priority = 'low',
        width = 30,
        height = 44
    },
    south = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/soil-extractor/pipe-south.png',
        priority = 'extra-high',
        width = 40,
        height = 45
    }
}

RECIPE {
    type = 'recipe',
    name = 'soil-extractor-mk01',
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {'burner-mining-drill', 2},
        {'electronic-circuit',  10},
        {'iron-plate',          30},
        {'copper-cable',        5},
        {'iron-gear-wheel',     15}
    },
    results = {
        {'soil-extractor-mk01', 1}
    }
}

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = 'soil-extractor-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64
    
    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'g',
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
        fast_replaceable_group = 'soil-extractor',
        max_health = i * 300,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'soil-extraction'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (400 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/soil-extractor/soil-extractor.png',
                    width = 235,
                    height = 266,
                    frame_count = 30,
                    line_length = 6,
                    animation_speed = 0.8,
                    shift = {0.16, -0.609}
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/soil-extractor/soil-extractor-mask.png',
                    width = 235,
                    height = 266,
                    frame_count = 30,
                    line_length = 6,
                    animation_speed = 0.8,
                    shift = {0.16, -0.609},
                    tint = py.tints[i],
                }
            }
        },
        fluid_boxes = {
            {
                production_type = 'input',
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0, 1}, {0, -1}, nil, nil, pipes),
                volume = 1000,
                base_level = -1,
                height = 2,
                pipe_connections = {{flow_direction = 'input-output', position = {3.4, 0.0}, direction = defines.direction.east}, {flow_direction = 'input-output', position = {-3.4, 0.0}, direction = defines.direction.west}}
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact-1.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/soil-extractor.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/soil-extractor.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'soil-extractor-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'soil-extractor-mk01', 1},
        {'plastic-bar',        20},
        {'engine-unit',        2},
        {'pump',               4},
        {'advanced-circuit',   15},
        {'copper-cable',       50},
    },
    results = {
        {'soil-extractor-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'soil-extractor-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'soil-extractor-mk02',   1},
        {'processing-unit',      20},
        {'niobium-plate',        30},
        {'electric-engine-unit', 6},
    },
    results = {
        {'soil-extractor-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'soil-extractor-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'soil-extractor-mk03', 1},
        {'pump',               1},
        {'nbfe-alloy',         35},
    },
    results = {
        {'soil-extractor-mk04', 1}
    }
}
