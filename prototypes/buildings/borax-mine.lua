local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/borax-mine/top-connection.png",
        priority = "low",
        width = 288,
        height = 288
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/borax-mine/bottom-connection.png",
        priority = "extra-high",
        width = 288,
        height = 288
    },
    west = {
        filename = "__pycoalprocessing__/graphics/entity/borax-mine/left-connection.png",
        priority = "extra-high",
        width = 288,
        height = 288
    },
    east = {
        filename = "__pycoalprocessing__/graphics/entity/borax-mine/right-connection.png",
        priority = "extra-high",
        width = 288,
        height = 288
    }
}

RECIPE {
    type = "recipe",
    name = "borax-mine",
    energy_required = 25,
    enabled = false,
    ingredients = {
        {"electric-mining-drill", 2},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 20}, --bob basic-electronic-circuit-board
        {"steel-plate", 150},
        {"iron-gear-wheel", 15}, --bob steel-bearing
        {"transport-belt", 30}
    },
    results = {
      {"borax-mine", 1}
    }
}

ITEM {
    type = "item",
    name = "borax-mine",
    icon = "__pycoalprocessing__/graphics/icons/borax-mine.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "py-extraction",
    order = "a",
    place_result = "borax-mine",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "borax-mine",
    icon = "__pycoalprocessing__/graphics/icons/borax-mine.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "borax-mine"},
    fast_replaceable_group = "borax-mine",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.1, -4.1}, {4.1, 4.1}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"borax"},
    crafting_speed = 0.3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01 / 2
    },
    energy_usage = "420kW",
    ingredient_count = 4,
    animation = {
        layers = {
            {
                filename = "__pycoalprocessing__/graphics/entity/borax-mine/bottom-borax.png",
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.9,
                shift = {0.0, 2.25}
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/borax-mine/top-borax.png",
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.9,
                shift = {0.0, -2.25}
            }
        }
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {-0.0, 4.9}, {-0.0, -4.9}, {4.9, 0.0}, {-4.9, 0.0}, pipes),
            pipe_covers = DATA.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 5.0}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/borax-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/borax-mine.ogg", volume = 1.25},
        apparent_volume = 2.5
    }
}
