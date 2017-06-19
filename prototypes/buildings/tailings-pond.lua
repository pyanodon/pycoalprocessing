local Prototype = require("stdlib.prototype.prototype")
local get_circuit_connector_sprites = _G.get_circuit_connector_sprites
local _TANK_SIZE = require("config")["TAILINGS_POND"]["TANK_SIZE"]

-------------------------------------------------------------------------------
--[[Helpers]]--
-------------------------------------------------------------------------------
local function make_tailings_variants()
    local pictures = {}
    for y=0, 555-185, 185 do
        for x=0, 1710-171, 171 do
            pictures[#pictures + 1] = {
                filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-fluid-sheet2.png",
                priority="extra-high",
                width = 171,
                height = 185,
                x=x,
                y=y,
                shift = {-0.5, -0.5}
            }
        end
    end
    return pictures
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe_tailings_pond = {
    type = "recipe",
    name = "tailings-pond",
    enabled = "true",
    ingredients =
    {
        {"pipe", 10},
        {"iron-plate", 10},
        {"stone-brick", 100}
    },
    result = "tailings-pond"
}

-------------------------------------------------------------------------------
--[[Items]]--
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

-------------------------------------------------------------------------------
--[[Entities]]--
local entity_tailings_pond =
{
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
    fluid_box =
    {
        base_area = (_TANK_SIZE / 100),
        pipe_covers = Prototype.Pipes.covers(true, true, true, true),
        pipe_connections = {
            {position = {0, -3}},
            {position = {0, 3}},
            {position = {3, 0}},
            {position = {-3, 0}},
        },
    },
    window_bounding_box = {{-2.4, -2.4}, {2.4, 2.4}},
    pictures =
    {
        picture =
        {
            sheet =
            {
                filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-mask-2.png",
                priority = "high",
                frames = 1,
                width = 171,
                height = 185,
                shift = {0, 0}
            }
        },
        fluid_background = Prototype.empty_sprite(),
        window_background =
        {
            filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-empty-window-2.png",
            priority = "low",
            width = 171,
            height = 185,
            shift = {.265, .5}
        },
        flow_sprite = Prototype.empty_sprite(),
        gas_flow = Prototype.empty_animation(),
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = {
            filename = "__base__/sound/storage-tank.ogg",
            volume = 0.8
        },
        apparent_volume = 1.5,
        max_sounds_per_type = 3
    },
    circuit_wire_connection_points =
    {
        {
            shadow = { red = {0, 0}, green = {0,0}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = { red = {0, 0}, green = {0,0}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = { red = {0, 0}, green = {0,0}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = { red = {0, 0}, green = {0,0}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        }
    },
    circuit_connector_sprites =
    {
        get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
        get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
    },
    circuit_wire_max_distance = 8.5
}

local entity_tailings_pond_sprite =
{
    type = "simple-entity-with-force",
    name = "tailings-pond-sprite",
    selectable_in_game = false,
    render_layer = "object",
    flags = {"not-blueprintable", "not-deconstructable"},
    max_health = 100,
    collision_box = nil,
    collision_mask = {},
    pictures = make_tailings_variants()
}

-------------------------------------------------------------------------------
--[[Extend Prototypes]]--
data:extend{
    recipe_tailings_pond, item_tailings_pond,
    entity_tailings_pond,
    entity_tailings_pond_sprite,
}
