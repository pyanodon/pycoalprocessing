RECIPE {
    type = 'recipe',
    name = 'wpu',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'wood',                20},
        {'iron-plate',          20},
        {'steam-engine',        1},
        {'iron-gear-wheel',     15},
        {'burner-mining-drill', 2},
        {'copper-cable',        50}
    },
    results = {
        {'wpu', 1}
    }
}:add_unlock('wood-processing')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'wpu' or 'wpu-mk0' .. i
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
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = 'wpu',
        max_health = 800 * i,
        corpse = 'medium-remnants',
        dying_explosion = 'medium-explosion',
        collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity', 'pollution'},
        crafting_categories = {'wpu'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (500 * i) .. 'kW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/wpu/left.png',
                    width = 96,
                    height = 277,
                    line_length = 21,
                    frame_count = 130,
                    shift = {-1.5, -1.328},
                    animation_speed = 0.42
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/wpu/right.png',
                    width = 96,
                    height = 277,
                    line_length = 21,
                    frame_count = 130,
                    shift = {1.5, -1.328},
                    animation_speed = 0.42
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/wpu/left-mask.png',
                    width = 96,
                    height = 277,
                    line_length = 21,
                    frame_count = 130,
                    shift = {-1.5, -1.328},
                    animation_speed = 0.42,
                    tint = py.tints[i]
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/wpu/right-mask.png',
                    width = 96,
                    height = 277,
                    line_length = 21,
                    frame_count = 130,
                    shift = {1.5, -1.328},
                    animation_speed = 0.42,
                    tint = py.tints[i]
                },
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/wpu.ogg', volume = 1.0},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/wpu.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'wpu-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'wpu',              1},
        {'engine-unit',      2},
        {'advanced-circuit', 25},
        {'plastic-bar',      50},
        {'nexelit-plate',    15},
        {'fast-inserter',    4},
    },
    results = {
        {'wpu-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'wpu-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'wpu-mk02',             1},
        {'bulk-inserter',       4},
        {'electric-engine-unit', 4},
        {'niobium-plate',        25},
        {'processing-unit',      10}
    },
    results = {
        {'wpu-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'wpu-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'wpu-mk03',              1},
        {'low-density-structure', 10},
        {'nbfe-alloy',            10},
    },
    results = {
        {'wpu-mk04', 1}
    }
}
