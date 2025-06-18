RECIPE {
    type = "recipe",
    name = "wpu",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "wood",                amount = 20},
        {type = "item", name = "iron-plate",          amount = 20},
        {type = "item", name = "steam-engine",        amount = 1},
        {type = "item", name = "iron-gear-wheel",     amount = 15},
        {type = "item", name = "burner-mining-drill", amount = 2},
        {type = "item", name = "copper-cable",        amount = 50}
    },
    results = {
        {type = "item", name = "wpu", amount = 1}
    }
}:add_unlock("wood-processing")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "wpu" or "wpu-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "c",
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
        fast_replaceable_group = "wpu",
        max_health = 800 * i,
        vector_to_place_result = {-0.5, 3.2},
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"wpu"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/left.png",
                        width = 96,
                        height = 277,
                        line_length = 21,
                        frame_count = 130,
                        shift = {-1.5, -1.328},
                        animation_speed = 0.42
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/right.png",
                        width = 96,
                        height = 277,
                        line_length = 21,
                        frame_count = 130,
                        shift = {1.5, -1.328},
                        animation_speed = 0.42
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/left-mask.png",
                        width = 96,
                        height = 277,
                        line_length = 21,
                        frame_count = 130,
                        shift = {-1.5, -1.328},
                        animation_speed = 0.42,
                        tint = py.tints[i]
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/wpu/right-mask.png",
                        width = 96,
                        height = 277,
                        line_length = 21,
                        frame_count = 130,
                        shift = {1.5, -1.328},
                        animation_speed = 0.42,
                        tint = py.tints[i]
                    },
                }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/wpu.ogg", volume = 1.0},
            apparent_volume = 2.5
        },
    }

    -- https://github.com/pyanodon/pycoalprocessing/commit/cf03a35fa5dec4c74a464d847b4e266394317726
    if not mods["pystellarexpedition"] then
        local legacy = table.deepcopy(data.raw["assembling-machine"][name])
        legacy.vector_to_place_result = nil
        legacy.name = name .. "-legacy"
        legacy.hidden = true
        legacy.localised_name = {"", {"entity-name." .. name}, " (Legacy)"}
        data:extend {legacy}
    end
end

RECIPE {
    type = "recipe",
    name = "wpu-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "wpu",              amount = 1},
        {type = "item", name = "engine-unit",      amount = 2},
        {type = "item", name = "advanced-circuit", amount = 25},
        {type = "item", name = "plastic-bar",      amount = 50},
        {type = "item", name = "nexelit-plate",    amount = 15},
        {type = "item", name = "fast-inserter",    amount = 4},
    },
    results = {
        {type = "item", name = "wpu-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "wpu-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "wpu-mk02",             amount = 1},
        {type = "item", name = "bulk-inserter",        amount = 4},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "niobium-plate",        amount = 25},
        {type = "item", name = "processing-unit",      amount = 10}
    },
    results = {
        {type = "item", name = "wpu-mk03", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "wpu-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "wpu-mk03",              amount = 1},
        {type = "item", name = "low-density-structure", amount = 10},
        {type = "item", name = "nbfe-alloy",            amount = 10},
    },
    results = {
        {type = "item", name = "wpu-mk04", amount = 1}
    }
}
