local pipes = {
    south = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/south.png",
        priority = "extra-high",
        width = 168,
        height = 194
    }
}

RECIPE {
    type = "recipe",
    name = "evaporator",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"gasturbinemk01", 1},
        {"chemical-plant", 1},
        {"electronic-circuit", 10},
        {"steel-plate", 40}, --bob lead-plate
        {"iron-plate", 40}, --bob steel-gear-wheel
        {"iron-gear-wheel", 15} --bob steel-bearing
    },
    results = {
        {"evaporator", 1}
    }
}:add_unlock("separation")

ITEM {
    type = "item",
    name = "evaporator",
    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "l",
    place_result = "evaporator",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "evaporator",
    icon = "__pycoalprocessinggraphics__/graphics/icons/evaporator.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "evaporator"},
    fast_replaceable_group = "evaporator",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.48, -2.48}, {2.48, 2.48}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"evaporator"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "500kW",
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-off.png",
        width = 168,
        height = 177,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.1, 0.0}
    },
    working_visualisations = {
        {
            north_position = {0.1, -0.0},
            west_position = {0.1, -0.0},
            south_position = {0.1, -0.0},
            east_position = {0.1, -0.0},
            animation = {
                filename = "__pycoalprocessinggraphics__/graphics/entity/evaporator/evaporator-anim.png",
                frame_count = 80,
                line_length = 10,
                width = 168,
                height = 177,
                animation_speed = 0.25
            }
        }
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.0, 0.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 3.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-3.0, 0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", {0.06, 0.48}, {0.12, -3.0}, nil, nil, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {0.0, -3.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/evaporator.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
