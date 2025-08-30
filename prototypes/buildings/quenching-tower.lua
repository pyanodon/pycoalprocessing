local pipe_picture_override = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/top-right.png",
        priority = "low",
        width = 232,
        height = 252,
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/south-left.png",
        priority = "extra-high",
        width = 232,
        height = 262
    }
}

RECIPE({
    type = "recipe",
    name = "quenching-tower",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "concrete",           amount = 50 },
        { type = "item", name = "iron-stick",         amount = 50 },
        { type = "item", name = "steam-engine",       amount = 1 },
        { type = "item", name = "pipe",               amount = 10 },
        { type = "item", name = "pump",               amount = 2 },
        { type = "item", name = "electronic-circuit", amount = 15 }
    },
    results = {
        { type = "item", name = "quenching-tower", amount = 1 }
    }
}):add_unlock("separation")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "quenching-tower" or "quenching-tower-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "u",
        place_result = name,
        stack_size = 10
    })

    ENTITY({
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.5, result = name },
        fast_replaceable_group = "quenching-tower",
        max_health = 500 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" },
        crafting_categories = { "quenching-tower" },
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
                        height = 275,
                        frame_count = 60,
                        line_length = 8,
                        animation_speed = 0.7,
                        shift = { 0.08, -0.5 },
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/quenching-tower/quenching-tower-anim-mask.png",
                        width = 232,
                        height = 275,
                        frame_count = 60,
                        line_length = 8,
                        animation_speed = 0.7,
                        shift = { 0.08, -0.5 },
                        tint = py.tints[i],
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", { -0.875, 4.1 }, { 1.1, -3.85 }, nil, nil, pipe_picture_override),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 3.0, -1.0 }, direction = defines.direction.east } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", { -0.875, 4.1 }, { 1.1, -3.85 }, nil, nil, pipe_picture_override),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 3.0, 1.0 }, direction = defines.direction.east } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", { -0.875, 4.1 }, { 1.1, -3.85 }, nil, nil, pipe_picture_override),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -3.0, -1.0 }, direction = defines.direction.west } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", { -0.875, 4.1 }, { 1.1, -3.85 }, nil, nil, pipe_picture_override),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -3.0, 1.0 }, direction = defines.direction.west } },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", { -0.875, 4.1 }, { 1.1, -3.85 }, nil, nil, pipe_picture_override),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -1.0, 3.0 }, direction = defines.direction.south } },
                secondary_draw_orders = { north = -1 }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/quenching-tower.ogg", volume = 0.8 },
            idle_sound = mods["pyfusionenergygraphics"] and { filename = "__pyfusionenergygraphics__/sounds/hydrocyclone-idle.ogg", volume = 0.3 } or nil,
            fade_in_ticks = 15,
            fade_out_ticks = 4,
        },
    })
end

RECIPE({
    type = "recipe",
    name = "quenching-tower-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "quenching-tower",  amount = 1 },
        { type = "item", name = "plastic-bar",      amount = 20 },
        { type = "item", name = "pump",             amount = 4 },
        { type = "item", name = "advanced-circuit", amount = 15 },
        { type = "item", name = "engine-unit",      amount = 1 },
    },
    results = {
        { type = "item", name = "quenching-tower-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "quenching-tower-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "quenching-tower-mk02", amount = 1 },
        { type = "item", name = "electric-engine-unit", amount = 4 },
        { type = "item", name = "niobium-plate",        amount = 20 },
        { type = "item", name = "niobium-pipe",         amount = 20 },
        { type = "item", name = "processing-unit",      amount = 10 }
    },
    results = {
        { type = "item", name = "quenching-tower-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "quenching-tower-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "quenching-tower-mk03",  amount = 1 },
        { type = "item", name = "low-density-structure", amount = 10 },
        { type = "item", name = "nbfe-alloy",            amount = 10 },
        { type = "item", name = "kevlar",                amount = 20 },
    },
    results = {
        { type = "item", name = "quenching-tower-mk04", amount = 1 }
    }
})
