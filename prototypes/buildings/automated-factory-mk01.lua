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
        {"steel-plate", 20},
        {"steam-engine", 1},
        {"iron-gear-wheel", 20},
        {"fast-inserter", 3},
        {"advanced-circuit", 5}
    },
    results = {
        {"automated-factory-mk01", 1}
    }
}:add_unlock("advanced-electronics")

ITEM {
    type = "item",
    name = "automated-factory-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/automated-factory-mk01.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "c",
    place_result = "automated-factory-mk01",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "automated-factory-mk01",
    icon = "__pycoalprocessinggraphics__/graphics/icons/automated-factory-mk01.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "automated-factory-mk01"},
    fast_replaceable_group = "automated-factory",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"crafting", "crafting-with-fluid", "advanced-crafting"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "2MW",
    animation = {
        layers = {
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/mk01-left.png",
                width = 128,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {-1.5, -0.68},
                animation_speed = 0.5
            },
            {
                filename = "__pycoalprocessinggraphics__/graphics/entity/automated-factory/mk01-right.png",
                width = 116,
                height = 280,
                line_length = 16,
                frame_count = 101,
                shift = {2.31, -0.68},
                animation_speed = 0.5
            }
        }
    },
    fluid_boxes = {
        --1
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, 4.0}}}
        },
        {
            production_type = "input",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {0.0, -4.0}}}
        },
        {
            production_type = "output",
            pipe_picture = DATA.Pipes.pictures("assembling-machine-3", {0.3, 3.06}, {-0.00, -0.93}, {0.55, 0.15}, {-0.5, 0.15}, pipes),
            pipe_covers = DATA.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {2.0, 4.0}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 1.0},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/automated-factory.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
