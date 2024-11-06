RECIPE {
    type = "recipe",
    name = "cooling-tower-mk01",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "pipe",               amount = 20}, --bob copper-pipe
        {type = "item", name = "iron-gear-wheel",    amount = 15}, --bob brass-gear-wheel
        {type = "item", name = "iron-plate",         amount = 30} --bob brass-plate
    },
    results = {
        {type = "item", name = "cooling-tower-mk01", amount = 1}
    }
}:add_unlock("cooling-tower-1")

ITEM {
    type = "item",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk01.png",
    icon_size = 64,
    flags = {},
    subgroup = "coal-processing",
    order = "h",
    place_result = "cooling-tower-mk01",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/cooling-tower-mk01.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "cooling-tower-mk01"},
    fast_replaceable_group = "cooling-tower",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    forced_symmetry = "diagonal-pos",
    match_animation_speed_to_activity = false,
    fixed_recipe = "cooling-water",
    module_slots = 2,
    allowed_effects = {"speed", "consumption"},
    crafting_categories = {"cooling"},
    crafting_speed = 2,
    energy_source = {type = "void"},
    energy_usage = "50kW",
    graphics_set = {
        animation = {
            filename = "__pycoalprocessinggraphics__/graphics/entity/cooling-tower-mk01/cooling-tower-mk01.png",
            width = 113,
            height = 133,
            frame_count = 30,
            line_length = 10,
            animation_speed = 2,
            shift = {0.20, -0.4}
        },
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {-0.0, -0.9}, nil, nil),
            pipe_covers = py.pipe_covers(false, true, true, true),
            volume = 1000,
            base_level = -1,
            pipe_connections = {{flow_direction = "input", position = {1.0, 0.0}, direction = defines.direction.east}}
        },
        {
            production_type = "output",
            pipe_picture = py.pipe_pictures("assembling-machine-2", nil, {-0.0, -0.9}, nil, nil),
            pipe_covers = py.pipe_covers(false, true, true, true),
            volume = 100,
            pipe_connections = {{flow_direction = "output", position = {-1.0, 0.0}, direction = defines.direction.west}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact-1.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/cooling-tower-mk01.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
