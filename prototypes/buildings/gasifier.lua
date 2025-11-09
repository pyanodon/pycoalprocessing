local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/gasifier/pipe-north.png",
        priority = "low",
        width = 44,
        height = 25
    }
}

RECIPE {
    type = "recipe",
    name = "gasifier",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-plate",        amount = 20},
        {type = "item", name = "pipe",               amount = 20},
        {type = "item", name = "iron-plate",         amount = 10},
        {type = "item", name = "steam-engine",       amount = 2},
        {type = "item", name = "electronic-circuit", amount = 4}
    },
    results = {
        {type = "item", name = "gasifier", amount = 1}
    }
}:add_unlock("tar-processing")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "gasifier" or "gasifier-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "o",
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
        fast_replaceable_group = "gasifier",
        max_health = 350 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
        selection_box = {{-4, -4}, {4, 4}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"gasifier"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/gasifier/gasifier-anim.png",
                        priority = "high",
                        width = 269,
                        height = 269,
                        frame_count = 30,
                        line_length = 6,
                        animation_speed = 1,
                        shift = {0.15, 0.3},
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/gasifier/gasifier-anim-mask.png",
                        priority = "high",
                        width = 269,
                        height = 269,
                        frame_count = 30,
                        line_length = 6,
                        animation_speed = 1,
                        shift = {0.15, 0.3},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {3.5, -0.5}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{flow_direction = "input", position = {3.5, -2.5}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{flow_direction = "input", position = {3.5, 2.5}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{flow_direction = "output", position = {-3.5, -0.5}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.0, -0.95}, nil, nil, pipes),
                pipe_connections = {{flow_direction = "output", position = {-3.5, -2.5}, direction = defines.direction.west}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.05, 0.575}, {0.00, -0.95}, nil, nil, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-3.5, 2.5}, direction = defines.direction.west}}
            }
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/gasifier.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/gasifier.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "gasifier-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "gasifier",         amount = 1},
        {type = "item", name = "py-tank-3",        amount = 1},
        {type = "item", name = "plastic-bar",      amount = 30},
        {type = "item", name = "engine-unit",      amount = 2},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "duralumin",        amount = 20},
        {type = "item", name = "lead-plate",       amount = 20}
    },
    results = {
        {type = "item", name = "gasifier-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "gasifier-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "gasifier-mk02",        amount = 1},
        {type = "item", name = "py-tank-7",            amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 2},
        {type = "item", name = "kevlar",               amount = 15},
        {type = "item", name = "processing-unit",      amount = 10},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "titanium-plate",       amount = 25},
        {type = "item", name = "stainless-steel",      amount = 20},
    },
    results = {
        {type = "item", name = "gasifier-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("gasifier-mk03"):add_ingredient_unsafe {type = "item", name = "diamagnetic-material", amount = 20}:add_ingredient_unsafe {type = "item", name = "paramagnetic-material", amount = 20}:add_ingredient_unsafe {type = "item", name = "harmonic-absorber", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "gasifier-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "gasifier-mk03", amount = 1},
        {type = "item", name = "py-tank-8",     amount = 1},
        {type = "item", name = "nbfe-alloy",    amount = 20},
        {type = "item", name = "super-steel",   amount = 20},
        {type = "item", name = "tin-plate",     amount = 40},
    },
    results = {
        {type = "item", name = "gasifier-mk04", amount = 1},
    }
}

if mods.pyhightech then
    RECIPE("gasifier-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "parametric-oscilator", amount = 2}
end
