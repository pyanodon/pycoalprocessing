-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "classifier",
    energy_requiered = 35,
    enabled = false,
    ingredients =
    {
        {"assembling-machine-2", 5},
        {"advanced-circuit", 10},
        {"transport-belt", 30},
        {"steel-plate", 20}, --bob titatnium-plate
        {"iron-gear-wheel", 50}, --bob brass-bearing

    },
    result= "classifier",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "classifier",
    icon = "__pycoalprocessing__/graphics/icons/classifier.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[classifier]",
    place_result = "classifier",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "classifier",
    icon = "__pycoalprocessing__/graphics/icons/classifier.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "classifier"},
    fast_replaceable_group = "classifier",
    max_health = 400,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.45, -3.45}, {3.45, 3.45}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"classifier"},
    crafting_speed = 0.65,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03,
    },
    energy_usage = "170kW",
    ingredient_count = 3,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/classifier/classifier.png",
        width = 256,
        height = 257,
        frame_count = 34,
        line_length = 8,
        animation_speed = 0.9,
        shift = {0.495, -0.48},
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.55 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
