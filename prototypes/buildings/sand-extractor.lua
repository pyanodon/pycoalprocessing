RECIPE({
    type = "recipe",
    name = "sand-extractor",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "iron-plate",         amount = 40 },
        { type = "item", name = "niobium-plate",      amount = 20 },
        { type = "item", name = "steam-engine",       amount = 1 },
        { type = "item", name = "chromium",           amount = 10 },
        { type = "item", name = "iron-gear-wheel",    amount = 20 },
        { type = "item", name = "electronic-circuit", amount = 12 }
    },
    results = {
        { type = "item", name = "sand-extractor", amount = 1 }
    }
}):add_unlock("excavation-1")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "sand-extractor" or "sand-extractor-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM({
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "e",
        place_result = name,
        stack_size = 10
    })

    ENTITY({
        type = "assembling-machine",
        name = name,
        icon = icon,
        icon_size = icon_size,
        vector_to_place_result = { -0.5, 3.1 },
        flags = { "placeable-neutral", "player-creation" },
        minable = { mining_time = 1, result = name },
        fast_replaceable_group = "sand-extractor",
        max_health = 100 * i,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        collision_box = { { -2.7, -2.7 }, { 2.7, 2.7 } },
        selection_box = { { -3.0, -3.0 }, { 3.0, 3.0 } },
        module_slots = i,
        allowed_effects = { "consumption", "productivity", "pollution", "speed" },
        crafting_categories = { "sand-extractor" },
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
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/sand-extractor/sand-extractor.png",
                        width = 192,
                        height = 202,
                        frame_count = 90,
                        line_length = 10,
                        animation_speed = 0.35,
                        shift = { 0.0, -0.312 }
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/sand-extractor/sand-extractor-mask.png",
                        width = 192,
                        height = 202,
                        frame_count = 90,
                        line_length = 10,
                        animation_speed = 0.35,
                        shift = { 0.0, -0.312 },
                        tint = py.tints[i]
                    }
                }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = { filename = "__pycoalprocessinggraphics__/sounds/sand-extractor.ogg", volume = 0.9 },
            idle_sound = { filename = "__pycoalprocessinggraphics__/sounds/sand-extractor.ogg", volume = 0.3 },
            apparent_volume = 0.45
        },
    })

    -- https://github.com/pyanodon/pycoalprocessing/commit/cf03a35fa5dec4c74a464d847b4e266394317726
    if not mods["pystellarexpedition"] then
        local legacy = table.deepcopy(data.raw["assembling-machine"][name])
        legacy.vector_to_place_result = nil
        legacy.name = name .. "-legacy"
        legacy.hidden = true
        legacy.localised_name = { "", { "entity-name." .. name }, " (Legacy)" }
        data:extend({ legacy })
    end
end

RECIPE({
    type = "recipe",
    name = "sand-extractor-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "sand-extractor",   amount = 1 },
        { type = "item", name = "steam-engine",     amount = 1 },
        { type = "item", name = "plastic-bar",      amount = 10 },
        { type = "item", name = "engine-unit",      amount = 5 },
        { type = "item", name = "nexelit-plate",    amount = 15 },
        { type = "item", name = "advanced-circuit", amount = 5 },
    },
    results = {
        { type = "item", name = "sand-extractor-mk02", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "sand-extractor-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "sand-extractor-mk02",  amount = 1 },
        { type = "item", name = "processing-unit",      amount = 5 },
        { type = "item", name = "niobium-plate",        amount = 20 },
        { type = "item", name = "niobium-pipe",         amount = 10 },
        { type = "item", name = "electric-engine-unit", amount = 1 },
        { type = "item", name = "kevlar",               amount = 10 }
    },
    results = {
        { type = "item", name = "sand-extractor-mk03", amount = 1 }
    }
})

RECIPE({
    type = "recipe",
    name = "sand-extractor-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "sand-extractor-mk03",   amount = 1 },
        { type = "item", name = "low-density-structure", amount = 20 },
        { type = "item", name = "nbfe-alloy",            amount = 10 },
    },
    results = {
        { type = "item", name = "sand-extractor-mk04", amount = 1 }
    }
})
