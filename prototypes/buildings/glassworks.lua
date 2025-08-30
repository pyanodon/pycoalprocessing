RECIPE({
    type = "recipe",
    name = "glassworks-mk01",
    energy_required = 0.5,
    enabled = true,
    ingredients = {
        { type = "item", name = "stone-brick",        amount = 15 },
        { type = "item", name = "copper-plate",       amount = 20 },
        { type = "item", name = "iron-gear-wheel",    amount = 15 },
        { type = "item", name = "steam-engine",       amount = 3 },
        { type = "item", name = "iron-plate",         amount = 20 },
        { type = "item", name = "electronic-circuit", amount = 5 }
    },
    results = {
        { type = "item", name = "glassworks-mk01", amount = 1 }
    }
})

local function working_visualizations()
    local working_visualizations = {
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/a2.png",
            frame_count = 100,
            line_length = 13,
            width = 96,
            height = 224,
            animation_speed = 0.3,
            shift = util.by_pixel(96, -32)
        },
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/a3.png",
            frame_count = 100,
            line_length = 10,
            width = 34,
            height = 55,
            animation_speed = 0.3,
            shift = util.by_pixel(31, 52.5),
        },
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/a4.png",
            frame_count = 100,
            line_length = 10,
            width = 22,
            height = 39,
            animation_speed = 0.3,
            shift = util.by_pixel(37, 24.5),
        },
    }
    return { { animation = { layers = working_visualizations } } }
end

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "glassworks-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "a",
        place_result = name,
        stack_size = 10
    })

    local graphics_set = py.finite_state_machine_working_visualisations({
        states = {
            {
                name = "idle",
                next_active = "working",
                next_inactive = "idle",
                frame_sequence = { 1 },
            },
            {
                name = "working",
                next_active = "idle",
                next_inactive = "idle",
                frame_sequence = py.range(2, 100),
            },
        },
        working_visualisations = working_visualizations(),
        shadow = {
            layers = {
                {
                    filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/bot.png",
                    width = 256,
                    height = 32,
                    frame_count = 1,
                    shift = util.by_pixel(16, 96)
                },
                {
                    filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/top.png",
                    width = 256,
                    height = 224,
                    frame_count = 1,
                    shift = util.by_pixel(16, -32)
                },
                {
                    filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/top-mask.png",
                    width = 256,
                    height = 224,
                    frame_count = 1,
                    shift = util.by_pixel(16, -32),
                    tint = py.tints[ i ]
                },
            }
        }
    })

    table.insert(graphics_set.working_visualisations, 1, {
        fadeout = true,
        animation = {
            filename = "__pycoalprocessinggraphics__/graphics/entity/glassworks/a1.png",
            frame_count = 100,
            line_length = 13,
            width = 128,
            height = 224,
            animation_speed = 0.3,
            shift = util.by_pixel(-16, -32),
        }
    })

    ENTITY({
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 0.5, result = name },
        fast_replaceable_group = "glassworks",
        max_health = 100 * i,
        corpse = "medium-remnants",
        dying_explosion = "big-explosion",
        collision_box = { { -3.3, -3.3 }, { 3.3, 3.3 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = { "consumption", "speed", "pollution", "productivity" },
        crafting_categories = { "glassworks" },
        crafting_speed = i,
        energy_source = {
            type = "fluid",
            emissions_per_minute = {
                pollution = 10
            },
            destroy_non_fuel_fluid = false,
            fluid_box = {
                volume = 200,
                pipe_connections = {
                    { flow_direction = "input-output", position = { 3.0, 0 },  direction = defines.direction.east },
                    { flow_direction = "input-output", position = { -3.0, 0 }, direction = defines.direction.west }
                },
                pipe_covers = py.pipe_covers(false, true, true, true),
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, { 0.0, -0.96 }, nil, nil),
                production_type = "input",
            },
            effectivity = 1,
            burns_fluid = true,
            light_flicker = {
                minimum_intensity = 0,
                maximum_intensity = 0,
                light_intensity_to_size_coefficient = 0,
                color = { 0, 0, 0 },
            },
            scale_fluid_usage = true,
            fluid_usage_per_tick = 10,
            smoke = {
                {
                    name = "smoke",
                    north_position = util.by_pixel(68, -64),
                    south_position = util.by_pixel(68, -64),
                    east_position = util.by_pixel(68, -64),
                    west_position = util.by_pixel(68, -64),
                    frequency = 8,
                    starting_vertical_speed = 0.04,
                    starting_frame_deviation = 50
                },
                {
                    name = "smoke",
                    north_position = util.by_pixel(-12, -96),
                    south_position = util.by_pixel(-12, -96),
                    east_position = util.by_pixel(-12, -96),
                    west_position = util.by_pixel(-12, -96),
                    frequency = 8,
                    starting_vertical_speed = 0.04,
                    starting_frame_deviation = 50
                },
            }
        },
        energy_usage = (10 * i) .. "MW",
        graphics_set = graphics_set,
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --1
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, { 0.0, -0.96 }, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 1.0, -3.0 }, direction = defines.direction.north } }
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, { 0.0, -0.96 }, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { -1.0, -3.0 }, direction = defines.direction.north } }
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, { 0.0, -0.96 }, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 2.0, 3.0 }, direction = defines.direction.south } }
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-2", nil, { 0.0, -0.96 }, nil, nil),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "output", position = { -2.0, 3.0 }, direction = defines.direction.south } }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/glassworks.ogg", volume = 0.7 },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/glassworks.ogg", volume = 0.3 },
            apparent_volume = 2.5
        }
    })
end

RECIPE({
    type = "recipe",
    name = "glassworks-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "glassworks-mk01",  amount = 1 },
        { type = "item", name = "steel-plate",      amount = 35 },
        { type = "item", name = "engine-unit",      amount = 5 },
        { type = "item", name = "advanced-circuit", amount = 10 }
    },
    results = {
        { type = "item", name = "glassworks-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "glassworks-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "glassworks-mk02",      amount = 1 },
        { type = "item", name = "electric-engine-unit", amount = 15 },
        { type = "item", name = "kevlar",               amount = 15 },
        { type = "item", name = "processing-unit",      amount = 10 },
        { type = "item", name = "niobium-plate",        amount = 20 },
    },
    results = {
        { type = "item", name = "glassworks-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "glassworks-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "glassworks-mk03",       amount = 1 },
        { type = "item", name = "concrete",              amount = 40 },
        { type = "item", name = "nbfe-alloy",            amount = 15 },
        { type = "item", name = "low-density-structure", amount = 10 },
    },
    results = {
        { type = "item", name = "glassworks-mk04", amount = 1 }
    }
})
