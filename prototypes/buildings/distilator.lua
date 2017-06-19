local Prototype = require("stdlib.prototype.prototype")

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "distilator",
    energy_required = 10,
    enabled = true,
    ingredients =
    {
        {"copper-plate", 20},
        {"pipe", 10}, --copper-pipe in bobmods
        {"iron-plate", 10},
        {"electronic-circuit", 3} --updated-bob basic-circuit-board
    },
    result= "distilator",
    icon = "__pycoalprocessing__/graphics/icons/distilator.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "distilator",
    icon = "__pycoalprocessing__/graphics/icons/distilator.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "k",
    place_result = "distilator",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "distilator",
    icon = "__pycoalprocessing__/graphics/icons/distilator.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "distilator"},
    fast_replaceable_group = "distilator",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution", "productivity"},
    crafting_categories = {"distilator"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
    },
    energy_usage = "300kW",
    ingredient_count = 4,
    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/distilator/distilator.png",
                width = 283,
                height = 266,
                frame_count = 1,
                --line_length = 4,
                --animation_speed = 0.5,
                shift = {0.45, -0.156},
            },
        }
    },
    fluid_boxes =
    {

        --North, left
        {
            production_type = "input",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{ position = {-0.5, -4.5} }}
        },
        --North, right
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{ position = {0.5, -4.5} }}
        },

        --South, left
        {
            production_type = "input",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{ position = {-0.5, 4.5} }}
        },
        --South, right
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{ position = {0.5, 4.5} }}
        },

        --West, top
        {
            production_type = "input",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{ position = {-4.5, -0.5} }}
        },
        --West, bottom
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{ position = {-4.5, 0.5} }}
        },

        --East, top
        {
            production_type = "input",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil), --.05
            pipe_connections = {{ position = {4.5, -0.5} }}
        },
        --East, bottom
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.00, -0.95}, nil, nil),
            pipe_connections = {{ position = {4.5, 0.5} }}
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
