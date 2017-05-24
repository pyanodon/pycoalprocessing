local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    north =
    {
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/top.png",
        priority = "low",
        width = 224,
        height = 230,
    },
    south =
    {
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/bottom.png",
        priority = "extra-high",
        width = 224,
        height = 230,
    },
    west =
    {
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/left.png",
        priority = "extra-high",
        width = 224,
        height = 230,
    },
    east =
    {
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/right.png",
        priority = "extra-high",
        width = 224,
        height = 230,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "ralesia-plantation",
    energy_required = 100,
    enabled = false,
    ingredients =
    {
        {"soil", 400},
        {"pipe", 15}, --updated-bob steel pipe
        {"electronic-circuit", 25}, --updated-bob basic-electronic-circuit-board
        {"stone", 100}, --updated-bob glass
        {"iron-plate", 30},
        {"treated-wood", 50},
        {"small-lamp", 20},
    },
    result= "ralesia-plantation",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "ralesia-plantation",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-plantation-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-b[ralesia-plantation]",
    place_result = "ralesia-plantation",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "ralesia-plantation",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-plantation-icon.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ralesia-plantation"},
    fast_replaceable_group = "ralesia-plantation",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"ralesia"},
    crafting_speed = 0.2,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01,
    },
    energy_usage = "200kW",
    ingredient_count = 1,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/ralesia-plantation.png",
        width = 224,
        height = 230,
        frame_count = 50,
        line_length = 8,
        animation_speed = 2.3,
        run_mode = "forward-then-backward",
        shift = {0.0, -0.163},
    },

    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", {-0.0,3.837}, {-0.0,-3.837}, {4.0,0.0}, {-4.0,0.0}, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, 4.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/ralesia-plantation.ogg", volume = 1.2 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/ralesia-plantation.ogg", volume = 0.70 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
