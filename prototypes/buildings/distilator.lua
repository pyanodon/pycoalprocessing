RECIPE {
    type = "recipe",
    name = "distilator",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        {type = "item", name = "copper-plate",       amount = 20},
        {type = "item", name = "pipe",               amount = 10},
        {type = "item", name = "iron-plate",         amount = 10},
        {type = "item", name = "steam-engine",       amount = 2},
        {type = "item", name = "electronic-circuit", amount = 3}
    },
    results = {
        {type = "item", name = "distilator", amount = 1}
    }
}

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "distilator" or "distilator-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "k",
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
        fast_replaceable_group = "distilator",
        max_health = 300 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
        selection_box = {{-4, -4}, {4, 4}},
        forced_symmetry = "diagonal-neg",
        module_slots = i,
        allowed_effects = {"consumption", "speed", "pollution", "productivity"},
        crafting_categories = {"distilator"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-a.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-80, -50)
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-b.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(16, -50)
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-c.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(112, -50)
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-a-mask.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(-80, -50),
                        tint = py.tints[i]
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-b-mask.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(16, -50),
                        tint = py.tints[i]
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/distilator/distilator-c-mask.png",
                        width = 96,
                        height = 358,
                        line_length = 20,
                        frame_count = 100,
                        animation_speed = 0.5,
                        shift = util.by_pixel(112, -50),
                        tint = py.tints[i]
                    },
                },
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --North, left
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_connections = {{flow_direction = "input", position = {-1.5, -3.5}, direction = defines.direction.north}}
            },
            --North, right
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
                pipe_connections = {{flow_direction = "output", position = {1.5, -3.5}, direction = defines.direction.north}}
            },
            --South, left
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_connections = {{flow_direction = "input", position = {-1.5, 3.5}, direction = defines.direction.south}}
            },
            --South, right
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
                pipe_connections = {{flow_direction = "output", position = {1.5, 3.5}, direction = defines.direction.south}}
            },
            --West, top
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
                pipe_connections = {{flow_direction = "input", position = {-3.5, -1.5}, direction = defines.direction.west}}
            },
            --West, bottom
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_connections = {{flow_direction = "output", position = {-3.5, 1.5}, direction = defines.direction.west}}
            },
            --East, top
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
                pipe_connections = {{flow_direction = "input", position = {3.5, -1.5}, direction = defines.direction.east}}
            },
            --East, bottom
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_connections = {{flow_direction = "output", position = {3.5, 1.5}, direction = defines.direction.east}}
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
                pipe_connections = {{flow_direction = "output", position = {3.5, 3.5}, direction = defines.direction.east}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/distilator.ogg", volume = 1.2},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/distilator.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "distilator-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "distilator",       amount = 1},
        {type = "item", name = "steel-plate",      amount = 10},
        {type = "item", name = "nexelit-plate",    amount = 10},
        {type = "item", name = "advanced-circuit", amount = 5},
        {type = "item", name = "plastic-bar",      amount = 10},
        {type = "item", name = "engine-unit",      amount = 3},
        {type = "item", name = "stainless-steel",  amount = 30},
        {type = "item", name = "duralumin",        amount = 20},
    },
    results = {
        {type = "item", name = "distilator-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "distilator-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "distilator-mk02",      amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "steel-plate",          amount = 15},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "processing-unit",      amount = 5},
        {type = "item", name = "niobium-pipe",         amount = 15},
        {type = "item", name = "titanium-plate",       amount = 10},
        {type = "item", name = "super-steel",          amount = 30},
    },
    results = {
        {type = "item", name = "distilator-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("distilator-mk03"):add_ingredient_unsafe {type = "item", name = "phosphate-glass", amount = 15}:add_ingredient_unsafe {type = "item", name = "biopolymer", amount = 10}:add_ingredient_unsafe {type = "item", name = "aerogel", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "distilator-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "distilator-mk03", amount = 1},
        {type = "item", name = "pump",            amount = 4},
        {type = "item", name = "nbfe-alloy",      amount = 15},
        {type = "item", name = "lead-plate",      amount = 20},
    },
    results = {
        {type = "item", name = "distilator-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("distilator-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 6}:add_ingredient_unsafe {type = "item", name = "var-josephson-junction", amount = 4}
end
