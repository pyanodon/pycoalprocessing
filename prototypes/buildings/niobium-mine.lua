RECIPE {
    type = "recipe",
    name = "niobium-mine",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"electric-mining-drill", 5},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 30}, --bob basic-electronic-circuit-board
        {"steel-plate", 30}, --bob titanium-plate
        {"iron-gear-wheel", 15} --bob titanium-bearing
    },
    results = {
        {"niobium-mine", 1}
    }
}:add_unlock("coal-processing-2")

ITEM {
    type = "item",
    name = "niobium-mine",
    icon = "__pycoalprocessinggraphics__/graphics/icons/niobium-mine.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-extraction",
    order = "e",
    place_result = "niobium-mine",
    stack_size = 10
}

ENTITY {
    type = "mining-drill",
    name = "niobium-mine",
    icon = "__pycoalprocessinggraphics__/graphics/icons/niobium-mine.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "niobium-mine"},
    fast_replaceable_group = "niobium-mine",
    max_health = 700,
    resource_categories = {"niobium"},
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    input_fluid_box = {
        production_type = "input-output",
        pipe_picture = _G.assembler2pipepictures(),
        pipe_covers = _G.pipecoverspictures(),
        base_area = 1,
        height = 2,
        base_level = -1,
        pipe_connections = {
            {position = {-3, 4}}
        }
    },
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    mining_speed = 1,
    energy_source = {
        type = "burner",
        fuel_category = "drill",
        effectivity = 4,
        fuel_inventory_size = 1,
        emissions_per_minute = 0.06,
        smoke = {
            {
                name = "smoke",
                deviation = {0.1, 0.1},
                frequency = 3
            }
        }
    },
    energy_usage = "550kW",
    mining_power = 3,
    resource_searching_radius = 5.49,
    vector_to_place_result = {0, -3.65},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
    animations = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/niobium-bottom.png",
                width = 221,
                height = 113,
                line_length = 8,
                frame_count = 136,
                animation_speed = 0.2,
                shift = {-0.07, 1.765}
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/niobium-top.png",
                width = 221,
                height = 113,
                line_length = 8,
                frame_count = 136,
                animation_speed = 0.2,
                shift = {-0.07, -1.765}
            }
        }
    },
    input_fluid_patch_sprites = {
        north = {
            priority = "extra-high",
            filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/N.png",
            line_length = 1,
            width = 231,
            height = 237,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(3, 0)
        },
        east = {
            priority = "extra-high",
            filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/E.png",
            line_length = 1,
            width = 231,
            height = 237,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(3, 3)
        },
        south = {
            priority = "extra-high",
            filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/S.png",
            line_length = 1,
            width = 231,
            height = 237,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(3, 0)
        },
        west = {
            priority = "extra-high",
            filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/W.png",
            line_length = 1,
            width = 231,
            height = 237,
            frame_count = 1,
            direction_count = 1,
            shift = util.by_pixel(4, 3)
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
