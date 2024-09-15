RECIPE {
    type = 'recipe',
    name = 'borax-mine',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = 'electric-mining-drill', amount = 1},
        {type = "item", name = 'soil-extractor-mk01', amount = 1},
        {type = "item", name = 'electronic-circuit', amount = 20},
        {type = "item", name = 'iron-gear-wheel', amount = 15},
        {type = "item", name = 'transport-belt', amount = 20}
    },
    results = {
        {type = "item", name = 'borax-mine', amount = 1}
    }
}:add_unlock('energy-1')

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and 'borax-mine' or 'borax-mine-mk0' .. i
    local icon = '__pycoalprocessinggraphics__/graphics/icons/' .. name .. '.png'
    local icon_size = 64

    -- Base graphics
    local dry_graphics = {
        layers = {
            {
                filename = '__pycoalprocessinggraphics__/graphics/entity/borax-mine/bottom-borax-mk0' .. i .. '.png',
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.1,
                shift = {0.0, 2.25}
            },
            {
                filename = '__pycoalprocessinggraphics__/graphics/entity/borax-mine/top-borax-mk0' .. i .. '.png',
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.1,
                shift = {0.0, -2.25}
            }
        }
    }

    -- Start w/ empty table
    local wet_graphics = {}
    -- Insert, and follow by adding in the appropriate pipe graphics
    for abbreviation, direction in pairs {N = 'north', E = 'east', S = 'south', W = 'west'} do
        wet_graphics[direction] = util.copy(dry_graphics)
        wet_graphics[direction].layers[3] = {
            priority = 'extra-high',
            filename = '__pycoalprocessinggraphics__/graphics/entity/borax-mine/' .. abbreviation .. '.png',
            line_length = 1,
            width = 288,
            height = 288,
            frame_count = 1,
            repeat_count = 90,
            direction_count = 1,
            shift = util.by_pixel(0, 0.0)
        }
    end

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
        type = 'mining-drill',
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {'placeable-neutral', 'player-creation'},
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = 'borax-mine',
        max_health = 700 * i,
        resource_categories = {'borax'},
        corpse = 'big-remnants',
        dying_explosion = 'big-explosion',
        collision_box = {{-4.1, -4.1}, {4.1, 4.1}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        input_fluid_box = {
            production_type = 'input-output',
            pipe_picture = _G.assembler2pipepictures(),
            pipe_covers = _G.pipecoverspictures(),
            volume = 200,
            pipe_connections = {
                {direction = defines.direction.west, position = {-4.1, 0}},
                {direction = defines.direction.east, position = {4.1, 0}},
                {direction = defines.direction.south, position = {0, 4.1}}
            }
        },
        module_slots = i,
        allowed_effects = {'consumption', 'speed', 'productivity'},
        mining_speed = 2 * i,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (420 * i) .. 'kW',
        resource_searching_radius = 4.49 + i,
        vector_to_place_result = {0, -4.65},
        radius_visualisation_picture = {
            filename = '__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png',
            width = 12,
            height = 12
        },
        --circuit_wire_connection_points = circuit_connector_definitions['borax-mine-mkxx'].points,
        --circuit_connector_sprites = circuit_connector_definitions['borax-mine-mkxx'].sprites,
        --circuit_wire_max_distance = default_circuit_wire_max_distance,
        graphics_set = {
            animation = dry_graphics
        },
        wet_mining_graphics_set = {
            animation = wet_graphics
        },
        vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact-1.ogg', volume = 0.65},
        working_sound = {
            sound = {filename = '__pycoalprocessinggraphics__/sounds/borax-mine.ogg'},
            idle_sound = {filename = '__pycoalprocessinggraphics__/sounds/borax-mine.ogg', volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = 'recipe',
    name = 'borax-mine-mk02',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'borax-mine',          1},
        {'advanced-circuit',    25},
        {'plastic-bar',         50},
        {'nexelit-plate',       15},
        {'engine-unit',         3},
        {'fast-transport-belt', 30}
    },
    results = {
        {'borax-mine-mk02', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'borax-mine-mk03',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'borax-mine-mk02',        1},
        {'processing-unit',        20},
        {'niobium-plate',          30},
        {'electric-engine-unit',   6},
        {'express-transport-belt', 15}
    },
    results = {
        {'borax-mine-mk03', 1}
    }
}

RECIPE {
    type = 'recipe',
    name = 'borax-mine-mk04',
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {'borax-mine-mk03',       1},
        {'kevlar',                30},
        {'nbfe-alloy',            15},
        {'low-density-structure', 10},
    },
    results = {
        {'borax-mine-mk04', 1}
    }
}
