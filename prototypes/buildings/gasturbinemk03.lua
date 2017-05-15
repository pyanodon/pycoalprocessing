local Prototype = require("stdlib.data.prototype")

local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/soil-extractormk01/long-pipe-north.png",
            priority = "low",
            width = 30,
            height = 44,
            shift = shift_north
        }
    else
        north = Prototype.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-S.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_south
        }
    else
        south = Prototype.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_west
        }
    else
        west = Prototype.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_east
        }
    else
        east = Prototype.empty_sprite
    end
    return {north=north, south=south, west=west, east=east}
end
-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "gasturbinemk03",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"processing-unit", 20},
        {"pipe", 20}, --updated-bob bronze-pipe
        {"nexelit-plate", 50},
        {"iron-plate", 70}, --updated-bob invar-alloy
        {"gasturbinemk02", 2},
    },
    result= "gasturbinemk03",
    --icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk03.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "gasturbinemk03",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk03.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-power",
    order = "a-d[gasturbinemk03]",
    place_result = "gasturbinemk03",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "generator",
    name = "gasturbinemk03",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk03"},
    max_health = 500,
    corpse = "big-remnants",
    effectivity = 5,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    resistances =
    {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-4.4, -4.4}, {4.4, 4.4}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    fluid_input = {
        name = "water",
        amount = 0.0,
        minimum_temperature = 100.0
    },
    fluid_box ={
        base_area = 1,
        base_level = -1,
        pipe_covers = Prototype.pipe_covers(false, true, false, false),
        pipe_picture=pipe_pictures({0,0}, {0,0}, {0,0}, {0,0}),
        pipe_connections =
        {
            { position = {4.9, 0.0} },
            { position = {-4.9, 0.0} },
        },
    },

    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-output",
        emissions = 0.04,
    },
    --scale=1.75,
    horizontal_animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-horizontal.png",
        width = 288,
        height = 344,
        frame_count = 31,
        line_length = 7,
        --animation_speed = 0.5,
        shift = {-0.05, -0.84},
    },
    vertical_animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk03/gas-turbine-mk03-vertical.png",
        width = 288,
        height = 344,
        frame_count = 31,
        line_length = 7,
        --animation_speed = 0.5,
        shift = {0.0, -0.82},
    },

    smoke =
    {
        {
            name = "light-smoke",
            north_position = {-0.312, -2.93},
            east_position = {-1.5, -2},
            frequency = 5 / 32,
            starting_vertical_speed = 0.08,
            slow_down_factor = 1,
            starting_frame_deviation = 60
        },
    },
    min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.3,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk03.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk03.ogg", volume = 2.3 },
        apparent_volume = 2.3,
    }
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
