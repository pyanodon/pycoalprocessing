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
    type = "mining-drill",
    name = "borax-mine",
    icon = "__pycoalprocessing__/graphics/icons/borax-mine.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "borax-mine"},
    fast_replaceable_group = "borax-mine",
    max_health = 700,
    resource_categories = {"borax"},
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.1, -4.1}, {4.1, 4.1}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    input_fluid_box = {
        production_type = "input-output",
        pipe_picture = _G.assembler2pipepictures(),
        pipe_covers = _G.pipecoverspictures(),
        base_area = 1,
        height = 2,
        base_level = -1,
        pipe_connections = {
            {position = {-5, 0}},
            {position = {5, 0}},
            {position = {0, 5}}
        }
    },
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    mining_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02
    },
    energy_usage = "420kW",
    mining_power = 1,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, -4.65},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
    animations = {
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
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/borax-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/borax-mine.ogg", volume = 1.25},
        apparent_volume = 2.5
    }
}
