local pipes = {
    south = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/pipe-ending-down.png',
        priority = 'extra-high',
        width = 40,
        height = 32
    }
}

local pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.05, -0.75}, nil, nil, pipes)
local pipe_covers = py.pipe_covers(true, true, true, true)

RECIPE {
    type = 'recipe',
    name = 'methanol-reactor',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'gasturbinemk01',     1},
        {'boiler',             2},
        {'electronic-circuit', 25},
        {'steel-plate',        20},
        {'iron-gear-wheel',    15}
    },
    results = {
        {'methanol-reactor', 1}
    }
}:add_unlock('methanol-processing-1')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'methanol-reactor' or 'methanol-reactor-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'q',
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
        fast_replaceable_group = 'methanol-reactor',
        max_health = i * 300,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
        selection_box = {{-3, -3}, {3, 3}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'methanol'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = i .. 'MW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/methanol-anim.png',
                    frame_count = 50,
                    line_length = 10,
                    width = 202,
                    height = 247,
                    animation_speed = 0.4,
                    shift = {0.15, -0.79}
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/methanol-anim-mask.png',
                    frame_count = 50,
                    line_length = 10,
                    width = 202,
                    height = 247,
                    animation_speed = 0.4,
                    tint = py.tints[i],
                    shift = {0.15, -0.79},
                    draw_as_glow = true
                }
            }
        },
        fluid_boxes = {
            --North, left
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {-0.5, -3.5}}}
            },
            --North, right
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {0.5, -3.5}}}
            },
            --South, left
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {-0.5, 3.5}}}
            },
            --South, right
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {0.5, 3.5}}}
            },
            --West, top
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {-3.5, -0.5}}}
            },
            --West, bottom
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {-3.5, 0.5}}}
            },
            --East, top
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {3.5, -0.5}}}
            },
            --East, bottom
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {3.5, 0.5}}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/methanol-reactor.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/methanol-reactor.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'methanol-reactor-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'methanol-reactor', 1},
        {'advanced-circuit', 25},
        {'plastic-bar',      50},
        {'nexelit-plate',    15},
        {'engine-unit',      8},
    },
    results = {
        {'methanol-reactor-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'methanol-reactor-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'methanol-reactor-mk02', 1},
        {'processing-unit',       20},
        {'niobium-plate',         30},
        {'electric-engine-unit',  6},
    },
    results = {
        {'methanol-reactor-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'methanol-reactor-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'methanol-reactor-mk03', 1},
        {'kevlar',                30},
        {'nbfe-alloy',            15},
        {'low-density-structure', 10},
    },
    results = {
        {'methanol-reactor-mk04', 1}
    }
}
