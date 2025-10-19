local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/top.png",
        priority = "low",
        width = 224,
        height = 230
    },
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/bottom.png",
        priority = "extra-high",
        width = 224,
        height = 230
    },
    west = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/left.png",
        priority = "extra-high",
        width = 224,
        height = 230
    },
    east = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/right.png",
        priority = "extra-high",
        width = 224,
        height = 230
    }
}

local fluid_boxes

if mods.pyalienlife then
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {0.0, 3.0}, direction = defines.direction.south}}
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {0.0, -3.0}, direction = defines.direction.north}}
        },
        {
            production_type = "input",
            pipe_covers = py.pipe_covers(true, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {-3.0, 0.0}, direction = defines.direction.west}}
        },
        {
            production_type = "output",
            pipe_covers = py.pipe_covers(false, true, true, true),
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {3.0, 0.0}, direction = defines.direction.east}}
        },
    }
else
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {0.0, 3.0}, direction = defines.direction.south}}
        },
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-3", {-0.0, 3.837}, {-0.0, -3.837}, {4.0, 0.0}, {-4.0, 0.0}, pipes),
            pipe_covers = py.pipe_covers(true, true, true, true),
            volume = 1000,
            pipe_connections = {{flow_direction = "input", position = {0.0, -3.0}, direction = defines.direction.north}}
        },
    }
end

RECIPE {
    type = "recipe",
    name = "ralesia-plantation-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "soil",               amount = 300},
        {type = "item", name = "pipe",               amount = 15},
        {type = "item", name = "electronic-circuit", amount = 25},
        {type = "item", name = "stone",              amount = 100},
        {type = "item", name = "iron-plate",         amount = 30},
        {type = "item", name = "treated-wood",       amount = 50},
        {type = "item", name = "steam-engine",       amount = 1},
        {type = "item", name = "small-lamp",         amount = 20}
    },
    results = {
        {type = "item", name = "ralesia-plantation-mk01", amount = 1}
    }
}:add_unlock("ralesia")

if mods.pyrawores then
    RECIPE("ralesia-plantation-mk01"):replace_ingredient_unsafe("stone", "glass")
end

for i = 1, 4 do
    if not mods.pyalienlife and i == 2 then return end

    local name = "ralesia-plantation-mk0" .. i
    local icon = "__pycoalprocessinggraphics__/graphics/icons/" .. name .. ".png"
    local icon_size = 64

    ITEM {
        type = "item",
        name = name,
        icon = icon,
        icon_size = icon_size,
        flags = {},
        subgroup = "py-cp-buildings-mk0" .. i,
        order = "f",
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
        fast_replaceable_group = "ralesia-plantation",
        max_health = 300 * i,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"ralesia"},
        crafting_speed = 0.3 * i,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = {
                pollution = -5
            },
        },
        energy_usage = (400 * i) .. "kW",
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/ralesia-plantation.png",
                        width = 224,
                        height = 230,
                        frame_count = 50,
                        line_length = 8,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        shift = {0.0, -0.163}
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/ralesia-plantation/ralesia-plantation-mask.png",
                        width = 224,
                        height = 230,
                        frame_count = 50,
                        line_length = 8,
                        animation_speed = 0.5,
                        run_mode = "forward-then-backward",
                        shift = {0.0, -0.163},
                        tint = py.tints[i]
                    },
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = fluid_boxes,
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/ralesia-plantation.ogg", volume = 1.2},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/ralesia-plantation.ogg", volume = 0.3},
            apparent_volume = 2.5
        }
    }
end

RECIPE {
    type = "recipe",
    name = "ralesia-plantation-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ralesia-plantation-mk01", amount = 1},
        {type = "item", name = "plastic-bar",             amount = 50},
        {type = "item", name = "engine-unit",             amount = 2},
        {type = "item", name = "pump",                    amount = 4},
        {type = "item", name = "advanced-circuit",        amount = 15}
    },
    results = {
        {type = "item", name = "ralesia-plantation-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ralesia-plantation-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ralesia-plantation-mk02", amount = 1},
        {type = "item", name = "electric-engine-unit",    amount = 4},
        {type = "item", name = "niobium-plate",           amount = 20},
        {type = "item", name = "pipe",                    amount = 20},
        {type = "item", name = "processing-unit",         amount = 10}
    },
    results = {
        {type = "item", name = "ralesia-plantation-mk03", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "ralesia-plantation-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "ralesia-plantation-mk03", amount = 1},
        {type = "item", name = "low-density-structure",   amount = 10},
        {type = "item", name = "nbfe-alloy",              amount = 10},
        {type = "item", name = "kevlar",                  amount = 20},
    },
    results = {
        {type = "item", name = "ralesia-plantation-mk04", amount = 1}
    }
}
