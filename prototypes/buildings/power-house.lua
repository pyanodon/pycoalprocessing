local pipe_left = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/power-house/north-left.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_mid = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/power-house/north-mid.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/power-house/north-right.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

RECIPE({
    type = "recipe",
    name = "power-house",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "gasturbinemk01",     amount = 1 },
        { type = "item", name = "electronic-circuit", amount = 25 },
        { type = "item", name = "steel-plate",        amount = 20 },
        { type = "item", name = "iron-gear-wheel",    amount = 15 },
        { type = "item", name = "iron-plate",         amount = 30 }
    },
    results = {
        { type = "item", name = "power-house", amount = 1 }
    }
}):add_unlock("energy-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "power-house" or "power-house-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "t",
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
        fast_replaceable_group = "power-house",
        max_health = 300 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        module_slots = 2 * i,
        allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" },
        crafting_categories = { "combustion" },
        crafting_speed = i,
        energy_source = {
            type = "burner",
            fuel_categories = { "chemical", "biomass" },
            effectivity = 1,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            emissions_per_minute = {
                pollution = 1
            },
            smoke =
            {
                {
                    name = "smoke",
                    north_position = { 2.1, -1.9 },
                    east_position = { 2.1, -1.9 },
                    west_position = { 2.1, -1.9 },
                    south_position = { 2.1, -1.9 },
                    frequency = 90,
                    starting_vertical_speed = 0.03,
                    slow_down_factor = 1,
                    starting_frame_deviation = 60
                },
                {
                    name = "turbine-smoke",
                    north_position = { 1.9, -3.0 },
                    east_position = { 1.9, -3.0 },
                    west_position = { 1.9, -3.0 },
                    south_position = { 1.9, -3.0 },
                    frequency = 90,
                    starting_vertical_speed = 0.02,
                    slow_down_factor = 1,
                    starting_frame_deviation = 60
                },
            },
        },
        energy_usage = (10 * i) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/power-house/powerhouse-anim.png",
                        width = 233,
                        height = 234,
                        frame_count = 30,
                        line_length = 6,
                        animation_speed = 0.7,
                        shift = { 0.156, -0.165 }
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/power-house/powerhouse-anim-mask.png",
                        width = 233,
                        height = 234,
                        frame_count = 30,
                        line_length = 6,
                        animation_speed = 0.7,
                        shift = { 0.156, -0.165 },
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", { -0.1, 1.1 }, { -0.00, -0.89 }, { 0.55, 0.15 }, { -0.5, 0.15 }, pipe_left),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { -1.0, -3.0 }, direction = defines.direction.north } }
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", { 0.1, 1.1 }, { -0.00, -0.89 }, { 0.55, 0.15 }, { -0.5, 0.15 }, pipe_mid),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 0.0, -3.0 }, direction = defines.direction.north } }
            },
            {
                production_type = "input",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_picture = py.pipe_pictures("assembling-machine-2", { -0, 1.1 }, { -0.00, -0.89 }, { 0.55, 0.15 }, { -0.5, 0.15 }, pipe_right),
                pipe_connections = { { flow_direction = "input", position = { 1.0, -3.0 }, direction = defines.direction.north } }
            },
            {
                production_type = "output",
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_picture = py.pipe_pictures("assembling-machine-2", { -0.1, 1.1 }, { -0.00, -0.89 }, { 0.55, 0.15 }, { -0.5, 0.15 }, pipe_left),
                pipe_connections = { { flow_direction = "output", position = { -1.0, 3.0 }, direction = defines.direction.south } }
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-2", { 0.1, 1.1 }, { -0.00, -0.89 }, { 0.55, 0.15 }, { -0.5, 0.15 }, pipe_mid),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 1.0, 3.0 }, direction = defines.direction.south } }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/power-house.ogg" },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/power-house.ogg", volume = 0.3 },
            apparent_volume = 2.5
        },
    })
end

RECIPE({
    type = "recipe",
    name = "power-house-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "power-house",         amount = 1 },
        { type = "item", name = "nexelit-plate",       amount = 15 },
        { type = "item", name = "advanced-circuit",    amount = 10 },
        { type = "item", name = "fast-transport-belt", amount = 30 },
        { type = "item", name = "steel-plate",         amount = 15 },
        { type = "item", name = "engine-unit",         amount = 1 },
    },
    results = {
        { type = "item", name = "power-house-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "power-house-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "power-house-mk02",     amount = 1 },
        { type = "item", name = "electric-engine-unit", amount = 4 },
        { type = "item", name = "kevlar",               amount = 15 },
        { type = "item", name = "processing-unit",      amount = 5 },
        { type = "item", name = "niobium-plate",        amount = 10 },
    },
    results = {
        { type = "item", name = "power-house-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "power-house-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "power-house-mk03",      amount = 1 },
        { type = "item", name = "low-density-structure", amount = 5 },
        { type = "item", name = "nbfe-alloy",            amount = 10 },
    },
    results = {
        { type = "item", name = "power-house-mk04", amount = 1 }
    }
})
