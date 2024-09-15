RECIPE {
    type = 'recipe',
    name = 'advanced-foundry-mk01',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'copper-cable',  30},
        {'iron-plate',    30},
        {'stone-furnace', 10},
        {'stone-brick',   20},
    },
    results = {
        {'advanced-foundry-mk01', 1}
    }
}:add_unlock('steel-processing')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = 'advanced-foundry-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'b',
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
        fast_replaceable_group = 'advanced-foundry',
        max_health = 600 * i,
        corpse = 'medium-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'advanced-foundry', 'smelting'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (1.2 * i) .. 'MW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-base.png',
                    width = 224,
                    height = 224,
                    line_length = 9,
                    frame_count = 76,
                    shift = {0.3, -0.5},
                    animation_speed = 0.5
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-base-mask.png',
                    width = 224,
                    height = 224,
                    line_length = 9,
                    frame_count = 76,
                    shift = {0.3, -0.5},
                    animation_speed = 0.5,
                    tint = py.tints[i],
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-top.png',
                    width = 224,
                    height = 41,
                    line_length = 9,
                    frame_count = 76,
                    shift = {0.3, -4.63},
                    animation_speed = 0.5
                }
            }
        },
        fluid_boxes = {
            {
                production_type = 'input',
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0, -0.88}, nil, nil),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {2.9, -0.5}, direction = defines.direction.east}}
            },
            {
                production_type = 'input',
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0, -0.88}, nil, nil),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {0.5, 2.9}, direction = defines.direction.south}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0, -0.88}, nil, nil),
                base_level = 1,
                pipe_connections = {{flow_direction = 'output', position = {-2.9, -0.5}, direction = defines.direction.west}}
            },
            {
                production_type = 'output',
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {0, -0.88}, nil, nil),
                base_level = 1,
                pipe_connections = {{flow_direction = 'output', position = {-0.5, 2.9}, direction = defines.direction.south}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/advanced-foundry.ogg', volume = 0.45},
        }
    }
end

RECIPE {
    type = 'recipe',
    name = 'advanced-foundry-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'advanced-foundry-mk01', 1},
        {'nexelit-plate',         20},
        {'concrete',              60},
        {'engine-unit',           4},
        {'steel-plate',           40},
        {'plastic-bar',           10},
        {'advanced-circuit',      10}
    },
    results = {
        {'advanced-foundry-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'advanced-foundry-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'advanced-foundry-mk02', 1},
        {'concrete',              100},
        {'processing-unit',       15},
        {'niobium-plate',         10},
        {'electric-engine-unit',  4},
    },
    results = {
        {'advanced-foundry-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'advanced-foundry-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'advanced-foundry-mk03', 1},
        {'low-density-structure', 20},
        {'nbfe-alloy',            10},
    },
    results = {
        {'advanced-foundry-mk04', 1}
    }
}
