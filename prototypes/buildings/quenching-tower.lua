local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/top-right.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/south-left.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}
local pipes2 = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/top-left.png",
        priority = "low",
        width = 232,
        height = 252
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/south-right.png",
        priority = "extra-high",
        width = 232,
        height = 252
    }
}

RECIPE {
    type = "recipe",
    name = "quenching-tower",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "concrete",           amount = 50},
        {type = "item", name = "iron-stick",         amount = 50},
        {type = "item", name = "steam-engine",       amount = 1},
        {type = "item", name = "pipe",               amount = 10},
        {type = "item", name = "pump",               amount = 2},
        {type = "item", name = "electronic-circuit", amount = 15}
    },
    results = {
        {type = "item", name = "quenching-tower", amount = 1}
    }
}:add_unlock("separation")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "quenching-tower" or "quenching-tower-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "u",
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.5, result = name},
        fast_replaceable_group = "quenching-tower",
        max_health = 500 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"quenching-tower"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/quenching-tower-anim.png",
                        width = 232,
                        height = 252,
                        frame_count = 60,
                        line_length = 8,
                        animation_speed = 0.7,
                        shift = {0.08, 0.0},
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/quenching-tower-anim-mask.png",
                        width = 232,
                        height = 252,
                        frame_count = 60,
                        line_length = 8,
                        animation_speed = 0.7,
                        shift = {0.08, 0.0},
                        tint = py.tints[i],
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {1.08, 4.0}, {-0.82, -4.0}, nil, nil, pipes2),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, -1.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, 1.0}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.0, -1.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {1.08, 4.0}, {-0.82, -4.0}, nil, nil, pipes2),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.0, 1.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.82, 4.0}, {1.12, -4.0}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-1.0, 3.0}, direction = defines.direction.south}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/quenching-tower.ogg", volume = 0.42},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/quenching-tower.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "quenching-tower-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"quenching-tower",  1},
        {"plastic-bar",      20},
        {"pump",             4},
        {"advanced-circuit", 15},
        {"engine-unit",      1},
    },
    results = {
        {"quenching-tower-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "quenching-tower-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"quenching-tower-mk02", 1},
        {"electric-engine-unit", 4},
        {"niobium-plate",        20},
        {"niobium-pipe",         20},
        {"processing-unit",      10}
    },
    results = {
        {"quenching-tower-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "quenching-tower-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"quenching-tower-mk03",  1},
        {"low-density-structure", 10},
        {"nbfe-alloy",            10},
        {"kevlar",                20},
    },
    results = {
        {"quenching-tower-mk04", 1}
    }
}
