local Prototype = require("stdlib.prototype.prototype")

local pipe_left = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-left.png",
        priority = "low",
        width = 233,
        height = 234,
    }
}

local pipe_mid = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-mid.png",
        priority = "low",
        width = 233,
        height = 234,
    }
}

local pipe_right = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/power-house/north-right.png",
        priority = "low",
        width = 233,
        height = 234,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "power-house",
    energy_requiered = 17,
    enabled = false,
    ingredients =
    {
        {"gasturbinemk01", 1},
        {"pump", 1},
        {"electronic-circuit", 25},
        {"steel-plate", 20},
        {"iron-gear-wheel", 15}, --updated-bob steel-bearing
        {"iron-plate", 30}, --updated-bob lead-plate

    },
    result= "power-house",
    icon = "__pycoalprocessing__/graphics/icons/power-house.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type = "item",
    name = "power-house",
    icon = "__pycoalprocessing__/graphics/icons/power-house.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[power-house]",
    place_result = "power-house",
    stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "power-house",
    icon = "__pycoalprocessing__/graphics/icons/power-house.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "power-house"},
    fast_replaceable_group = "power-house",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 5
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"combustion"},
    crafting_speed = 0.9,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
    },
    energy_usage = "200kW",
    ingredient_count = 4,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/power-house/powerhouse-anim.png",
        width = 233,
        height = 234,
        frame_count = 30,
        line_length = 6,
        animation_speed = 0.7,
        shift = {0.156, -0.165},
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.154,3.735}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_left),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-1.0, -3.9} }}
        },
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.154,3.735}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_mid),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, -3.9} }}
        },
        {
            production_type = "input",
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.154,3.735}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_right),
            pipe_connections = {{ type="input", position = {1.0, -3.9} }}
        },
        {
            production_type = "output",
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {1.154,3.735}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_left),
            pipe_connections = {{ type="output" , position = {-3.9, 1.0} }}
        },
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", {0.154,3.735}, {-0.00, -0.89}, {0.55, 0.15}, {-0.5, 0.15}, pipe_mid),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output" , position = {-3.9, 0.0} }}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/power-house.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/power-house.ogg", volume = 0.65 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
