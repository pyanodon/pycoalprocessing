local ball_mill_1 = RECIPE {
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

if mods.pyrawores then
    RECIPE("ball-mill-mk01"):add_ingredient_unsafe {type = "item", name = "py-asphalt", amount = 50}
end

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
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
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
        impact_category = "metal",
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
        {type = "item", name = "ball-mill-mk01",   amount = 1},
        {type = "item", name = "steel-plate",      amount = 30},
        {type = "item", name = "engine-unit",      amount = 1},
        {type = "item", name = "advanced-circuit", amount = 5},
        {type = "item", name = "duralumin",        amount = 10},
        {type = "item", name = "stainless-steel",  amount = 25},
    },
    results = {
        {type = "item", name = "ball-mill-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ball-mill-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ball-mill-mk02",       amount = 1},
        {type = "item", name = "niobium-plate",        amount = 15},
        {type = "item", name = "electric-engine-unit", amount = 2},
        {type = "item", name = "processing-unit",      amount = 10},
        {type = "item", name = "titanium-plate",       amount = 50},
        {type = "item", name = "super-steel",          amount = 15},
        {type = "item", name = "nbti-alloy",           amount = 10},
        {type = "item", name = "agitator-mk01",        amount = 1},
    },
    results = {
        {type = "item", name = "ball-mill-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("ball-mill-mk03"):add_ingredient_unsafe {type = "item", name = "heavy-fermion", amount = 40}:add_ingredient_unsafe {type = "item", name = "re-magnet", amount = 30}:add_ingredient_unsafe {type = "item", name = "harmonic-absorber", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "ball-mill-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ball-mill-mk03",  amount = 1},
        {type = "item", name = "concrete",        amount = 35},
        {type = "item", name = "nbfe-alloy",      amount = 10},
        {type = "item", name = "lead-plate",      amount = 30},
        {type = "item", name = "super-alloy",     amount = 20},
        {type = "item", name = "boron-carbide",   amount = 30},
        {type = "item", name = "science-coating", amount = 1},
        {type = "item", name = "control-unit",    amount = 5},
    },
    results = {
        {type = "item", name = "ball-mill-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("ball-mill-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "nv-center", amount = 2}
end
