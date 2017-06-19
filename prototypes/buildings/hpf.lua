local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/hpf/long-pipe-north.png",
        priority = "medium",
        width = 30,
        height = 44,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "hpf",
    energy_required = 10,
    enabled = true,
    ingredients =
    {
        {"stone-brick", 20},
        {"copper-plate", 20},
        {"iron-gear-wheel", 5}, --updated-bob steel-bearing
        {"iron-plate", 10}, --updated-bob invar-alloy
        {"electronic-circuit", 3}, --updated-bob basic-circuit-board
    },
    result= "hpf",
    icon = "__pycoalprocessing__/graphics/icons/hpf.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "hpf",
    icon = "__pycoalprocessing__/graphics/icons/hpf.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "p",
    place_result = "hpf",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "hpf",
    icon = "__pycoalprocessing__/graphics/icons/hpf.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "hpf"},
    fast_replaceable_group = "hpf",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"hpf"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 2,
    },
    energy_usage = "370kW",
    ingredient_count = 5,

    animation =
    {
        priority = "high",
        filename = "__pycoalprocessing__/graphics/entity/hpf/hpf-off.png",
        width = 167,
        height = 173,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.1, 0.0},
    },

    working_visualisations =
    {
        {
            north_position = {0.1, 0},
            west_position = {0.1, 0},
            south_position = {0.1, 0},
            east_position = {0.1, 0},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/hpf/hpf-anim.png",
                priority = "medium",
                frame_count = 50,
                line_length = 10,
                width = 167,
                height = 173,
                animation_speed = 0.7
            }
        },
        {
            north_position = {1.543, -2.68},
            west_position = {1.543, -2.68},
            south_position = {1.543, -2.68},
            east_position = {1.543, -2.68},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/hpf/smoke-anim.png",
                priority = "extra-high",
                frame_count = 80,
                line_length = 20,
                width = 79,
                height = 44,
                animation_speed = 0.3
            }
        },
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            pipe_picture=Prototype.Pipes.pictures("assembling-machine-3", {0,1}, {0,-0.9}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.0, -0.0} }}
        },
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            pipe_picture=Prototype.Pipes.pictures("assembling-machine-3", {0,1}, {0,-0.9}, nil, nil, pipes),
            base_level = 1,
            pipe_connections = {{ type="output" , position = {-3.0, -0.0} }}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/hpf.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/hpf.ogg", volume = 0.5 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
