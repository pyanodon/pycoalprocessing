local Prototype = require("stdlib.prototype.prototype")

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "wpu",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
        {"raw-wood", 20},
        {"steel-plate", 20},
        {"iron-plate", 50},
		{"electric-mining-drill", 2},
		{"copper-cable", 50},
        {"electronic-circuit", 10}, --updated-bob basic-circuit-board
    },
    result= "wpu",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "wpu",
    icon = "__pycoalprocessing__/graphics/icons/wpu.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "c",
    place_result = "wpu",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "wpu",
    icon = "__pycoalprocessing__/graphics/icons/wpu.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "wpu"},
    fast_replaceable_group = "wpu",
    max_health = 800,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification =
    {
        module_slots = 5
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"wpu"},
    crafting_speed = 1,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.06,
    },
    energy_usage = "150kW",
    ingredient_count = 3,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/wpu/left.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {-1.5, -1.328},
                animation_speed = 0.3,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/wpu/right.png",
                width = 96,
                height = 277,
                line_length = 21,
                frame_count = 130,
                shift = {1.5, -1.328},
                animation_speed = 0.3,
            },
        }
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/wpu.ogg", volume = 1.0 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/wpu.ogg", volume = 0.6 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
