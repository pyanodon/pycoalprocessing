local pipe_left = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north1.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-north2.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

RECIPE {
    type = "recipe",
    name = "desulfurizator-unit",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "storage-tank",        amount = 3},
        {type = "item", name = "chemical-plant-mk01", amount = 1},
        {type = "item", name = "electronic-circuit",  amount = 40},
        {type = "item", name = "steel-plate",         amount = 20},
        {type = "item", name = "iron-plate",          amount = 50}
    },
    results = {
        {type = "item", name = "desulfurizator-unit", amount = 1}
    }
}:add_unlock("desulfurization")

if mods.pyrawores then
    RECIPE("desulfurizator-unit"):replace_ingredient_unsafe("iron-plate", "titanium-plate")
end

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "desulfurizator-unit" or "desulfurizator-unit-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "j",
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
        fast_replaceable_group = "desulfurizator-unit",
        max_health = i * 500,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
        selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"desulfurization"},
        crafting_speed = i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = 1
            },
        },
        energy_usage = (i * 2) .. "MW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-anim.png",
                        width = 196,
                        height = 202,
                        frame_count = 15,
                        line_length = 5,
                        animation_speed = 0.75,
                        shift = {0.06, -0.1}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/desulfurizator-unit/dessulfurizator-anim-mask.png",
                        width = 196,
                        height = 202,
                        frame_count = 15,
                        line_length = 5,
                        animation_speed = 0.75,
                        shift = {0.06, -0.1},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes = {
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.05, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_right),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {2.5, -1.5}, direction = defines.direction.east}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.25, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_left),
                pipe_covers = py.pipe_covers(true, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {2.5, 1.5}, direction = defines.direction.east}}
            }
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__base__/sound/chemical-plant.ogg"},
            --idle_sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.3},
            apparent_volume = 0.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "desulfurizator-unit-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "desulfurizator-unit", amount = 1},
        {type = "item", name = "engine-unit",         amount = 2},
        {type = "item", name = "advanced-circuit",    amount = 10},
        {type = "item", name = "nexelit-plate",       amount = 10},
        {type = "item", name = "duralumin",           amount = 15},
        {type = "item", name = "tin-plate",           amount = 25},
        {type = "item", name = "glass",               amount = 10}
    },
    results = {
        {type = "item", name = "desulfurizator-unit-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "desulfurizator-unit-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "desulfurizator-unit-mk02", amount = 1},
        {type = "item", name = "processing-unit",          amount = 5},
        {type = "item", name = "niobium-plate",            amount = 10},
        {type = "item", name = "electric-engine-unit",     amount = 4},
        {type = "item", name = "kevlar",                   amount = 30},
        {type = "item", name = "titanium-plate",           amount = 40},
        {type = "item", name = "stainless-steel",          amount = 30},
        {type = "item", name = "nbti-alloy",               amount = 15},
        {type = "item", name = "boron-carbide",            amount = 20},
        {type = "item", name = "py-heat-exchanger",        amount = 1},
    },
    results = {
        {type = "item", name = "desulfurizator-unit-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("desulfurizator-unit-mk03"):add_ingredient_unsafe {type = "item", name = "biopolymer", amount = 15}:add_ingredient_unsafe {type = "item", name = "carbon-aerogel", amount = 20}
end

RECIPE {
    type = "recipe",
    name = "desulfurizator-unit-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "desulfurizator-unit-mk03", amount = 1},
        {type = "item", name = "pump",                     amount = 4},
        {type = "item", name = "nbfe-alloy",               amount = 20},
        {type = "item", name = "low-density-structure",    amount = 10},
        {type = "item", name = "super-alloy",              amount = 20},
        {type = "item", name = "wall-shield",              amount = 2},
        {type = "item", name = "science-coating",          amount = 1},
        {type = "item", name = "control-unit",             amount = 5},
    },
    results = {
        {type = "item", name = "desulfurizator-unit-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("desulfurizator-unit-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "quantum-dots", amount = 5}
end
