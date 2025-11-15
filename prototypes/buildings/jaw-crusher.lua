RECIPE {
    type = "recipe",
    name = "jaw-crusher",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "iron-plate",         amount = 25},
        {type = "item", name = "steam-engine",       amount = 4},
        {type = "item", name = "steel-plate",        amount = 30},
        {type = "item", name = "electronic-circuit", amount = 15}
    },
    results = {
        {type = "item", name = "jaw-crusher", amount = 1}
    }
}:add_unlock("crusher")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "jaw-crusher" or "jaw-crusher-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "s",
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
        fast_replaceable_group = "jaw-crusher",
        max_health = 600 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"crusher"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-left.png",
                        width = 96,
                        height = 256,
                        line_length = 21,
                        frame_count = 161,
                        shift = {-2.0, -0.5},
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-mid.png",
                        width = 96,
                        height = 256,
                        line_length = 21,
                        frame_count = 161,
                        shift = {1.0, -0.5},
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-right.png",
                        width = 32,
                        height = 256,
                        line_length = 64,
                        frame_count = 161,
                        shift = {3.0, -0.5},
                        animation_speed = 0.5
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-left-mask.png",
                        width = 96,
                        height = 256,
                        line_length = 21,
                        frame_count = 161,
                        shift = {-2.0, -0.5},
                        animation_speed = 0.5,
                        tint = py.tints[i]
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/jaw-crusher/sprite-mid-mask.png",
                        width = 96,
                        height = 256,
                        line_length = 21,
                        frame_count = 161,
                        shift = {1.0, -0.5},
                        animation_speed = 0.5,
                        tint = py.tints[i]
                    }
                }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.85},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/classifier.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "jaw-crusher-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "jaw-crusher",      amount = 1},
        {type = "item", name = "nexelit-plate",    amount = 30},
        {type = "item", name = "engine-unit",      amount = 4},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "duralumin",        amount = 20},
        {type = "item", name = "stainless-steel",  amount = 30},
        {type = "item", name = "tin-plate",        amount = 30},
    },
    results = {
        {type = "item", name = "jaw-crusher-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "jaw-crusher-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "jaw-crusher-mk02",     amount = 1},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "processing-unit",      amount = 10},
        {type = "item", name = "titanium-plate",       amount = 60},
        {type = "item", name = "super-steel",          amount = 30},
        {type = "item", name = "nbti-alloy",           amount = 10},
        {type = "item", name = "sc-unit",              amount = 2},
    },
    results = {
        {type = "item", name = "jaw-crusher-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("jaw-crusher-mk03"):add_ingredient_unsafe {type = "item", name = "heavy-fermion", amount = 40}:add_ingredient_unsafe {type = "item", name = "re-magnet", amount = 30}:add_ingredient_unsafe {type = "item", name = "harmonic-absorber", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "jaw-crusher-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "jaw-crusher-mk03", amount = 1},
        {type = "item", name = "concrete",         amount = 40},
        {type = "item", name = "nbfe-alloy",       amount = 15},
        {type = "item", name = "lead-plate",       amount = 30},
        {type = "item", name = "super-alloy",      amount = 20},
        {type = "item", name = "boron-carbide",    amount = 30},
        {type = "item", name = "science-coating",  amount = 1},
        {type = "item", name = "control-unit",     amount = 5},
    },
    results = {
        {type = "item", name = "jaw-crusher-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("jaw-crusher-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "nv-center", amount = 2}
end
