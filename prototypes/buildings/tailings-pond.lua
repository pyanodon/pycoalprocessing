local Pipes = require("stdlib.data.pipes")

local function make_tailings_variants()
    local pictures = {}
    for y = 0, 555 - 185, 185 do
        for x = 0, 1710 - 171, 171 do
            pictures[#pictures + 1] = {
                filename = "__pycoalprocessing__/graphics/entity/tailings-pond/fluid-sheet.png",
                priority = "extra-high",
                width = 171,
                height = 185,
                x = x,
                y = y
            }
        end
    end
    return pictures
end

local recipe_tailings_pond = {
    type = "recipe",
    name = "tailings-pond",
    enabled = "true",
    ingredients = {
        {"pipe", 10},
        {"iron-plate", 10},
        {"stone-brick", 100}
    },
    result = "tailings-pond"
}

local item_tailings_pond = {
    type = "item",
    name = "tailings-pond",
    icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "z",
    place_result = "tailings-pond",
    stack_size = 50
}

local entity_tailings_pond = {
    type = "storage-tank",
    name = "tailings-pond",
    icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 3, result = "tailings-pond"},
    max_health = 500,
    corpse = "big-remnants",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    two_direction_only = true,
    fluid_box = {
        base_area = (100000 / 100),
        pipe_covers = Pipes.covers(true, true, true, true),
        pipe_connections = {
            {position = {0, -3}},
            {position = {0, 3}},
            {position = {3, 0}},
            {position = {-3, 0}}
        }
    },
    window_bounding_box = {{-2.4, -2.4}, {2.4, 2.4}},
    pictures = {
        picture = {
            sheet = {
                filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-frame.png",
                priority = "high",
                frames = 1,
                width = 171,
                height = 185
            }
        },
        fluid_background = Pipes.empty_sprite(),
        window_background = {
            filename = "__pycoalprocessing__/graphics/entity/tailings-pond/window-background.png",
            priority = "low",
            width = 171,
            height = 185
        },
        flow_sprite = Pipes.empty_sprite(),
        gas_flow = Pipes.empty_animation()
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {
            filename = "__base__/sound/storage-tank.ogg",
            volume = 0.8
        },
        apparent_volume = 1.5,
        max_sounds_per_type = 3
    },
    circuit_wire_connection_points = {
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        }
    },
    circuit_connector_sprites = nil,
    circuit_wire_max_distance = 9
}

if _G.get_circuit_connector_sprites then
    entity_tailings_pond.circuit_connector_sprites = {
        _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0)
    }
else
    --entity_tailings_pond.circuit_connector_sprites = _G.circuit_connector_definitions["storage-tank"].sprites
    entity_tailings_pond.circuit_connector_sprites = {
        _G.make_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.make_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.make_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        _G.make_circuit_connector_sprites({2.546875, -2.4375}, nil, 0)
    }
end

local entity_tailings_pond_sprite = {
    type = "simple-entity-with-force",
    name = "tailings-pond-sprite",
    selectable_in_game = false,
    render_layer = "object",
    flags = {"not-blueprintable", "not-deconstructable", "placeable-off-grid"},
    max_health = 100,
    collision_box = nil,
    collision_mask = {},
    pictures = make_tailings_variants()
}

data:extend {
    recipe_tailings_pond,
    item_tailings_pond,
    entity_tailings_pond,
    entity_tailings_pond_sprite
}
