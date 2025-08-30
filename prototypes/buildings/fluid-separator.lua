RECIPE({
    type = "recipe",
    name = "fluid-separator",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "storage-tank",        amount = 4 },
        { type = "item", name = "chemical-plant-mk01", amount = 2 },
        { type = "item", name = "electronic-circuit",  amount = 15 },
        { type = "item", name = "pipe",                amount = 40 },
        { type = "item", name = "iron-gear-wheel",     amount = 15 }
    },
    results = {
        { type = "item", name = "fluid-separator", amount = 1 }
    }
}):add_unlock("fluid-separation")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "fluid-separator" or "fluid-separator-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "m",
        place_result = name,
        stack_size = 10
    })

    ENTITY({
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 1, result = name },
        fast_replaceable_group = "fluid-separator",
        max_health = 400 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" },
        crafting_categories = { "fluid-separator" },
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (900 * i) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/fluid-separator/" .. name .. ".png",
                        width = 248,
                        height = 260,
                        frame_count = 1,
                        shift = { 0.34, -0.57 }
                    },
                }
            },
        },
        fluid_boxes = {
            --North
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 2.0, -3.0 }, direction = defines.direction.north } }
            },
            --North2
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 0.0, -3.0 }, direction = defines.direction.north } }
            },
            --North3
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -2.0, -3.0 }, direction = defines.direction.north } }
            },
            --South3
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 0.0, 3.0 }, direction = defines.direction.south } }
            },
            --South
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 2.0, 3.0 }, direction = defines.direction.south } }
            },
            --South2
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { -2.0, 3.0 }, direction = defines.direction.south } }
            }
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/fluid-separator.ogg" },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/fluid-separator.ogg", volume = 0.3 },
            apparent_volume = 1.2
        },
    })
end

RECIPE({
    type = "recipe",
    name = "fluid-separator-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "fluid-separator",  amount = 1 },
        { type = "item", name = "storage-tank",     amount = 1 },
        { type = "item", name = "nexelit-plate",    amount = 10 },
        { type = "item", name = "concrete",         amount = 40 },
        { type = "item", name = "plastic-bar",      amount = 10 },
        { type = "item", name = "advanced-circuit", amount = 10 }
    },
    results = {
        { type = "item", name = "fluid-separator-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "fluid-separator-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "fluid-separator-mk02", amount = 1 },
        { type = "item", name = "storage-tank",         amount = 1 },
        { type = "item", name = "processing-unit",      amount = 5 },
        { type = "item", name = "niobium-plate",        amount = 15 },
        { type = "item", name = "electric-engine-unit", amount = 5 },
        { type = "item", name = "kevlar",               amount = 30 }
    },
    results = {
        { type = "item", name = "fluid-separator-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "fluid-separator-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "fluid-separator-mk03",  amount = 1 },
        { type = "item", name = "storage-tank",          amount = 1 },
        { type = "item", name = "low-density-structure", amount = 10 },
        { type = "item", name = "nbfe-alloy",            amount = 5 },
        { type = "item", name = "niobium-pipe",          amount = 15 },
    },
    results = {
        { type = "item", name = "fluid-separator-mk04", amount = 1 }
    }
})
