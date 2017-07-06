local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/top.png",
        priority = "low",
        width = 260,
        height = 254,
    },
    south =
    {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/bottom.png",
        priority = "extra-high",
        width = 260,
        height = 254,
    },
    west =
    {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/left.png",
        priority = "very-low",
        width = 260,
        height = 254,
    },
    east =
    {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/right.png",
        priority = "extra-high",
        width = 260,
        height = 254,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "botanical-nursery",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
        {"electric-mining-drill", 1},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 5}, --updated-bob basic-electronic-circuit-board
        {"raw-wood", 50},
        {"iron-plate", 35},

    },
    result= "botanical-nursery",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "botanical-nursery",
    icon = "__pycoalprocessing__/graphics/icons/botanical-nursery.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-extraction",
    order = "f",
    place_result = "botanical-nursery",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "botanical-nursery",
    icon = "__pycoalprocessing__/graphics/icons/botanical-nursery.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "botanical-nursery"},
    fast_replaceable_group = "botanical-nursery",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 0
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"nursery"},
    crafting_speed = 1,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.0,
    },
    energy_usage = "130kW",
    ingredient_count = 4,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/botanical-nursery/botanical-nursery.png",
        width = 260,
        height = 254,
        line_length = 7,
        frame_count = 35,
        animation_speed = 0.4,
		run_mode = "forward-then-backward",
        shift = {0.1, 0.1},
    },
    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {0.2,4.13}, {0.12,-4.03}, {4.115,0.1}, {-3.88,0.16}, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, 4.0} }}
        },
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {0.2,4.13}, {0.12,-4.03}, {4.115,0.1}, {-3.88,0.16}, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, -4.0} }}
        },
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {0.2,4.13}, {0.12,-4.03}, {4.115,0.1}, {-3.88,0.16}, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {4.0, 0.0} }}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/botanical-nursery.ogg", volume = 1.8 }, 
        idle_sound = { filename = "__pycoalprocessing__/sounds/botanical-nursery.ogg", volume = 0.95 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
