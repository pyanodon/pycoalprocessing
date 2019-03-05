RECIPE {
    type = "recipe",
    name = "ground-borer",
    energy_required = 15,
    enabled = false,
    ingredients = {
        {"electric-mining-drill", 3},
        {"soil-extractormk01", 2},
        {"electronic-circuit", 30},
        {"iron-plate", 150}, --bob titanium-plate
        {"iron-gear-wheel", 15} --bob titanium-bearing
    },
    results = {
        {"ground-borer", 1}
    }
}:add_unlock("excavation-1")

ITEM {
    type = "item",
    name = "ground-borer",
    icon = "__pycoalprocessing__/graphics/icons/ground-borer.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-extraction",
    order = "c",
    place_result = "ground-borer",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "ground-borer",
    icon = "__pycoalprocessing__/graphics/icons/ground-borer.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "ground-borer"},
    fast_replaceable_group = "ground-borer",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"ground-borer"},
    crafting_speed = 0.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.06
    },
    energy_usage = "420kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/ground-borer/ground-borer.png",
        width = 307,
        height = 311,
        line_length = 6,
        frame_count = 30,
        animation_speed = 0.8,
        shift = {0.2, -0.03}
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 5.0}}}
        },
        --2
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.70}, nil, nil),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -5.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/ground-borer.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/ground-borer.ogg", volume = 0.75},
        apparent_volume = 2.5
    }
}
