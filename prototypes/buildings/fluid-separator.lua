local Prototype = require("stdlib.prototype.prototype")

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "fluid-separator",
    energy_requiered = 15,
    enabled = false,
    ingredients =
    {
        {"storage-tank", 4},
        {"chemical-plant", 2}, --updated-bob electrolyser
        {"electronic-circuit", 15},
        {"pipe", 40},
        {"iron-gear-wheel", 15}, --updated-bob steel-bearing

    },
    result= "fluid-separator",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "fluid-separator",
    icon = "__pycoalprocessing__/graphics/icons/fluid-separator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[fluid-separator]",
    place_result = "fluid-separator",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "fluid-separator",
    icon = "__pycoalprocessing__/graphics/icons/fluid-separator.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "fluid-separator"},
    fast_replaceable_group = "fluid-separator",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.25, -3.25}, {3.25, 3.25}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fluid-separator"},
    crafting_speed = 1,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02,
    },
    energy_usage = "300kW",
    ingredient_count = 5,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/fluid-separator/fluid-separator.png",
        width = 248,
        height = 260,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.34, -0.57},
    },

    fluid_boxes =
    {
        --North
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {1.0, -4.0} }}
        },

        --North2
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {-1.0, -4.0} }}
        },

        --South
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00,-0.75}, nil, nil),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {1.0, 4.0} }}
        },
        --South2
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00,-0.75}, nil, nil),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-1.0, 4.0} }}
        },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/fluid-separator.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/fluid-separator.ogg", volume = 0.65 },
        apparent_volume = 1.2,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
