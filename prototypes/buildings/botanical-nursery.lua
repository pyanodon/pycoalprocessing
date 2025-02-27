local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/top.png",
        priority = "low",
        width = 260,
        height = 254
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/bottom.png",
        priority = "extra-high",
        width = 260,
        height = 254
    },
    west = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/left.png",
        priority = "very-low",
        width = 260,
        height = 254
    },
    east = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/right.png",
        priority = "extra-high",
        width = 260,
        height = 254
    }
}

RECIPE {
    type = "recipe",
    name = "botanical-nursery",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "electric-mining-drill", amount = 1},
        {type = "item", name = "soil-extractor-mk01",   amount = 1},
        {type = "item", name = "electronic-circuit",    amount = 5},
        {type = "item", name = "wood",                  amount = 50},
        {type = "item", name = "iron-plate",            amount = 35}
    },
    results = {
        {type = "item", name = "botanical-nursery", amount = 1}
    }
}:add_unlock("wood-processing")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "botanical-nursery" or "botanical-nursery-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "f",
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
        fast_replaceable_group = "botanical-nursery",
        max_health = 700 * i,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = 0,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"nursery"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = -5
            },
        },
        energy_usage = (125 * i) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/botanical-nursery.png",
                        width = 260,
                        height = 254,
                        line_length = 7,
                        frame_count = 35,
                        animation_speed = 0.4,
                        run_mode = "forward-then-backward",
                        shift = {0.1, 0.1}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/botanical-nursery/botanical-nursery-mask.png",
                        width = 260,
                        height = 254,
                        line_length = 7,
                        frame_count = 35,
                        animation_speed = 0.4,
                        run_mode = "forward-then-backward",
                        shift = {0.1, 0.1},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --1
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input-output", position = {0.0, 3.0}, direction = defines.direction.south}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input-output", position = {0.0, -3.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.2, 4.13}, {0.12, -4.03}, {4.115, 0.1}, {-3.88, 0.16}, pipes),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {3.0, 0.0}, direction = defines.direction.east}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/botanical-nursery.ogg", volume = 1.8},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/botanical-nursery.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "botanical-nursery-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"botanical-nursery", 1},
        {"engine-unit",       2},
        {"advanced-circuit",  5},
        {"nexelit-plate",     30}
    },
    results = {
        {"botanical-nursery-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "botanical-nursery-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"botanical-nursery-mk02", 1},
        {"electric-engine-unit",   2},
        {"processing-unit",        10},
        {"niobium-plate",          40},
        {"kevlar",                 15}
    },
    results = {
        {"botanical-nursery-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "botanical-nursery-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"botanical-nursery-mk03", 1},
        {"low-density-structure",  10},
        {"nbfe-alloy",             20},
    },
    results = {
        {"botanical-nursery-mk04", 1}
    }
}
