local Prototype = require("stdlib.data.prototype")
local get_circuit_connector_sprites = _G.get_circuit_connector_sprites
local _TANK_SIZE = require("config")["TAILINGS_POND"]["TANK_SIZE"]

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
    subgroup = "py-fluid-handling",
    order = "t",
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
    fluid_box =
    {
        base_area = (_TANK_SIZE / 10),
        pipe_covers = Prototype.pipe_covers(true, true, true, true),
        pipe_connections = {
            {position = {0, -3}},
            {position = {0, 3}},
            {position = {3, 0}},
            {position = {-3, 0}},
        },
    },
    window_bounding_box = {{-2.4, -2.4},{2.4, 2.4}},
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
        fluid_background = Prototype.empty_sprite,
        window_background =
        {
            filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-empty-window-2.png",
            priority = "extra-high",
            width = 171,
            height = 185
        },
        flow_sprite = Prototype.empty_sprite,
        gas_flow = Prototype.empty_animation,
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
    type = "car",
    name = "tailings-pond-sprite",
    icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
    max_health = 100,
    energy_per_hit_point = 1,
    collision_box = {{-0.1, -.1}, {.1,.1}},
    collision_mask = {"floor-layer"},
    selectable_in_game = false,
    selection_box = {{0,0}, {0,0}},
    effectivity = 0.5,
    braking_power = "200kW",
    burner =
    {
        effectivity = 0.6,
        fuel_inventory_size = 1,
    },
    consumption = "0kW",
    friction = 2e-3,
    animation =
    {
        layers =
        {
            {
                width = 171,
                priority="extra-high",
                height = 185,
                frame_count = 1,
                direction_count = 30,
                shift = {0, 0},
                animation_speed = 0.1,
                max_advance = 0.2,
                stripes =
                {
                    {
                        filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-fluid-sheet2.png",
                        priority="extra-high",
                        width_in_frames = 10,
                        height_in_frames = 3,
                    },
                }
            },
        }
    },
    sound_minimum_speed = 1;
    rotation_speed = 0.015,
    inventory_size = 0
}

local entity_tailings_pond_spinner = {
    type = "beacon",
    name = "tailings-pond-spinner",
    icon = "__pycoalprocessing__/graphics/icons/tailings-spinner.png",
    max_health = 200,
    flags = {"not-blueprintable"},
    collision_box = entity_tailings_pond.collision_box,
    selectable_in_game = false,
    collision_mask = {"floor-layer"},
    allowed_effects = {"consumption", "speed", "pollution"},
    base_picture = Prototype.empty_sprite,
    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner.png",
        width = 29,
        height = 41,
        line_length = 0,
        frame_count = 50,
        shift = { -1.95, 1.71875},
        animation_speed = 0.25
    },
    animation_shadow =
    {
        filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner-shadow.png",
        width = 29,
        height = 41,
        line_length = 0,
        frame_count = 50,
        shift = { -1.140625, 1.484375},
        animation_speed = 0.25
    },
    radius_visualisation_picture = Prototype.empty_sprite,
    supply_area_distance = 0,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input"
    },
    energy_usage = "100W",
    distribution_effectivity = 0.00001,
    module_specification =
    {
        module_slots = 1,
        module_info_icon_shift = {0, 0.5},
        module_info_multi_row_initial_height_modifier = -0.3
    }
}

--Ignore this we are currently not using it.
--May change in the future though if we want to use tailings pond without power.
--Will also need to add a custom pole with no connection and 1x supply
local entity_tailings_pond_power_source = { --luacheck: ignore
    type = "electric-energy-interface",
    name = "tailings-pond-power-source",
    icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "tailings-pond"},
    order="z",
    max_health = 200,
    corpse = "small-remnants",
    collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
    selection_box = {{-0, -0}, {0, 0}},
    energy_source =
    {
        type = "electric",
        buffer_capacity = "1MJ",
        usage_priority = "terciary",
        input_flow_limit = "100kW",
        output_flow_limit = "100kW"
    },
    energy_production = "1000kW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    animations =
    {
        filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner.png",
        width = 29,
        height = 41,
        --line_length = 0,
        direction_count = 1,
        frame_count = 50,
        shift = { -2.0, 1.71875},
        animation_speed = 0.25
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound =
        {
            filename = "__base__/sound/accumulator-working.ogg",
            volume = 0
        },
        idle_sound = {
            filename = "__base__/sound/accumulator-idle.ogg",
            volume = 0
        },
        max_sounds_per_type = 5
    },
}

-------------------------------------------------------------------------------
--[[Extend Prototypes]]--

data:extend({
        recipe_tailings_pond, item_tailings_pond,
        entity_tailings_pond,
        entity_tailings_pond_sprite,
        entity_tailings_pond_spinner,
        --entity_tailings_pond_power_source,
        --entity_tailings_pond_pole,
    })
