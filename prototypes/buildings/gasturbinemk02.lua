local Prototype = require("stdlib.data.prototype")

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "gasturbinemk02",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"advanced-circuit", 20},
        {"pipe", 20}, --updated-bob bronze-pipe
        {"steel-plate", 50},
        {"iron-plate", 30}, --updated-bob invar-alloy
        {"iron-gear-wheel", 40},
    },
    result= "gasturbinemk02",
    --icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "gasturbinemk02",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-power",
    order = "a-d[gasturbinemk02]",
    place_result = "gasturbinemk02",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "generator",
    name = "gasturbinemk02",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk02.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk02"},
    max_health = 500,
    corpse = "big-remnants",
    effectivity = 4,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    resistances =
    {
        {
            type = "fire",
            percent = 70
        }
    },
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    fluid_input = {
        name = "water",
        amount = 0.0,
        minimum_temperature = 100.0
    },
    fluid_box ={
        base_area = 1,
        base_level = -1,
        pipe_covers = Prototype.pipe_covers(false, true, true, true),
        pipe_connections =
        {
            { position = {4.0, 0.0} },
            { position = {-4.0, 0.0} },
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
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-vertical-anim.png",
        width = 238,
        height = 249,
        frame_count = 16,
        line_length = 4,
        --animation_speed = 0.5,
        shift = {0.195, -0.239},
    },
    vertical_animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk02/gas-turbine-mk02-horizontal-anim.png",
        width = 238,
        height = 244,
        frame_count = 16,
        line_length = 4,
        --animation_speed = 0.5,
        shift = {0.155, -0.325},
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
        sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk02.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk02.ogg", volume = 0.65 },
        apparent_volume = 2.5,
    }
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
