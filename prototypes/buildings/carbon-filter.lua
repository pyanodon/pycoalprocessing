local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/carbon-filter/pipe-north.png",
        priority = "extra-high",
        width = 44,
        height = 32,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "carbon-filter",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"assembling-machine-2", 1},
        {"pipe", 2},
        {"engine-unit", 3},
        {"iron-plate", 20},
        {"iron-gear-wheel", 30},
    },
    result= "carbon-filter",
    icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "carbon-filter",
    icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-b[carbon-filter]",
    place_result = "carbon-filter",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "carbon-filter",
    icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "carbon-filter"},
    fast_replaceable_group = "carbon-filter",
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.25, -2.25}, {2.25, 2.25}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"carbonfilter"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
    },
    energy_usage = "100kW",
    ingredient_count = 4,
    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/carbon-filter/carbon-filter.png",
        priority = "high",
        width = 171,
        height = 167,
        frame_count = 25,
        line_length = 5,
        shift = {0.1, -0.125},
        animation_speed = 2
    },
    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.0, 0.65}, {0, -0.8}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.0, -0.0} }}
        },
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.0, 0.65}, {0,-0.8}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ position = {-3.0, -0.0} }}
        },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/carbon-filter.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/carbon-filter.ogg", volume = 0.6 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
