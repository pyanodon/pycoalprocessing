RECIPE {
    type = 'recipe',
    name = 'sand-extractor',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'iron-plate',         40},
        {'niobium-plate',      20},
        {'steam-engine',       1},
        {'chromium',           10},
        {'iron-gear-wheel',    20},
        {'electronic-circuit', 12}
    },
    results = {
        {'sand-extractor', 1}
    }
}:add_unlock('excavation-1')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'sand-extractor' or 'sand-extractor-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    ITEM {
        type = 'item',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = 'py-cp-buildings-mk0' .. i,
        order = 'e',
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
        fast_replaceable_group = 'sand-extractor',
        max_health = 100 * i,
        corpse = 'big-remnants',
        dying_explosion = 'big-explosion',
        collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {'consumption', 'productivity', 'pollution', 'speed'},
        crafting_categories = {'sand-extractor'},
        crafting_speed = i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = 0.06 * i,
        },
        energy_usage = i .. 'MW',
        animation = {
            layers = {
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/sand-extractor/sand-extractor.png',
                    width = 192,
                    height = 202,
                    frame_count = 90,
                    line_length = 10,
                    animation_speed = 0.35,
                    shift = {0.0, -0.312}
                },
                {
                    filename = '__pycoalprocessinggraphics__/graphics/entity/sand-extractor/sand-extractor-mask.png',
                    width = 192,
                    height = 202,
                    frame_count = 90,
                    line_length = 10,
                    animation_speed = 0.35,
                    shift = {0.0, -0.312},
                    tint = py.tints[i]
                }
            }
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/sand-extractor.ogg', volume = 0.9},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/sand-extractor.ogg', volume = 0.3},
            apparent_volume = 0.45
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'sand-extractor-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'sand-extractor',   1},
        {'steam-engine',     1},
        {'plastic-bar',      10},
        {'engine-unit',      5},
        {'nexelit-plate',    15},
        {'advanced-circuit', 5},
    },
    results = {
        {'sand-extractor-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'sand-extractor-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'sand-extractor-mk02',  1},
        {'processing-unit',      5},
        {'niobium-plate',        20},
        {'niobium-pipe',         10},
        {'electric-engine-unit', 1},
        {'kevlar',               10}
    },
    results = {
        {'sand-extractor-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'sand-extractor-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'sand-extractor-mk03',   1},
        {'low-density-structure', 20},
        {'nbfe-alloy',            10},
    },
    results = {
        {'sand-extractor-mk04', 1}
    }
}
