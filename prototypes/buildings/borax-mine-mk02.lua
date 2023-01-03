RECIPE {
    type = "recipe",
    name = "borax-mine-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"borax-mine", 1},
        {"advanced-circuit", 25},
        {"plastic-bar", 50},
        {"nexelit-plate", 15},
        {"engine-unit", 3},
        {"fast-transport-belt", 30}
    },
    results = {
        {"borax-mine-mk02", 1}
    }
}

ITEM {
    type = "item",
    name = "borax-mine-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/borax-mine-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-cp-buildings-mk02",
    order = "a",
    place_result = "borax-mine-mk02",
    stack_size = 10
}

-- Base graphics
local dry_graphics = {
    layers = {
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/borax-mine/bottom-borax-mk02.png",
            width = 288,
            height = 144,
            line_length = 7,
            frame_count = 90,
            animation_speed = 0.1,
            shift = {0.0, 2.25}
        },
        {
            filename = "__pycoalprocessinggraphics__/graphics/entity/borax-mine/top-borax-mk02.png",
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
    name = "borax-mine-mk02",
    icon = "__pycoalprocessinggraphics__/graphics/icons/borax-mine-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "borax-mine-mk02"},
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
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity"},
    mining_speed = 3,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 0.06,
    },
    energy_usage = "550kW",
    mining_power = 2,
    resource_searching_radius = 5.49,
    vector_to_place_result = {0, -4.65},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
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
