-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "co2_absorber",
    energy_requiered = 15,
    enabled = false,
    ingredients =
    {
        {"gasturbinemk01", 3},
        {"advanced-circuit", 30},
        {"steel-plate", 50},
        {"carbon-filter", 2},
        {"nexelit-plate", 50},

    },
    result= "co2_absorber",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "co2_absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[co2_absorber]",
    place_result = "co2_absorber",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "co2_absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "co2_absorber"},
    fast_replaceable_group = "co2_absorber",
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
    crafting_categories = {"co2"},
    crafting_speed = 0.4,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = -1.7,
    },
    energy_usage = "160kW",
    ingredient_count = 3,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/co2-absorber/co2-absorber.png",
        width = 278,
        height = 280,
        frame_count = 31,
        line_length = 7,
        animation_speed = 0.8,
        shift = {0.83, -0.869},
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.55 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/co2-absorber.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/co2-absorber.ogg", volume = 0.60 },
        apparent_volume = 1.0,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
