RECIPE {
    type = 'recipe',
    name = 'ground-borer',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'electric-mining-drill', 3},
        {'soil-extractor-mk01',   2},
        {'electronic-circuit',    30},
        {'iron-plate',            150},
        {'iron-gear-wheel',       15}
    },
    results = {
        {'ground-borer', 1}
    }
}:add_unlock('excavation-1')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'ground-borer' or 'ground-borer-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64
    
    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'c',
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
        fast_replaceable_group = 'ground-borer',
        max_health = 700,
        corpse = 'big-remnants',
        dying_explosion = 'big-explosion',
        collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        match_animation_speed_to_activity = false,
        module_slots = 0,
        allowed_effects = {'consumption', 'speed'},
        crafting_categories = {'ground-borer'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (1.25 * i) .. 'MW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer.png',
                    width = 307,
                    height = 311,
                    line_length = 6,
                    frame_count = 30,
                    animation_speed = 0.8,
                    shift = {0.2, -0.03}
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer-mask.png',
                    width = 307,
                    height = 311,
                    line_length = 6,
                    frame_count = 30,
                    animation_speed = 0.8,
                    shift = {0.2, -0.03},
                    tint = py.tints[i]
                },
            },
        },
        fluid_boxes = {
            --1
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.70}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {0.0, 5.0}}}
            },
            --2
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.00, -0.70}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {0.0, -5.0}}}
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/ground-borer.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/ground-borer.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'ground-borer-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'ground-borer',     1},
        {'nexelit-plate',    10},
        {'concrete',         40},
        {'plastic-bar',      10},
        {'engine-unit',      4},
        {'advanced-circuit', 10}
    },
    results = {
        {'ground-borer-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'ground-borer-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'ground-borer-mk02',    1},
        {'niobium-plate',        20},
        {'electric-engine-unit', 4},
        {'processing-unit',      10},
        {'kevlar',               15},
    },
    results = {
        {'ground-borer-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'ground-borer-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'ground-borer-mk03',     1},
        {'concrete',              40},
        {'nbfe-alloy',            30},
        {'low-density-structure', 15},
    },
    results = {
        {'ground-borer-mk04', 1}
    }
}
