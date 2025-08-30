RECIPE({
    type = "recipe",
    name = "advanced-foundry-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "copper-cable",  amount = 30 },
        { type = "item", name = "iron-plate",    amount = 30 },
        { type = "item", name = "stone-furnace", amount = 10 },
        { type = "item", name = "stone-brick",   amount = 20 },
    },
    results = {
        { type = "item", name = "advanced-foundry-mk01", amount = 1 }
    }
}):add_unlock("steel-processing")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "advanced-foundry-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "b",
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
        fast_replaceable_group = "advanced-foundry",
        max_health = 600 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -2.9, -2.9 }, { 2.9, 2.9 } },
        selection_box = { { -3.0, -3.0 }, { 3.0, 3.0 } },
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" },
        crafting_categories = { "advanced-foundry", "smelting" },
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (1.2 * i) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-base.png",
                        width = 224,
                        height = 224,
                        line_length = 9,
                        frame_count = 76,
                        shift = { 0.3, -0.5 },
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-base-mask.png",
                        width = 224,
                        height = 224,
                        line_length = 9,
                        frame_count = 76,
                        shift = { 0.3, -0.5 },
                        animation_speed = 0.5,
                        tint = py.tints[i],
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/advanced-foundry/advanced-foundry-top.png",
                        width = 224,
                        height = 41,
                        line_length = 9,
                        frame_count = 76,
                        shift = { 0.3, -4.63 },
                        animation_speed = 0.5
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = py.sexy_pipe_pictures(),
                pipe_picture_frozen = py.sexy_pipe_pictures_frozen(),
                pipe_covers = pipecoverspictures(),
                secondary_draw_orders = { north = -1, east = -1, west = -1 },
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 2.5, -0.5 }, direction = defines.direction.east } }
            },
            {
                production_type = "input",
                pipe_picture = py.sexy_pipe_pictures(),
                pipe_picture_frozen = py.sexy_pipe_pictures_frozen(),
                pipe_covers = pipecoverspictures(),
                secondary_draw_orders = { north = -1, east = -1, west = -1 },
                volume = 1000,
                pipe_connections = { { flow_direction = "input", position = { 0.5, 2.5 }, direction = defines.direction.south } }
            },
            {
                production_type = "output",
                pipe_picture = py.sexy_pipe_pictures(),
                pipe_picture_frozen = py.sexy_pipe_pictures_frozen(),
                pipe_covers = pipecoverspictures(),
                secondary_draw_orders = { north = -1, east = -1, west = -1 },
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -2.5, -0.5 }, direction = defines.direction.west } }
            },
            {
                production_type = "output",
                pipe_picture = py.sexy_pipe_pictures(),
                pipe_picture_frozen = py.sexy_pipe_pictures_frozen(),
                pipe_covers = pipecoverspictures(),
                secondary_draw_orders = { north = -1, east = -1, west = -1 },
                volume = 100,
                pipe_connections = { { flow_direction = "output", position = { -0.5, 2.5 }, direction = defines.direction.south } }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/advanced-foundry.ogg", volume = 0.45 },
        }
    })
end

RECIPE({
    type = "recipe",
    name = "advanced-foundry-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "advanced-foundry-mk01", amount = 1 },
        { type = "item", name = "nexelit-plate",         amount = 20 },
        { type = "item", name = "concrete",              amount = 60 },
        { type = "item", name = "engine-unit",           amount = 4 },
        { type = "item", name = "steel-plate",           amount = 40 },
        { type = "item", name = "plastic-bar",           amount = 10 },
        { type = "item", name = "advanced-circuit",      amount = 10 }
    },
    results = {
        { type = "item", name = "advanced-foundry-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "advanced-foundry-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "advanced-foundry-mk02", amount = 1 },
        { type = "item", name = "concrete",              amount = 100 },
        { type = "item", name = "processing-unit",       amount = 15 },
        { type = "item", name = "niobium-plate",         amount = 10 },
        { type = "item", name = "electric-engine-unit",  amount = 4 },
    },
    results = {
        { type = "item", name = "advanced-foundry-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "advanced-foundry-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "advanced-foundry-mk03", amount = 1 },
        { type = "item", name = "low-density-structure", amount = 20 },
        { type = "item", name = "nbfe-alloy",            amount = 10 },
    },
    results = {
        { type = "item", name = "advanced-foundry-mk04", amount = 1 }
    }
})
