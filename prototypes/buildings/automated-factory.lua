local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/top-conection.png",
        priority = "extra-high",
        width = 244,
        height = 280
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-plate",      amount = 20},
        {type = "item", name = "steam-engine",     amount = 1},
        {type = "item", name = "iron-gear-wheel",  amount = 20},
        {type = "item", name = "fast-inserter",    amount = 3},
        {type = "item", name = "advanced-circuit", amount = 5}
    },
    results = {
        {type = "item", name = "automated-factory-mk01", amount = 1}
    }
}:add_unlock("advanced-circuit")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "automated-factory-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "c",
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
        fast_replaceable_group = "automated-factory",
        max_health = 800 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"crafting", "crafting-with-fluid", "advanced-crafting"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (i * 2) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/left.png",
                        width = 128,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {-1.5, -0.68},
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/right.png",
                        width = 116,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {2.31, -0.68},
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/left-mask.png",
                        width = 128,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {-1.5, -0.68},
                        animation_speed = 0.5,
                        tint = py.tints[i],
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/right-mask.png",
                        width = 116,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {2.31, -0.68},
                        animation_speed = 0.5,
                        tint = py.tints[i],
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --1
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, 3.0}, direction = defines.direction.south}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, -3.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {2.0, 3.0}, direction = defines.direction.south}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 1.0},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 0.3},
            apparent_volume = 2.5
        }
    }
end

RECIPE {
    type = "recipe",
    name = "automated-factory-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"automated-factory-mk01", 1},
        {"assembling-machine-1",   2},
        {"plastic-bar",            20},
        {"fast-inserter",          4},
        {"engine-unit",            4},
        {"advanced-circuit",       15}
    },
    results = {
        {"automated-factory-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"automated-factory-mk02", 1},
        {"bulk-inserter",          4},
        {"electric-engine-unit",   4},
        {"niobium-plate",          25},
        {"processing-unit",        10}
    },
    results = {
        {"automated-factory-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"automated-factory-mk03", 1},
        {"low-density-structure",  10},
        {"nbfe-alloy",             10},

    },
    results = {
        {"automated-factory-mk04", 1}
    }
}
