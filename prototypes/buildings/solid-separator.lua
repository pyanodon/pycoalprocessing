RECIPE {
    type = "recipe",
    name = "solid-separator",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steam-engine",       amount = 3},
        {type = "item", name = "electronic-circuit", amount = 30},
        {type = "item", name = "steel-plate",        amount = 50},
        {type = "item", name = "iron-plate",         amount = 20},
        {type = "item", name = "iron-gear-wheel",    amount = 50}
    },
    results = {
        {type = "item", name = "solid-separator", amount = 1}
    }
}:add_unlock("separation")

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "solid-separator" or "solid-separator-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "x",
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
        fast_replaceable_group = "solid-separator",
        max_health = i * 400,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"solid-separator"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (1.5 * i) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/solid-separator/solid-separator.png",
                        width = 249,
                        height = 298,
                        frame_count = 20,
                        line_length = 5,
                        animation_speed = 1,
                        shift = {0.37, -1.169},
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/solid-separator/solid-separator-mask.png",
                        width = 249,
                        height = 298,
                        frame_count = 20,
                        line_length = 5,
                        animation_speed = 1,
                        shift = {0.37, -1.169},
                        tint = py.tints[i],
                    },
                }
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/solid-separator.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/solid-separator.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "solid-separator-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "solid-separator",  amount = 1},
        {type = "item", name = "engine-unit",      amount = 6},
        {type = "item", name = "nexelit-plate",    amount = 10},
        {type = "item", name = "plastic-bar",      amount = 10},
        {type = "item", name = "advanced-circuit", amount = 20},
        {type = "item", name = "duralumin",        amount = 30},
        {type = "item", name = "tin-plate",        amount = 30},
    },
    results = {
        {type = "item", name = "solid-separator-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "solid-separator-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "solid-separator-mk02", amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "steel-plate",          amount = 15},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "processing-unit",      amount = 5},
        {type = "item", name = "niobium-pipe",         amount = 15},
        {type = "item", name = "titanium-plate",       amount = 20},
        {type = "item", name = "stainless-steel",      amount = 15},
        {type = "item", name = "nbti-alloy",           amount = 15},
        {type = "item", name = "boron-carbide",        amount = 20},
        {type = "item", name = "py-heat-exchanger",    amount = 1},
    },
    results = {
        {type = "item", name = "solid-separator-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("solid-separator-mk03"):add_ingredient_unsafe {type = "item", name = "heavy-fermion", amount = 20}:add_ingredient_unsafe {type = "item", name = "superconductor", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "solid-separator-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "solid-separator-mk03",  amount = 1},
        {type = "item", name = "nbfe-alloy",            amount = 20},
        {type = "item", name = "low-density-structure", amount = 10},
        {type = "item", name = "super-steel",           amount = 30},
        {type = "item", name = "super-alloy",           amount = 20},
        {type = "item", name = "wall-shield",           amount = 2},
        {type = "item", name = "science-coating",       amount = 1},
        {type = "item", name = "control-unit",          amount = 5},
    },
    results = {
        {type = "item", name = "solid-separator-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("solid-separator-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "harmonic-absorber", amount = 10}
end
