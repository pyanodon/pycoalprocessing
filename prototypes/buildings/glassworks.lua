RECIPE {
    type = 'recipe',
    name = 'glassworks-mk01',
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {type = "item", name = 'stone-brick', amount = 15},
        {type = "item", name = 'copper-plate', amount = 20},
        {type = "item", name = 'iron-gear-wheel', amount = 15},
        {type = "item", name = 'steam-engine', amount = 3},
        {type = "item", name = 'iron-plate', amount = 20},
        {type = "item", name = 'electronic-circuit', amount = 5}
    },
    results = {
        {type = "item", name = 'glassworks-mk01', amount = 1}
    }
} --:add_unlock("coal-processing-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = 'glassworks-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'a',
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
        fast_replaceable_group = 'glassworks',
        max_health = 100 * i,
        corpse = 'medium-remnants',
        dying_explosion = 'big-explosion',
        collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'pollution', 'productivity'},
        crafting_categories = {'glassworks'},
        crafting_speed = i,
        energy_source =
        {
            type = 'fluid',
            emissions_per_minute = {
                pollution = 10
            },
            destroy_non_fuel_fluid = false,
            fluid_box =
            {
                volume = 200,
                base_level = -1,
                pipe_connections =
                {
                    {flow_direction = 'input-output', position = {3.3, 0}, direction = defines.direction.east},
                    {flow_direction = 'input-output', position = {-3.3, 0}, direction = defines.direction.west}
                },
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures('assembling-machine-2', nil, {0.0, -0.96}, nil, nil),
                production_type = 'input',
            },
            effectivity = 1,
            burns_fluid = true,
            light_flicker =
            {
                minimum_intensity = 0,
                maximum_intensity = 0,
                light_intensity_to_size_coefficient = 0,
                color = {0, 0, 0},
            },
            scale_fluid_usage = true,
            fluid_usage_per_tick = 10,
            smoke =
            {
                {
                    name = 'smoke',
                    north_position = util.by_pixel(68, -64),
                    south_position = util.by_pixel(68, -64),
                    east_position = util.by_pixel(68, -64),
                    west_position = util.by_pixel(68, -64),
                    frequency = 8,
                    starting_vertical_speed = 0.04,
                    starting_frame_deviation = 50
                },
                {
                    name = 'smoke',
                    north_position = util.by_pixel(-12, -96),
                    south_position = util.by_pixel(-12, -96),
                    east_position = util.by_pixel(-12, -96),
                    west_position = util.by_pixel(-12, -96),
                    frequency = 8,
                    starting_vertical_speed = 0.04,
                    starting_frame_deviation = 50
                },
            }
        },
        energy_usage = (10 * i) .. 'MW',
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = '__pycoalprocessinggraphics__/graphics/entity/glassworks/bot.png',
                        width = 256,
                        height = 32,
                        frame_count = 1,
                        shift = util.by_pixel(16, 96)
                    },
                    {
                        filename = '__pycoalprocessinggraphics__/graphics/entity/glassworks/top.png',
                        width = 256,
                        height = 224,
                        frame_count = 1,
                        shift = util.by_pixel(16, -32)
                    },
                    {
                        filename = '__pycoalprocessinggraphics__/graphics/entity/glassworks/top-mask.png',
                        width = 256,
                        height = 224,
                        frame_count = 1,
                        shift = util.by_pixel(16, -32),
                        tint = py.tints[i]
                    },
                }
            },
        },
        working_visualisations = {
            {
                fadeout = true,
                constant_speed = true,
                north_position = util.by_pixel(-16, -32),
                west_position = util.by_pixel(-16, -32),
                south_position = util.by_pixel(-16, -32),
                east_position = util.by_pixel(-16, -32),
                animation = {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/glassworks/a1.png',
                    frame_count = 100,
                    line_length = 13,
                    width = 128,
                    height = 224,
                    animation_speed = 0.3
                }
            },
            {
                fadeout = true,
                constant_speed = true,
                north_position = util.by_pixel(96, -32),
                west_position = util.by_pixel(96, -32),
                south_position = util.by_pixel(96, -32),
                east_position = util.by_pixel(96, -32),
                animation = {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/glassworks/a2.png',
                    frame_count = 100,
                    line_length = 13,
                    width = 96,
                    height = 224,
                    animation_speed = 0.3
                }
            },
        },
        fluid_boxes = {
            --1
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-2', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {1.0, -3.3}, direction = defines.direction.north}}
            },
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-2', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {-1.0, -3.3}, direction = defines.direction.north}}
            },
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-2', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {2.0, 3.3}, direction = defines.direction.south}}
            },
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-2', nil, {0.0, -0.96}, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = 'output', position = {-2.0, 3.3}, direction = defines.direction.south}}
            },
            off_when_no_fluid_recipe = true
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact-1.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/glassworks.ogg', volume = 0.7},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/glassworks.ogg', volume = 0.3},
            apparent_volume = 2.5
        }
    }
end

RECIPE {
    type = 'recipe',
    name = 'glassworks-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'glassworks-mk01',  1},
        {'steel-plate',      35},
        {'engine-unit',      5},
        {'advanced-circuit', 10}
    },
    results = {
        {'glassworks-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'glassworks-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'glassworks-mk02',      1},
        {'electric-engine-unit', 15},
        {'kevlar',               15},
        {'processing-unit',      10},
        {'niobium-plate',        20},
    },
    results = {
        {'glassworks-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'glassworks-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'glassworks-mk03',       1},
        {'concrete',              40},
        {'nbfe-alloy',            15},
        {'low-density-structure', 10},
    },
    results = {
        {'glassworks-mk04', 1}
    }
}
