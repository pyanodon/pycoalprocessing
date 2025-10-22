RECIPE {
    type = "recipe",
    name = "olefin-plant",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "storage-tank",        amount = 4},
        {type = "item", name = "chemical-plant-mk01", amount = 2},
        {type = "item", name = "advanced-circuit",    amount = 5},
        {type = "item", name = "steel-plate",         amount = 40},
        {type = "item", name = "iron-gear-wheel",     amount = 15}
    },
    results = {
        {type = "item", name = "olefin-plant", amount = 1}
    }
}:add_unlock("lubricant")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "olefin-plant" or "olefin-plant-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "r",
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
        fast_replaceable_group = "olefin-plant",
        max_health = i * 400,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.75, -3.75}, {3.75, 3.75}},
        selection_box = {{-4, -4}, {4, 4}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"olefin"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (2 * i) .. "MW",
        graphics_set = {
            working_visualisations = {
                {
                    fadeout = true,
                    constant_speed = true,
                    north_position = util.by_pixel(0, -104.5),
                    west_position = util.by_pixel(0, -104.5),
                    south_position = util.by_pixel(0, -104.5),
                    east_position = util.by_pixel(0, -104.5),
                    animation = {
                        layers = {
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim.png",
                                frame_count = 84,
                                line_length = 8,
                                width = 256,
                                height = 139,
                                animation_speed = 0.4,
                            },
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/anim-mask.png",
                                frame_count = 84,
                                line_length = 8,
                                width = 256,
                                height = 139,
                                animation_speed = 0.4,
                                tint = py.tints[i],
                            }
                        }
                    }
                }
            },
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off.png",
                        width = 274,
                        height = 302,
                        frame_count = 1,
                        shift = util.by_pixel(9, -23),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/olefin-plant/olefin-off-mask.png",
                        width = 274,
                        height = 302,
                        frame_count = 1,
                        shift = util.by_pixel(9, -23),
                        tint = py.tints[i],
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --North
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {1.5, -3.5}, direction = defines.direction.north}}
            },
            --North2
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.0, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "output", position = {-1.5, -3.5}, direction = defines.direction.north}}
            },
            --South
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {-1.5, 3.5}, direction = defines.direction.south}}
            },
            --South2
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {1.5, 3.5}, direction = defines.direction.south}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/olefin-plant.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "olefin-plant-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "olefin-plant",     amount = 1},
        {type = "item", name = "storage-tank",     amount = 3},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "pump",             amount = 4},
        {type = "item", name = "concrete",         amount = 40},
        {type = "item", name = "engine-unit",      amount = 2},
        {type = "item", name = "nexelit-plate",    amount = 10}
    },
    results = {
        {type = "item", name = "olefin-plant-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "olefin-plant-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "olefin-plant-mk02",    amount = 1},
        {type = "item", name = "storage-tank",         amount = 3},
        {type = "item", name = "processing-unit",      amount = 15},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "pump",                 amount = 4},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "kevlar",               amount = 20}
    },
    results = {
        {type = "item", name = "olefin-plant-mk03", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "olefin-plant-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "olefin-plant-mk03",     amount = 1},
        {type = "item", name = "storage-tank",          amount = 3},
        {type = "item", name = "pump",                  amount = 4},
        {type = "item", name = "nbfe-alloy",            amount = 20},
        {type = "item", name = "low-density-structure", amount = 10},
    },
    results = {
        {type = "item", name = "olefin-plant-mk04", amount = 1}
    }
}
