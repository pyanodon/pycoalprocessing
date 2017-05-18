local Prototype = require("stdlib.prototype.prototype")

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "desulfurizator-unit",
    energy_requiered = 17,
    enabled = false,
    ingredients =
    {
        {"storage-tank", 3},
        {"chemical-plant", 1},
        {"electronic-circuit", 40},
        {"steel-plate", 20}, --updated-bob titanium-plate
        {"iron-plate", 50}, --updated-bob invar-alloy

    },
    result= "desulfurizator-unit",
    icon = "__pycoalprocessing__/graphics/icons/desulfurizator-unit.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type = "item",
    name = "desulfurizator-unit",
    icon = "__pycoalprocessing__/graphics/icons/desulfurizator-unit.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[desulfurizator-unit]",
    place_result = "desulfurizator-unit",
    stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "desulfurizator-unit",
    icon = "__pycoalprocessing__/graphics/icons/desulfurizator-unit.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "desulfurizator-unit"},
    fast_replaceable_group = "desulfurizator-unit",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification =
    {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"desulfurization"},
    crafting_speed = 0.5,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05,
    },
    energy_usage = "250kW",
    ingredient_count = 1,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/desulfurizator-unit/desulfurizator-anim.png",
        width = 196,
        height = 202,
        frame_count = 15,
        line_length = 5,
        animation_speed = 0.75,
        shift = {0.06, -0.1},
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2",  nil, {-0.00, -0.75}, {0.65, 0.10}, {-0.65, 0.10}),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.5, 1.5} }}
        },
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-2", nil, {-0.00, -0.75}, {0.65, 0.10}, {-0.65, 0.10}),
            pipe_covers = Prototype.Pipes.covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.5, -1.5} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__base__/sound/chemical-plant.ogg" },
        idle_sound = { filename = "__base__/sound/chemical-plant.ogg", volume = 0.35 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
