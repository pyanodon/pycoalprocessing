-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "rare-earth-extractor",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
        {"rail", 10},
        {"laser-turret", 2},
        {"iron-plate", 60},
        {"engine-unit", 3},
        {"chromium", 25}, --updated-bob invar-alloy
        {"electronic-circuit", 30}, --updated-bob basic-electronic-circuit-board
    },
    result= "rare-earth-extractor",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "rare-earth-extractor",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-extractor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[rare-earth-extractor]",
    place_result = "rare-earth-extractor",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "mining-drill",
    name = "rare-earth-extractor",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-extractor.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "rare-earth-extractor"},
	fast_replaceable_group = "rare-earth-extractor",
    max_health = 600,
	resource_categories = {"basic-solid"},
    corpse = "big-remnants",
--    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    module_specification =
    {
        module_slots = 3
    },
    --allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    --crafting_categories = {"rare-earth"},
    mining_speed = 0.3,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 3.5,
    },
    energy_usage = "500kW",
    mining_power = 3,
	resource_searching_radius = 4.0,
    vector_to_place_result = {0, -4.85},
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/electric-mining-drill/electric-mining-drill-radius-visualization.png",
      width = 12,
      height = 12
    },

    animations ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/rare-earth-extractor/rare-earth-left.png",
                width = 96,
                height = 261,
                line_length = 21,
                frame_count = 126,
                shift = {-2.5, -0.0},
                animation_speed = 0.2,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/rare-earth-extractor/rare-earth-mid.png",
                width = 96,
                height = 261,
                line_length = 21,
                frame_count = 126,
                shift = {0.5, -0.0},
                animation_speed = 0.2,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/rare-earth-extractor/rare-earth-right.png",
                width = 80,
                height = 261,
                line_length = 21,
                frame_count = 126,
                shift = {3.25, -0.0},
                animation_speed = 0.2,
            },
        }
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.85 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.5 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
