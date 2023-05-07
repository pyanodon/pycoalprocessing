RECIPE {
    type = "recipe",
    name = "borax-mine",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"electric-mining-drill", 1},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 20},
        {"iron-gear-wheel", 15},
        {"transport-belt", 20}
    },
    results = {
        {"borax-mine", 1}
    }
}:add_unlock('energy-1')

ITEM {
    type = "item",
    name = "borax-mine",
    icon = "__pycoalprocessinggraphics__/graphics/icons/borax-mine.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk01",
    order = "a",
    place_result = "borax-mine",
    stack_size = 10
}

-- Base graphics
local dry_graphics = {
    layers = {
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/borax-mine/bottom-borax.png",
            width = 288,
            height = 144,
            line_length = 7,
            frame_count = 90,
            animation_speed = 0.1,
            shift = {0.0, 2.25}
        },
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/borax-mine/top-borax.png",
            width = 288,
            height = 144,
            line_length = 7,
            frame_count = 90,
            animation_speed = 0.1,
            shift = {0.0, -2.25}
        }
    }
}
-- Start w/ empty table
local wet_graphics = {}
-- Insert, and follow by adding in the appropriate pipe graphics
for abbreviation, direction in pairs({N='north',E='east',S='south',W='west'}) do
    wet_graphics[direction] = util.copy(dry_graphics)
    wet_graphics[direction].layers[3] = {
        priority = "extra-high",
        filename = "__pycoalprocessinggraphics__/graphics/entity/borax-mine/" .. abbreviation .. ".png",
        line_length = 1,
        width = 288,
        height = 288,
        frame_count = 1,
        repeat_count = 90,
        direction_count = 1,
        shift = util.by_pixel(0, 0.0)
    }
end

ENTITY {
    type = "mining-drill",
    name = "borax-mine",
    icon = "__pycoalprocessinggraphics__/graphics/icons/borax-mine.png",
    icon_size = 64,
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
        module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity"},
    mining_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "420kW",
    resource_searching_radius = 5.49,
    vector_to_place_result = {0, -4.65},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
    circuit_wire_connection_points = circuit_connector_definitions["borax-mine-mkxx"].points,
    circuit_connector_sprites = circuit_connector_definitions["borax-mine-mkxx"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    graphics_set = {
        animation = dry_graphics
    },
    wet_mining_graphics_set = {
        animation = wet_graphics
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/borax-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/borax-mine.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
