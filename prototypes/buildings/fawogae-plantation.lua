local pipes = {
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/pipe-north.png',
        priority = 'low',
        width = 32,
        height = 32
    },
    south = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/pipe-south.png',
        priority = 'extra-high',
        width = 32,
        height = 32
    }
}

RECIPE {
    type = 'recipe',
    name = 'fawogae-plantation-mk01',
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {'soil',               100},
        {'pipe',               10},
        {'electronic-circuit', 10},
        {'steam-engine',       1},
        {'copper-cable',       25},
        {'iron-plate',         20},
        {'wood',               100}
    },
    results = {
        {'fawogae-plantation-mk01', 1}
    }
}

local fluid_boxes
if mods.pyalienlife then
    fluid_boxes = {
        {
            production_type = 'input',
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures('assembling-machine-3', {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = 'input', position = {-3.5, 0.5}}}
        },
        {
            production_type = 'input',
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures('assembling-machine-3', {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = 'input', position = {3.5, -0.5}}}
        },
        off_when_no_fluid_recipe = true
    }
else
    fluid_boxes = {
        {
            production_type = 'input',
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures('assembling-machine-3', {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = 'input', position = {-3.5, 0.5}}}
        },
        off_when_no_fluid_recipe = true
    }
end

for i = 1, 4 do
    if not mods.pyalienlife and i == 2 then return end

    local name = 'fawogae-plantation-mk0' .. i
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
        fast_replaceable_group = 'fawogae-plantation',
        max_health = 300 * i,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'fawogae'},
        crafting_speed = 0.3 * i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = -5 * i,
        },
        energy_usage = (200 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/fawogae.png',
                    width = 200,
                    height = 193,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.4,
                    shift = {0.13, -0.03}
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/fawogae-plantation/fawogae-mask.png',
                    width = 200,
                    height = 193,
                    frame_count = 100,
                    line_length = 10,
                    animation_speed = 0.4,
                    shift = {0.13, -0.03},
                    tint = py.tints[i]
                },
            }
        },
        fluid_boxes = fluid_boxes,
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/fawogae-plantation.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/fawogae-plantation.ogg', volume = 0.3},
            apparent_volume = 1.2
        }
    }
end

RECIPE {
    type = 'recipe',
    name = 'fawogae-plantation-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fawogae-plantation-mk01', 1},
        {'plastic-bar',             20},
        {'advanced-circuit',        15},
        {'engine-unit',             1},
        {'treated-wood',            30},
        {'steel-plate',             10},
    },
    results = {
        {'fawogae-plantation-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'fawogae-plantation-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fawogae-plantation-mk02', 1},
        {'niobium-plate',           15},
        {'electric-engine-unit',    1},
        {'processing-unit',         10},
        {'treated-wood',            20}, --pyht fiberboard
        {'niobium-pipe',            20},
    },
    results = {
        {'fawogae-plantation-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'fawogae-plantation-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'fawogae-plantation-mk03', 1},
        {'low-density-structure',   20},
    },
    results = {
        {'fawogae-plantation-mk04', 1}
    }
}
