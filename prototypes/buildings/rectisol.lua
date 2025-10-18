local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/pipe-north.png",
        priority = "extra-high",
        width = 44,
        height = 25
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/pipe-ending-down.png",
        priority = "extra-high",
        width = 40,
        height = 32
    }
}

RECIPE {
    type = "recipe",
    name = "rectisol",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steam-engine", amount = 2},
        {type = "item", name = "storage-tank", amount = 2},
        {type = "item", name = "pipe",         amount = 20},
        {type = "item", name = "pump",         amount = 2},
        {type = "item", name = "iron-plate",   amount = 25},
        {type = "item", name = "steel-plate",  amount = 20}
    },
    results = {
        {type = "item", name = "rectisol", amount = 1}
    }
}:add_unlock("methanol-processing-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "rectisol" or "rectisol-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "v",
        place_result = name,
        stack_size = 10
    }

    ENTITY {
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = name},
        fast_replaceable_group = "rectisol",
        max_health = i * 150,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"rectisol"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = i .. "MW",
        graphics_set = {
            working_visualisations = {
                {
                    north_position = {-1.07, 1.132},
                    west_position = {-1.07, 1.132},
                    south_position = {-1.07, 1.132},
                    east_position = {-1.07, 1.132},
                    animation = {
                        layers = {
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-tanks-anim.png",
                                frame_count = 80,
                                line_length = 10,
                                width = 121,
                                height = 55,
                                animation_speed = 0.35
                            },
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-tanks-anim-mask.png",
                                frame_count = 80,
                                line_length = 10,
                                width = 121,
                                height = 55,
                                animation_speed = 0.35,
                                tint = py.tints[i]
                            }
                        }
                    }
                },
                {
                    north_position = {2.03, -1.28},
                    west_position = {2.03, -1.28},
                    south_position = {2.03, -1.28},
                    east_position = {2.03, -1.28},
                    animation = {
                        layers = {
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-lifter-anim.png",
                                frame_count = 80,
                                line_length = 40,
                                width = 47,
                                height = 77,
                                animation_speed = 0.45
                            },
                            {
                                filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rec-lifter-anim-mask.png",
                                frame_count = 80,
                                line_length = 40,
                                width = 47,
                                height = 77,
                                animation_speed = 0.45,
                                tint = py.tints[i]
                            }
                        }
                    }
                }
            },
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rectisol.png",
                        width = 250,
                        height = 239,
                        frame_count = 1,
                        shift = {0.38, -0.0}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/rectisol/rectisol-mask.png",
                        width = 250,
                        height = 239,
                        frame_count = 1,
                        shift = {0.38, -0.0},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, -2.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, 2.0}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.0, 0.0}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-1.0, -3.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.0, 1.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.0, -1.0}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.0, 0.65}, {-0.05, -0.53}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {1.0, -3.0}, direction = defines.direction.north}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/rectisol.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/rectisol.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "rectisol-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "rectisol",         amount = 1},
        {type = "item", name = "py-tank-3000",     amount = 2},
        {type = "item", name = "advanced-circuit", amount = 25},
        {type = "item", name = "plastic-bar",      amount = 50},
        {type = "item", name = "nexelit-plate",    amount = 15},
        {type = "item", name = "pump",             amount = 2},
        {type = "item", name = "engine-unit",      amount = 1},
        {type = "item", name = "duralumin",        amount = 20},
    },
    results = {
        {type = "item", name = "rectisol-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "rectisol-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "rectisol-mk02",        amount = 1},
        {type = "item", name = "py-tank-6500",         amount = 2},
        {type = "item", name = "processing-unit",      amount = 20},
        {type = "item", name = "niobium-plate",        amount = 30},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "pump",                 amount = 2},
        {type = "item", name = "titanium-plate",       amount = 30},
        {type = "item", name = "stainless-steel",      amount = 15},
    },
    results = {
        {type = "item", name = "rectisol-mk03", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "rectisol-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "rectisol-mk03",         amount = 1},
        {type = "item", name = "py-tank-8000",          amount = 2},
        {type = "item", name = "kevlar",                amount = 30},
        {type = "item", name = "nbfe-alloy",            amount = 15},
        {type = "item", name = "low-density-structure", amount = 10},
        {type = "item", name = "tin-plate",             amount = 30},
        {type = "item", name = "super-steel",           amount = 20},
    },
    results = {
        {type = "item", name = "rectisol-mk04", amount = 1}
    }
}
