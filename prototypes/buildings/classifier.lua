RECIPE({
    type = "recipe",
    name = "classifier",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "steam-engine",       amount = 2 },
        { type = "item", name = "electronic-circuit", amount = 10 },
        { type = "item", name = "transport-belt",     amount = 30 },
        { type = "item", name = "iron-plate",         amount = 20 },
        { type = "item", name = "iron-gear-wheel",    amount = 50 }
    },
    results = {
        { type = "item", name = "classifier", amount = 1 }
    }
}):add_unlock("separation")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "classifier" or "classifier-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "f",
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
        fast_replaceable_group = "classifier",
        max_health = 400 * i,
        vector_to_place_result = { 0.0, 3.51 },
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = { { -3.4, -3.4 }, { 3.4, 3.4 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        module_slots = i,
        allowed_effects = { "speed", "productivity", "consumption", "pollution", "quality" },
        crafting_categories = { "classifier" },
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (i * 750) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/classifier/classifier.png",
                        width = 256,
                        height = 257,
                        frame_count = 34,
                        line_length = 8,
                        animation_speed = 0.6,
                        shift = { 0.495, -0.48 }
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/classifier/classifier-mask.png",
                        width = 256,
                        height = 257,
                        frame_count = 34,
                        line_length = 8,
                        animation_speed = 0.6,
                        shift = { 0.495, -0.48 },
                        tint = py.tints[ i ],
                    },
                }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg" },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.3 },
            apparent_volume = 2.5
        },
    })

    -- https://github.com/pyanodon/pycoalprocessing/commit/cf03a35fa5dec4c74a464d847b4e266394317726
    if not mods[ "pystellarexpedition" ] then
        local legacy = table.deepcopy(data.raw[ "assembling-machine" ][ name ])
        legacy.vector_to_place_result = nil
        legacy.name = name .. "-legacy"
        legacy.hidden = true
        legacy.localised_name = { "", { "entity-name." .. name }, " (Legacy)" }
        data:extend({ legacy })
    end
end

RECIPE({
    type = "recipe",
    name = "classifier-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "classifier",          amount = 1 },
        { type = "item", name = "nexelit-plate",       amount = 15 },
        { type = "item", name = "advanced-circuit",    amount = 10 },
        { type = "item", name = "engine-unit",         amount = 2 },
        { type = "item", name = "fast-transport-belt", amount = 30 },
        { type = "item", name = "steel-plate",         amount = 15 },
    },
    results = {
        { type = "item", name = "classifier-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "classifier-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "classifier-mk02",        amount = 1 },
        { type = "item", name = "electric-engine-unit",   amount = 4 },
        { type = "item", name = "express-transport-belt", amount = 20 },
        { type = "item", name = "kevlar",                 amount = 15 },
        { type = "item", name = "processing-unit",        amount = 5 },
        { type = "item", name = "niobium-plate",          amount = 10 },
    },
    results = {
        { type = "item", name = "classifier-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "classifier-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "classifier-mk03",       amount = 1 },
        { type = "item", name = "low-density-structure", amount = 5 },
        { type = "item", name = "nbfe-alloy",            amount = 10 },
    },
    results = {
        { type = "item", name = "classifier-mk04", amount = 1 }
    }
})
