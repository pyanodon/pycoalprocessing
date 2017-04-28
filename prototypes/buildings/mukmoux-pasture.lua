-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "mukmoux-pasture",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"soil", 500},
        {"steel-plate", 100},
        {"storage-tank", 5}, 
        {"advanced-circuit", 10}, --updated-bob electronic-logic-board
    },
    result= "mukmoux-pasture",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "mukmoux-pasture",
    icon = "__pycoalprocessing__/graphics/icons/mukmoux-pasture.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[mukmoux-pasture]",
    place_result = "mukmoux-pasture",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "mukmoux-pasture",
    icon = "__pycoalprocessing__/graphics/icons/mukmoux-pasture.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "mukmoux-pasture"},
    fast_replaceable_group = "mukmoux-pasture",
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.9, -4.9}, {4.9, 4.9}},
    selection_box = {{-5.0, -5.0}, {5.0, 5.0}},
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "productivity", "pollution"},
    crafting_categories = {"mukmoux"},
    crafting_speed = 0.15,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05  / 4,
    },
    energy_usage = "190kW",
    ingredient_count = 2,

    animation =
    {
        
    filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-pasture.png",
    width = 320,
    height = 363,
    frame_count = 1,
    line_length = 1,
    shift = {0.0, -0.5},
    },
	
    working_visualisations =
    {
        {
            north_position = {-2.96, 1.93},
            west_position = {-2.96, 1.93},
            south_position = {-2.96, 1.93},
            east_position = {-2.96, 1.93},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-left.png",
                frame_count = 158,
                line_length = 26,
                width = 76,
                height = 138,
                animation_speed = 0.2
            }
        },
        {
            north_position = {1.78, 2.06},
            west_position = {1.78, 2.06},
            south_position = {1.78, 2.06},
            east_position = {1.78, 2.06},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-right.png",
                frame_count = 158,
                line_length = 14,
                width = 142,
                height = 128,
                animation_speed = 0.2
            }
        },
        {
            north_position = {1.28, -2.28},
            west_position = {1.28, -2.28},
            south_position = {1.28, -2.28},
            east_position = {1.28, -2.28},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-top.png",
                frame_count = 158,
                line_length = 20,
                width = 100,
                height = 47,
                animation_speed = 0.55
            }
        },
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/mukmoux-pasture.ogg", volume = 0.9 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/mukmoux-pasture.ogg", volume = 0.65 },
        apparent_volume = 0.45,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
