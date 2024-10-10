RECIPE {
    type = "recipe",
    name = "ball-mill-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "assembling-machine-1", amount = 1},
        {type = "item", name = "steam-engine",         amount = 1},
        {type = "item", name = "copper-plate",         amount = 30},
        {type = "item", name = "steel-plate",          amount = 40},
        {type = "item", name = "iron-plate",           amount = 50},
    },
    results = {
        {type = "item", name = "ball-mill-mk01", amount = 1}
    }
}:add_unlock("crusher")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "ball-mill-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "d",
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
        fast_replaceable_group = "ball-mill",
        max_health = 400 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        match_animation_speed_to_activity = false,
        module_slots = i,
        allowed_effects = {"consumption", "speed", "productivity", "pollution"},
        crafting_categories = {"ball-mill"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ball-mill/ball-mill.png",
                        width = 215,
                        height = 198,
                        frame_count = 80,
                        line_length = 8,
                        animation_speed = 0.8,
                        shift = {0.318, -0.12}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ball-mill/ball-mill-mask.png",
                        width = 215,
                        height = 198,
                        frame_count = 80,
                        line_length = 8,
                        animation_speed = 0.8,
                        shift = {0.318, -0.12},
                        tint = py.tints[i],
                    },
                }
            },
        },
        vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.55},
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg", volume = 0.3},
            apparent_volume = 2.5
        }
    }
end

RECIPE {
    type = "recipe",
    name = "ball-mill-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ball-mill-mk01",   1},
        {"steel-plate",      30},
        {"engine-unit",      1},
        {"advanced-circuit", 5},
    },
    results = {
        {"ball-mill-mk02", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ball-mill-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ball-mill-mk02",       1},
        {"niobium-plate",        15},
        {"electric-engine-unit", 2},
        {"processing-unit",      10},
    },
    results = {
        {"ball-mill-mk03", 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ball-mill-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"ball-mill-mk03", 1},
        {"concrete",       35},
        {"nbfe-alloy",     10},
    },
    results = {
        {"ball-mill-mk04", 1}
    }
}
