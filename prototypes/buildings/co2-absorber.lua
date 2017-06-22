-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "co2-absorber",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
        {"gasturbinemk01", 3},
        {"advanced-circuit", 30},
        {"steel-plate", 50},
        {"carbon-filter", 2},
        {"nexelit-plate", 50},

    },
    result= "co2-absorber",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "co2-absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "g",
    place_result = "co2-absorber",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "co2-absorber",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "co2-absorber"},
    fast_replaceable_group = "co2-absorber",
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
    crafting_speed = 1,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = -0.9,
    },
    energy_usage = "200kW",
    ingredient_count = 1,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/co2-absorber/co2-absorber.png",
        width = 278,
        height = 280,
        frame_count = 31,
        line_length = 7,
        animation_speed = 0.5,
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
