local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/pipe-north.png",
        priority = "low",
        width = 30,
        height = 44
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/north.png",
        priority = "low",
        width = 241,
        height = 241
    }
}

RECIPE {
    type = "recipe",
    name = "washer",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {type = "item", name = "iron-plate",         amount = 10},
        {type = "item", name = "steam-engine",       amount = 1},
        {type = "item", name = "pipe",               amount = 25},
        {type = "item", name = "stone-brick",        amount = 30},
        {type = "item", name = "electronic-circuit", amount = 2}
    },
    results = {
        {type = "item", name = "washer", amount = 1}
    }
} --:add_unlock("energy-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "washer" or "washer-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "z2",
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
        fast_replaceable_group = "washer",
        max_health = 250 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        forced_symmetry = "diagonal-pos",
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {"consumption", "speed", "pollution", "productivity"},
        crafting_categories = {"washer"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (400 * i) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/washer.png",
                        width = 204,
                        height = 204,
                        frame_count = 80,
                        line_length = 10,
                        animation_speed = 0.9,
                        shift = {0.17, -0.17}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/washer/washer-mask.png",
                        width = 204,
                        height = 204,
                        frame_count = 80,
                        line_length = 10,
                        animation_speed = 0.9,
                        shift = {0.17, -0.17},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", {1.17, 2.78}, {-0.05, -0.8}, nil, nil, pipes2),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.5, 2.5}, direction = defines.direction.south}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {-0.05, -0.8}, nil, nil, pipes),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {0.5, -2.5}, direction = defines.direction.north}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 1.8},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/washer.ogg", volume = 0.3},
            apparent_volume = 1.8
        },
    }
end

RECIPE {
    type = "recipe",
    name = "washer-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"washer",           1},
        {"engine-unit",      2},
        {"advanced-circuit", 5},
        {"nexelit-plate",    30}
    },
    results = {
        {"washer-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "washer-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"washer-mk02",          1},
        {"processing-unit",      20},
        {"niobium-plate",        30},
        {"electric-engine-unit", 6},
    },
    results = {
        {"washer-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "washer-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"washer-mk03",           1},
        {"low-density-structure", 15},
        {"nbfe-alloy",            5},
    },
    results = {
        {"washer-mk04", 1}
    }
}
