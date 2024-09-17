local pipe_left = {
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north1.png',
        priority = 'low',
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = '__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north2.png',
        priority = 'low',
        width = 64,
        height = 64
    }
}

RECIPE {
    type = 'recipe',
    name = 'desulfurizator-unit',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = 'storage-tank', amount = 3},
        {type = "item", name = 'chemical-plant-mk01', amount = 1},
        {type = "item", name = 'electronic-circuit', amount = 40},
        {type = "item", name = 'steel-plate', amount = 20},
        {type = "item", name = 'iron-plate', amount = 50}
    },
    results = {
        {type = "item", name = 'desulfurizator-unit', amount = 1}
    }
}:add_unlock('desulfurization')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'desulfurizator-unit' or 'desulfurizator-unit-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'j',
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
        fast_replaceable_group = 'desulfurizator-unit',
        max_health = i * 500,
        corpse = 'big-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'desulfurization'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (i * 2) .. 'MW',
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = '__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-anim.png',
                        width = 196,
                        height = 202,
                        frame_count = 15,
                        line_length = 5,
                        animation_speed = 0.75,
                        shift = {0.06, -0.1}
                    },
                    {
                        filename = '__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-anim-mask.png',
                        width = 196,
                        height = 202,
                        frame_count = 15,
                        line_length = 5,
                        animation_speed = 0.75,
                        shift = {0.06, -0.1},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes = {
            {
                production_type = 'output',
                pipe_picture = py.pipe_pictures('assembling-machine-3', {-0.05, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_right),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = 'output', position = {2.9, -1.5}, direction = defines.direction.east}}
            },
            {
                production_type = 'input',
                pipe_picture = py.pipe_pictures('assembling-machine-3', {0.25, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_left),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                base_level = -1,
                pipe_connections = {{flow_direction = 'input', position = {2.9, 1.5}, direction = defines.direction.east}}
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact-1.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__base__/sound/chemical-plant.ogg'},
            --idle_sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.3},
            apparent_volume = 0.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'desulfurizator-unit-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'desulfurizator-unit', 1},
        {'engine-unit',         2},
        {'advanced-circuit',    10},
        {'nexelit-plate',       10}
    },
    results = {
        {'desulfurizator-unit-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'desulfurizator-unit-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'desulfurizator-unit-mk02', 1},
        {'processing-unit',          5},
        {'niobium-plate',            10},
        {'electric-engine-unit',     4},
        {'kevlar',                   30}
    },
    results = {
        {'desulfurizator-unit-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'desulfurizator-unit-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'desulfurizator-unit-mk03', 1},
        {'pump',                     4},
        {'nbfe-alloy',               20},
        {'low-density-structure',    10},
    },
    results = {
        {'desulfurizator-unit-mk04', 1}
    }
}
