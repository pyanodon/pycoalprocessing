local pipes = {
    south = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/pipe-ending-down.png',
        priority = 'extra-high',
        width = 40,
        height = 32
    },
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/carbon-filter/top.png',
        priority = 'low',
        width = 44,
        height = 25
    }
}

local pipe_picture = py.pipe_pictures('assembling-machine-3', nil, {-0.05, -0.75}, nil, nil, pipes)
local pipe_covers = py.pipe_covers(true, true, true, true)

RECIPE {
    type = 'recipe',
    name = 'evaporator',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'steam-engine',       1},
        {'quenching-tower',    1},
        {'electronic-circuit', 10},
        {'steel-plate',        40},
        {'iron-plate',         40},
        {'iron-gear-wheel',    15}
    },
    results = {
        {'evaporator', 1}
    }
}:add_unlock('fluid-processing-machines-1')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'evaporator' or 'evaporator-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'l',
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
        fast_replaceable_group = 'evaporator',
        max_health = 300 * i,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'evaporator'},
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
                    filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-off.png',
                    width = 168,
                    height = 177,
                    frame_count = 1,
                    shift = {0.1, 0.0},
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-off-mask.png',
                    width = 168,
                    height = 177,
                    frame_count = 1,
                    shift = {0.1, 0.0},
                    tint = py.tints[i],
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-off-glow.png',
                    width = 168,
                    height = 177,
                    frame_count = 1,
                    shift = {0.1, 0.0},
                    draw_as_glow = true,
                },
            }
        },
        working_visualisations = {
            {
                fadeout = true,
                constant_speed = true,
                north_position = {0.1, -0.0},
                west_position = {0.1, -0.0},
                south_position = {0.1, -0.0},
                east_position = {0.1, -0.0},
                animation = {
                    layers = {
                        {
                            filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-anim.png',
                            frame_count = 80,
                            line_length = 10,
                            width = 168,
                            height = 177,
                            animation_speed = 0.25,
                        },
                        {
                            filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-anim-mask.png',
                            frame_count = 80,
                            line_length = 10,
                            width = 168,
                            height = 177,
                            animation_speed = 0.25,
                            tint = py.tints[i],
                        },
                        {
                            filename = '__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-anim-glow.png',
                            frame_count = 80,
                            line_length = 10,
                            width = 168,
                            height = 177,
                            animation_speed = 0.25,
                            draw_as_glow = true,
                        },
                    }
                }
            }
        },
        fluid_boxes = {
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {3.0, 0.0}}}
            },
            {
                production_type = 'input',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_area = 10,
                base_level = -1,
                pipe_connections = {{type = 'input', position = {0.0, 3.0}}}
            },
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {-3.0, 0.0}}}
            },
            {
                production_type = 'output',
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                base_level = 1,
                pipe_connections = {{type = 'output', position = {0.0, -3.0}}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/evaporator.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/evaporator.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'evaporator-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'evaporator',       1},
        {'engine-unit',      2},
        {'nexelit-plate',    10},
        {'advanced-circuit', 10},
    },
    results = {
        {'evaporator-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'evaporator-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'evaporator-mk02',      1},
        {'electric-engine-unit', 2},
        {'kevlar',               5},
        {'processing-unit',      10},
        {'niobium-plate',        12},
    },
    results = {
        {'evaporator-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'evaporator-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'evaporator-mk03',       1},
        {'low-density-structure', 10},
        {'nbfe-alloy',            5},
    },
    results = {
        {'evaporator-mk04', 1}
    }
}
