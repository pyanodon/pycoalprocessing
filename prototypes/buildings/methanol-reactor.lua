local pipes = {
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/pipe-ending-down.png",
        priority = "extra-high",
        width = 40,
        height = 32
    }
}

local pipe_picture = py.pipe_pictures("assembling-machine-3", nil, {-0.05, -0.75}, nil, nil, pipes)
local pipe_covers = py.pipe_covers(true, true, true, true)

RECIPE {
    type = "recipe",
    name = "methanol-reactor",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "gasturbinemk01",     amount = 1},
        {type = "item", name = "boiler",             amount = 2},
        {type = "item", name = "electronic-circuit", amount = 25},
        {type = "item", name = "steel-plate",        amount = 20},
        {type = "item", name = "iron-gear-wheel",    amount = 15}
    },
    results = {
        {type = "item", name = "methanol-reactor", amount = 1}
    }
}:add_unlock("methanol-processing-1")

if mods.pyrawores then
    RECIPE("methanol-reactor"):replace_ingredient_unsafe("chemical-plant-mk01", "electrolyzer-mk01")
end

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = i == 1 and "methanol-reactor" or "methanol-reactor-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "q",
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
        fast_replaceable_group = "methanol-reactor",
        max_health = i * 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
        selection_box = {{-3, -3}, {3, 3}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"methanol"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/methanol-anim.png",
                        frame_count = 50,
                        line_length = 10,
                        width = 202,
                        height = 247,
                        animation_speed = 0.4,
                        shift = {0.15, -0.79}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/methanol-reactor/methanol-anim-mask.png",
                        frame_count = 50,
                        line_length = 10,
                        width = 202,
                        height = 247,
                        animation_speed = 0.4,
                        tint = py.tints[i],
                        shift = {0.15, -0.79},
                        draw_as_glow = true
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --North, left
            {
                production_type = "output",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-0.5, -2.5}, direction = defines.direction.north}}
            },
            --North, right
            {
                production_type = "output",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {0.5, -2.5}, direction = defines.direction.north}}
            },
            --South, left
            {
                production_type = "output",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {-0.5, 2.5}, direction = defines.direction.south}}
            },
            --South, right
            {
                production_type = "output",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {0.5, 2.5}, direction = defines.direction.south}}
            },
            --West, top
            {
                production_type = "input",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {-2.5, -0.5}, direction = defines.direction.west}}
            },
            --West, bottom
            {
                production_type = "input",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {-2.5, 0.5}, direction = defines.direction.west}}
            },
            --East, top
            {
                production_type = "input",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {2.5, -0.5}, direction = defines.direction.east}}
            },
            --East, bottom
            {
                production_type = "input",
                pipe_covers = pipe_covers,
                pipe_picture = pipe_picture,
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {2.5, 0.5}, direction = defines.direction.east}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/methanol-reactor.ogg"},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/methanol-reactor.ogg", volume = 0.3},
            apparent_volume = 2.5
        },
    }
end

RECIPE {
    type = "recipe",
    name = "methanol-reactor-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "methanol-reactor", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 25},
        {type = "item", name = "plastic-bar",      amount = 50},
        {type = "item", name = "nexelit-plate",    amount = 15},
        {type = "item", name = "engine-unit",      amount = 8},
        {type = "item", name = "duralumin",        amount = 20},
    },
    results = {
        {type = "item", name = "methanol-reactor-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "methanol-reactor-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "methanol-reactor-mk02", amount = 1},
        {type = "item", name = "processing-unit",       amount = 20},
        {type = "item", name = "niobium-plate",         amount = 30},
        {type = "item", name = "electric-engine-unit",  amount = 6},
        {type = "item", name = "titanium-plate",        amount = 30},
        {type = "item", name = "stainless-steel",       amount = 15},
        {type = "item", name = "nbti-alloy",            amount = 15},
    },
    results = {
        {type = "item", name = "methanol-reactor-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("methanol-reactor-mk03"):add_ingredient_unsafe {type = "item", name = "biopolymer", amount = 30}:add_ingredient_unsafe {type = "item", name = "carbon-nanotube", amount = 30}:add_ingredient_unsafe {type = "item", name = "aerogel", amount = 15}
end

RECIPE {
    type = "recipe",
    name = "methanol-reactor-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "methanol-reactor-mk03", amount = 1},
        {type = "item", name = "kevlar",                amount = 30},
        {type = "item", name = "nbfe-alloy",            amount = 15},
        {type = "item", name = "low-density-structure", amount = 10},
        {type = "item", name = "tin-plate",             amount = 30},
        {type = "item", name = "super-steel",           amount = 20},
        {type = "item", name = "super-alloy",           amount = 10},
        {type = "item", name = "science-coating",       amount = 1},
        {type = "item", name = "control-unit",          amount = 3},
    },
    results = {
        {type = "item", name = "methanol-reactor-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("methanol-reactor-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "nems", amount = 5}:add_ingredient_unsafe {type = "item", name = "graphene-roll", amount = 15}
end
