local pipe_left = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-left.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_mid = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-mid.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-right.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

Recipe {
    type = "recipe",
    name = "power-house",
    energy_required = 17,
    enabled = false,
    ingredients = {
        {"gasturbinemk01", 1},
        {"electronic-circuit", 25},
        {"steel-plate", 20},
        {"iron-gear-wheel", 15}, --bob steel-bearing
        {"iron-plate", 30} --bob lead-plate
    },
    results = {
      {"power-house", 1}
    },
}

Item {
    type = "item",
    name = "power-house",
    icon = "__pycoalprocessing__/graphics/icons/power-house.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "t",
    place_result = "power-house",
    stack_size = 5
}

Entity {
    type = "assembling-machine",
    name = "power-house",
    icon = "__pycoalprocessing__/graphics/icons/power-house.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "power-house"},
    fast_replaceable_group = "power-house",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification = {
        module_slots = 5
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"combustion"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2
    },
    energy_usage = "200kW",
    ingredient_count = 4,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/power-house/powerhouse-anim.png",
        width = 233,
        height = 234,
        frame_count = 30,
        line_length = 6,
        animation_speed = 0.7,
        shift = {0.156, -0.165}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = Data.Pipes.pictures("assembling-machine-2", {-0.1, 1.1}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_left),
            pipe_covers = Data.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-1.0, -3.9}}}
        },
        {
            production_type = "input",
            pipe_picture = Data.Pipes.pictures("assembling-machine-2", {0.1, 1.1}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_mid),
            pipe_covers = Data.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -3.9}}}
        },
        {
            production_type = "input",
            pipe_covers = Data.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Data.Pipes.pictures("assembling-machine-2", {-0, 1.1}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_right),
            pipe_connections = {{type = "input", position = {1.0, -3.9}}}
        },
        {
            production_type = "output",
            pipe_covers = Data.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = Data.Pipes.pictures("assembling-machine-2", {-0.1, 1.1}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_left),
            pipe_connections = {{type = "output", position = {-1.0, 3.9}}}
        },
        {
            production_type = "output",
            pipe_picture = Data.Pipes.pictures("assembling-machine-2", {0.1, 1.1}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_mid),
            pipe_covers = Data.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {1.0, 3.9}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/power-house.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/power-house.ogg", volume = 0.65},
        apparent_volume = 2.5
    }
}
