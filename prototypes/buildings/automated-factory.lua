local pipes = {
    north = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/top-conection.png",
        priority = "extra-high",
        width = 244,
        height = 280
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "steel-plate",      amount = 20},
        {type = "item", name = "steam-engine",     amount = 1},
        {type = "item", name = "iron-gear-wheel",  amount = 20},
        {type = "item", name = "fast-inserter",    amount = 3},
        {type = "item", name = "advanced-circuit", amount = 5}
    },
    results = {
        {type = "item", name = "automated-factory-mk01", amount = 1}
    }
}:add_unlock("advanced-circuit")

if mods["pyrawores"] then
    RECIPE("automated-factory-mk01"):replace_ingredient("advanced-circuit", "electronic-circuit"):remove_unlock("advanced-circuit"):add_unlock("fast-inserter")
end

if mods.pyhightech then
    RECIPE("automated-factory-mk01"):replace_ingredient("advanced-circuit", "electronic-circuit")
end

for i = 1, 4 do
    if not mods.pyrawores and i == 2 then return end

    local name = "automated-factory-mk0" .. i
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
        fast_replaceable_group = "automated-factory",
        max_health = 800 * i,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
        selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
        forced_symmetry = "diagonal-pos",
        module_slots = i,
        allowed_effects = {"speed", "productivity", "consumption", "pollution", "quality"},
        crafting_categories = {"crafting", "crafting-with-fluid", "advanced-crafting"},
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
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/mk0" .. i .. "-left.png",
                        width = 128,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {-1.5, -0.68},
                        animation_speed = 0.5,
                    },
                    {
                        filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/mk0" .. i .. "-right.png",
                        width = 116,
                        height = 280,
                        line_length = 16,
                        frame_count = 101,
                        shift = {2.31, -0.68},
                        animation_speed = 0.5,
                    }
                }
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        fluid_boxes = {
            --1
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, 3.0}, direction = defines.direction.south}}
            },
            {
                production_type = "input",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 1000,
                pipe_connections = {{flow_direction = "input", position = {0.0, -3.0}, direction = defines.direction.north}}
            },
            {
                production_type = "output",
                pipe_picture = py.pipe_pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
                pipe_covers = py.pipe_covers(false, true, true, true),
                volume = 100,
                pipe_connections = {{flow_direction = "output", position = {2.0, 3.0}, direction = defines.direction.south}}
            },
        },
        impact_category = "metal",
        working_sound = {
            sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 1.0},
            idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 0.3},
            apparent_volume = 2.5
        }
    }
end

RECIPE {
    type = "recipe",
    name = "automated-factory-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "automated-factory-mk01", amount = 1},
        {type = "item", name = "assembling-machine-1",   amount = 2},
        {type = "item", name = "plastic-bar",            amount = 20},
        {type = "item", name = "fast-inserter",          amount = 4},
        {type = "item", name = "engine-unit",            amount = 4},
        {type = "item", name = "advanced-circuit",       amount = 15},
        {type = "item", name = "duralumin",              amount = 30},
        {type = "item", name = "stainless-steel",        amount = 20},
    },
    results = {
        {type = "item", name = "automated-factory-mk02", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "automated-factory-mk03",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "automated-factory-mk02", amount = 1},
        {type = "item", name = "bulk-inserter",          amount = 4},
        {type = "item", name = "electric-engine-unit",   amount = 4},
        {type = "item", name = "niobium-plate",          amount = 25},
        {type = "item", name = "processing-unit",        amount = 10},
        {type = "item", name = "titanium-plate",         amount = 30},
        {type = "item", name = "super-steel",            amount = 30},
        {type = "item", name = "nbti-alloy",             amount = 20},
        {type = "item", name = "py-heat-exchanger",      amount = 1}
    },
    results = {
        {type = "item", name = "automated-factory-mk03", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("automated-factory-mk03"):add_ingredient_unsafe {type = "item", name = "paramagnetic-material", amount = 25}:add_ingredient_unsafe {type = "item", name = "volumetric-capacitor", amount = 10}:add_ingredient_unsafe {type = "item", name = "biopolymer", amount = 10}
end

RECIPE {
    type = "recipe",
    name = "automated-factory-mk04",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "automated-factory-mk03", amount = 1},
        {type = "item", name = "low-density-structure",  amount = 10},
        {type = "item", name = "nbfe-alloy",             amount = 10},
        {type = "item", name = "lead-plate",             amount = 10},
        {type = "item", name = "super-alloy",            amount = 30},
        {type = "item", name = "wall-shield",            amount = 5},
        {type = "item", name = "science-coating",        amount = 2},
        {type = "item", name = "control-unit",           amount = 5}

    },
    results = {
        {type = "item", name = "automated-factory-mk04", amount = 1}
    }
}

if mods.pyhightech then
    RECIPE("automated-factory-mk04"):replace_ingredient_unsafe("control-unit", "intelligent-unit"):add_ingredient_unsafe {type = "item", name = "superconductor-servomechanims", amount = 5}:add_ingredient_unsafe {type = "item", name = "quantum-vortex-storage-system", amount = 4}
end
