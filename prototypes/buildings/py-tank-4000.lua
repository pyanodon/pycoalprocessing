local Prototype = require("stdlib.prototype.prototype")
local pipecoverspictures = _G.pipecoverspictures

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "py-tank-4000",
    energy_required = 35,
    enabled = false,
    ingredients =
    {
        {"iron-stick", 40},
        {"pipe", 8},
        {"steel-plate", 30},
    },
    result= "py-tank-4000",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "py-tank-4000",
    icon = "__pycoalprocessing__/graphics/icons/py-tank-4000.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-fluid-handling",
    order = "a-c[py-items]",
    place_result = "py-tank-4000",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "storage-tank",
    name = "py-tank-4000",
    icon = "__pycoalprocessing__/graphics/icons/py-tank-4000.png",
    flags = {"placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 3, result = "py-tank-4000"},
    max_health = 500,
    corpse = "medium-remnants",
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    two_direction_only = true,
    fluid_box =
    {
        base_area = 400,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
            { position = {0, -2} },
            { position = {2, 0} },
            { position = {0, 2} },
            { position = {-2, 0} },
        },
    },
    window_bounding_box = {{-0.0, 0.0}, {0.0, 0.0}},
    pictures =
    {
        picture =
        {
            sheet =
            {
                filename = "__pycoalprocessing__/graphics/entity/py-tank-4000/py-tank-4000.png",
                priority = "extra-high",
                frames = 1,
                width = 165,
                height = 209,
                shift = {1.0, -1.5}
            }
        },
        fluid_background = Prototype.empty_sprite(),
        window_background = Prototype.empty_sprite(),
        flow_sprite = Prototype.empty_sprite(),
        gas_flow = Prototype.empty_animation(),
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = {
            filename = "__base__/sound/storage-tank.ogg",
            volume = 0.8
        },
        apparent_volume = 1.5,
        max_sounds_per_type = 3
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
