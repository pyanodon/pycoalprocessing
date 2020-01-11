RECIPE {
    type = "recipe",
    name = "cooling-tower-mk01",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {"electronic-circuit", 5},
        {"pipe", 20}, --bob copper-pipe
        {"iron-gear-wheel", 15}, --bob brass-gear-wheel
        {"iron-plate", 30} --bob brass-plate
    },
    results = {
        {"cooling-tower-mk01", 1}
    }
}:add_unlock("cooling-tower-1")

ITEM {
    type = "item",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk01.png",
    icon_size = 32,
    flags = {},
    subgroup = "coal-processing",
    order = "h",
    place_result = "cooling-tower-mk01",
    stack_size = 5
}

ENTITY {
    type = "assembling-machine",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk01.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "cooling-tower-mk01"},
    fast_replaceable_group = "cooling-tower-mk01",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    match_animation_speed_to_activity = false,
    fixed_recipe = "cooling-water",
    module_specification = {
        module_slots = 0
    },
    allowed_effects = {"speed"},
    crafting_categories = {"cooling"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "50kW",
    ingredient_count = 20,
    animation = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/cooling-tower-mk01/cooling-tower-mk01.png",
        width = 113,
        height = 133,
        frame_count = 30,
        line_length = 10,
        animation_speed = 2,
        shift = {0.20, -0.4}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {-0.0, -0.9}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {2.0, 0.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-2", nil, {-0.0, -0.9}, nil, nil),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {-2.0, 0.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg", volume = 0.35},
        apparent_volume = 2.5
    }
}
