RECIPE {
    type = "recipe",
    name = "ground-borer",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "electric-mining-drill", amount = 3},
        {type = "item", name = "soil-extractor-mk01",   amount = 2},
        {type = "item", name = "electronic-circuit",    amount = 30},
        {type = "item", name = "iron-plate",            amount = 150},
        {type = "item", name = "iron-gear-wheel",       amount = 15}
    },
    results = {
        {type = "item", name = "ground-borer", amount = 1}
    }
}:add_unlock("excavation-1")

if mods.pyrawores then
    RECIPE("ground-borer"):replace_ingredient_unsafe("iron-plate", "titanium-plate")
end

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "ground-borer" or "ground-borer-mk0" .. i
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
        minable = {mining_time = 0.5, result = name},
        fast_replaceable_group = "ground-borer",
        max_health = 700,
        corpse = "big-remnants",
        dying_explosion = "big-explosion",
        collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = 0,
        allowed_effects = {"consumption", "speed"},
        crafting_categories = {"ground-borer"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 3 * i
            },
        },
        vector_to_place_result = {4.51, 0},
        energy_usage = (1.25 * i) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer.png",
                        width = 307,
                        height = 311,
                        line_length = 6,
                        frame_count = 30,
                        animation_speed = 0.8,
                        shift = {0.2, -0.03}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ground-borer/ground-borer-mask.png",
                        width = 307,
                        height = 311,
                        line_length = 6,
                        frame_count = 30,
                        animation_speed = 0.8,
                        shift = {0.2, -0.03},
                        tint = py.tints[i]
                    },
                },
            },
        },
        fluid_boxes = {
            --1
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, 4.0}, direction = defines.direction.south}}
            },
            --2
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, -4.0}, direction = defines.direction.north}}
            }
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/ground-borer.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/ground-borer.ogg", volume = 0.3},
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
    name = "ground-borer-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ground-borer",     amount = 1},
        {type = "item", name = "nexelit-plate",    amount = 10},
        {type = "item", name = "concrete",         amount = 40},
        {type = "item", name = "plastic-bar",      amount = 10},
        {type = "item", name = "engine-unit",      amount = 4},
        {type = "item", name = "advanced-circuit", amount = 10},
        {type = "item", name = "duralumin",        amount = 30},
        {type = "item", name = "tin-plate",        amount = 30},
    },
    results = {
        {type = "item", name = "ground-borer-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ground-borer-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ground-borer-mk02",    amount = 1},
        {type = "item", name = "niobium-plate",        amount = 20},
        {type = "item", name = "electric-engine-unit", amount = 4},
        {type = "item", name = "processing-unit",      amount = 10},
        {type = "item", name = "kevlar",               amount = 15},
        {type = "item", name = "titanium-plate",       amount = 20},
        {type = "item", name = "stainless-steel",      amount = 15},
    },
    results = {
        {type = "item", name = "ground-borer-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("ground-borer-mk03"):add_ingredient_unsafe {type = "item", name = "phosphate-glass", amount = 15}:add_ingredient_unsafe {type = "item", name = "heavy-fermion", amount = 10}:add_ingredient_unsafe {type = "item", name = "carbon-aerogel", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "ground-borer-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ground-borer-mk03",     amount = 1},
        {type = "item", name = "concrete",              amount = 40},
        {type = "item", name = "nbfe-alloy",            amount = 30},
        {type = "item", name = "low-density-structure", amount = 15},
        {type = "item", name = "super-steel",           amount = 30},
    },
    results = {
        {type = "item", name = "ground-borer-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("ground-borer-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 6}:add_ingredient_unsafe {type = "item", name = "quantum-vortex-storage-system", amount = 4}
end
