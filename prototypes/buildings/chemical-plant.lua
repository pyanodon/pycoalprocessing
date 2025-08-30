RECIPE({
    type = "recipe",
    name = "chemical-plant-mk01",
    energy_required = 1,
    enabled = false,
    ingredients = {
        { type = "item", name = "distilator",         amount = 1 },
        { type = "item", name = "copper-plate",       amount = 20 },
        { type = "item", name = "iron-gear-wheel",    amount = 15 },
        { type = "item", name = "pipe",               amount = 20 },
        { type = "item", name = "iron-plate",         amount = 20 },
        { type = "item", name = "electronic-circuit", amount = 5 }
    },
    results = {
        { type = "item", name = "chemical-plant-mk01", amount = 1 }
    }
}):add_unlock("filtration")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "chemical-plant-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "d",
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
        fast_replaceable_group = "chemical-plant",
        max_health = 400 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -4.3, -4.3 }, { 4.3, 4.3 } },
        selection_box = { { -4.5, -4.5 }, { 4.5, 4.5 } },
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = { "consumption", "speed", "pollution", "productivity" },
        crafting_categories = { "chemistry" },
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = -1
            },
        },
        energy_usage = i .. "MW",
        graphics_set = {
            working_visualisations = {
                {
                    north_position = util.by_pixel(96, -64),
                    west_position = util.by_pixel(96, -64),
                    south_position = util.by_pixel(96, -64),
                    east_position = util.by_pixel(96, -64),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/reator.png",
                        frame_count = 80,
                        line_length = 20,
                        draw_as_glow = true,
                        width = 96,
                        height = 96,
                        animation_speed = 0.35,
                    }
                },
                {
                    north_position = util.by_pixel(0, -48),
                    west_position = util.by_pixel(0, -48),
                    south_position = util.by_pixel(0, -48),
                    east_position = util.by_pixel(0, -48),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/light-y.png",
                        frame_count = 1,
                        repeat_count = 80,
                        draw_as_light = true,
                        draw_as_glow = true,
                        width = 288,
                        height = 384,
                        animation_speed = 0.35,
                    }
                },
                {
                    north_position = util.by_pixel(0, -48),
                    west_position = util.by_pixel(0, -48),
                    south_position = util.by_pixel(0, -48),
                    east_position = util.by_pixel(0, -48),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/light-b.png",
                        frame_count = 1,
                        repeat_count = 80,
                        draw_as_light = true,
                        draw_as_glow = true,
                        width = 288,
                        height = 384,
                        animation_speed = 0.35,
                    }
                },
                {
                    north_position = util.by_pixel(32, -80),
                    west_position = util.by_pixel(32, -80),
                    south_position = util.by_pixel(32, -80),
                    east_position = util.by_pixel(32, -80),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/smoke.png",
                        frame_count = 80,
                        line_length = 20,
                        width = 96,
                        height = 128,
                        animation_speed = 0.35,
                    }
                },
                {
                    north_position = util.by_pixel(-48, 80),
                    west_position = util.by_pixel(-48, 80),
                    south_position = util.by_pixel(-48, 80),
                    east_position = util.by_pixel(-48, 80),
                    animation = {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/tira-light.png",
                        frame_count = 80,
                        line_length = 16,
                        draw_as_glow = true,
                        width = 128,
                        height = 64,
                        animation_speed = 0.35,
                    }
                },
            },
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/bottom.png",
                        width = 288,
                        height = 32,
                        frame_count = 1,
                        repeat_count = 80,
                        animation_speed = 0.35,
                        shift = util.by_pixel(-0, 128),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/sh.png",
                        width = 320,
                        height = 256,
                        frame_count = 1,
                        repeat_count = 80,
                        animation_speed = 0.35,
                        draw_as_shadow = true,
                        shift = util.by_pixel(16, 16),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/left.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(-96, -64),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/mid.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(0, -64),
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/right.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(96, -64),
                    },
                    --MASKS
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/left-mask.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(-96, -64),
                        tint = py.tints[i],
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/mid-mask.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(0, -64),
                        tint = py.tints[i],
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/chemical-plant/right-mask.png",
                        width = 96,
                        height = 352,
                        frame_count = 80,
                        line_length = 20,
                        animation_speed = 0.35,
                        shift = util.by_pixel(96, -64),
                        tint = py.tints[i],
                    },
                },
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --North
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 4.0, -4.0 }, direction = defines.direction.north } }
            },
            --North2
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 0.0, -4.0 }, direction = defines.direction.north } }
            },
            --North3
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { 2.0, -4.0 }, direction = defines.direction.north } }
            },
            --South3
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 0.0, 4.0 }, direction = defines.direction.south } }
            },
            --South
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 2.0, 4.0 }, direction = defines.direction.south } }
            },
            --South2
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, { -0.00, -0.95 }, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 4.0, 4.0 }, direction = defines.direction.south } }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/chemical-plant.ogg", volume = 1.0 },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/chemical-plant.ogg", volume = 0.3 },
            apparent_volume = 2.5
        }
    })
end

RECIPE({
    type = "recipe",
    name = "chemical-plant-mk02",
    energy_required = 1,
    enabled = false,
    ingredients = {
        { type = "item", name = "chemical-plant-mk01", amount = 1 },
        { type = "item", name = "concrete",            amount = 30 },
        { type = "item", name = "titanium-plate",      amount = 20 },
        { type = "item", name = "nickel-plate",        amount = 50 },
        { type = "item", name = "engine-unit",         amount = 5 },
    },
    results = {
        { type = "item", name = "chemical-plant-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "chemical-plant-mk03",
    energy_required = 1,
    enabled = false,
    ingredients = {
        { type = "item", name = "chemical-plant-mk02",  amount = 1 },
        { type = "item", name = "electric-engine-unit", amount = 4 },
        { type = "item", name = "nichrome",             amount = 20 },
        { type = "item", name = "glass",                amount = 50 },
    },
    results = {
        { type = "item", name = "chemical-plant-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "chemical-plant-mk04",
    energy_required = 1,
    enabled = false,
    ingredients = {
        { type = "item", name = "chemical-plant-mk03",   amount = 1 },
        { type = "item", name = "low-density-structure", amount = 30 },
    },
    results = {
        { type = "item", name = "chemical-plant-mk04", amount = 1 }
    }
})
