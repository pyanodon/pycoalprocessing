RECIPE {
    type = "recipe",
    name = "niobium-mine",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "electric-mining-drill", amount = 5},
        {type = "item", name = "soil-extractor-mk01",   amount = 1},
        {type = "item", name = "electronic-circuit",    amount = 30},
        {type = "item", name = "steel-plate",           amount = 30},
        {type = "item", name = "iron-gear-wheel",       amount = 15}
    },
    results = {
        {type = "item", name = "niobium-mine", amount = 1}
    }
}:add_unlock("niobium")

ITEM {
    type = "item",
    name = "niobium-mine",
    icon = "__pycoalprocessinggraphics__/graphics/icons/niobium-mine.png",
    icon_size = 64,
    flags = {},
    subgroup = "coal-processing",
    order = "e",
    place_result = "niobium-mine",
    stack_size = 10
}

-- Base graphics
local dry_graphics = {
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
}
-- Start w/ empty table
local wet_graphics = {}
-- Offsets here vary by direction so we use a LUT
local pixel_offsets = {
    N = util.by_pixel(3, 0),
    E = util.by_pixel(3, 3),
    S = util.by_pixel(3, 0),
    W = util.by_pixel(4, 3)
}
-- Insert, and follow by adding in the appropriate pipe graphics
for abbreviation, direction in pairs {N = "north", E = "east", S = "south", W = "west"} do
    wet_graphics[direction] = util.copy(dry_graphics)
    wet_graphics[direction].layers[3] = {
        priority = "extra-high",
        filename = "__pycoalprocessinggraphics__/graphics/entity/niobium-mine/" .. abbreviation .. ".png",
        line_length = 1,
        width = 231,
        height = 237,
        frame_count = 1,
        repeat_count = 136,
        direction_count = 1,
        shift = pixel_offsets[abbreviation]
    }
end

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
        pipe_picture = _G.assembler2pipepictures(),
        pipe_covers = _G.pipecoverspictures(),
        volume = 200,
        pipe_connections = {
            {direction = defines.direction.south, position = {-3, 3}}
        }
    },
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity"},
    mining_speed = 1,
    energy_source = {
        type = "burner",
        fuel_categories = {"drill"},
        effectivity = 4,
        fuel_inventory_size = 1,
        emissions_per_minute = {
            pollution = 1
        },
        smoke = {
            {
                name = "smoke",
                deviation = {0.1, 0.1},
                frequency = 3
            }
        }
    },
    energy_usage = "550kW",
    resource_searching_radius = 5.49,
    vector_to_place_result = {0, -3.65},
    radius_visualisation_picture = {
        filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
        width = 12,
        height = 12
    },
    circuit_connector = circuit_connector_definitions["niobium-mine"],
    circuit_wire_max_distance = _G.default_circuit_wire_max_distance,
    graphics_set = {
        animation = dry_graphics
    },
    wet_mining_graphics_set = {
        animation = wet_graphics
    },
    impact_category = "metal-large",
    working_sound = {
        sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg"},
        idle_sound = {filename = "__pycoalprocessinggraphics__/sounds/niobium-mine.ogg", volume = 0.3},
        apparent_volume = 2.5
    }
}
