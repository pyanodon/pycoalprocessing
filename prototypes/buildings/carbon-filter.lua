local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/carbon-filter/top.png",
        priority = "low",
        width = 44,
        height = 25
    }
}

RECIPE {
    type = "recipe",
    name = "carbon-filter",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "assembling-machine-2", amount = 1},
        {type = "item", name = "pipe",                 amount = 2},
        {type = "item", name = "steam-engine",         amount = 3},
        {type = "item", name = "iron-plate",           amount = 20},
        {type = "item", name = "iron-gear-wheel",      amount = 30}
    },
    results = {
        {type = "item", name = "carbon-filter", amount = 1}
    }
}:add_unlock("filtration")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "carbon-filter" or "carbon-filter-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "e",
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = "carbon-filter",
        max_health = 150 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.25, -2.25}, {2.25, 2.25}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        forced_symmetry = "diagonal-pos",
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {"consumption", "speed", "pollution", "productivity"},
        crafting_categories = {"carbonfilter"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (500 * i) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/carbon-filter/carbon-filter.png",
                        priority = "high",
                        width = 171,
                        height = 167,
                        frame_count = 25,
                        line_length = 5,
                        shift = {0.1, -0.125},
                        animation_speed = 1.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/carbon-filter/carbon-filter-mask.png",
                        priority = "high",
                        width = 171,
                        height = 167,
                        frame_count = 25,
                        line_length = 5,
                        shift = {0.1, -0.125},
                        animation_speed = 1.5,
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", {0, 0.36}, {0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {2.0, 0.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", {0, 0.36}, {0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, 2.0}, direction = defines.direction.south}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-2", {0, 0.36}, {0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-2.0, 0.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-2", {0, 0.36}, {0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {0.0, -2.0}, direction = defines.direction.north}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/carbon-filter.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/carbon-filter.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "carbon-filter-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"carbon-filter",    1},
        {"engine-unit",      2},
        {"plastic-bar",      10},
        {"nexelit-plate",    15},
        {"advanced-circuit", 5},
    },
    results = {
        {"carbon-filter-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "carbon-filter-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"carbon-filter-mk02",   1},
        {"processing-unit",      5},
        {"niobium-plate",        20},
        {"niobium-pipe",         10},
        {"electric-engine-unit", 1},
        {"kevlar",               10}
    },
    results = {
        {"carbon-filter-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "carbon-filter-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"carbon-filter-mk03",    1},
        {"low-density-structure", 15},
        {"nbfe-alloy",            5},
    },
    results = {
        {"carbon-filter-mk04", 1}
    }
}
