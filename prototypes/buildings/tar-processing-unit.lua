local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/north.png",
        priority = "extra-high",
        width = 236,
        height = 235,
    },
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "tar-processing-unit",
    energy_required = 5,
    enabled = "false",
    ingredients ={
        {"steel-plate", 20},
        {"iron-plate", 10},
        {"pipe", 15}, --updated-bob stone-pipe
        {"stone-furnace", 1},
        {"electronic-circuit", 7},
    },
    result= "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "z1",
    place_result = "tar-processing-unit",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "tar-processing-unit"},
    fast_replaceable_group = "tar-processing-unit",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"tar"},
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
        filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/tar-processing.png",
        width = 236,
        height = 229,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.15, -0.1},
    },

    working_visualisations =
    {
        {
            north_position = {1.212, -0.07},
            west_position = {1.212, -0.07},
            south_position = {1.212, -0.07},
            east_position = {1.212, -0.07},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/tar-anim.png",
                frame_count = 40,
                line_length = 8,
                width = 96,
                height = 67,
                animation_speed = 0.15
            }
        }
    },
    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {0.15,3.8}, {-0.0, -0.95}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0, 4} }}
        },
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {0.15,3.8}, {-0.0, -0.95}, nil, nil, pipes),
            base_level = 1,
            pipe_connections = {{ type="output", position = {0, -4} }}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__base__/sound/oil-refinery.ogg" },
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
