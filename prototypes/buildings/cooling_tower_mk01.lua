-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
  type = "recipe",
  name = "cooling_tower_mk01",
  energy_requiered = 17,
  enabled = false,
  ingredients =
  {
    {"storage-tank", 1},
    {"small-pump", 1},
    {"advanced-circuit", 5},
    {"pipe", 20}, -- bob copper-pipe
    {"iron-gear-wheel", 15}, --bob brass-gear-wheel
    {"iron-plate", 30},  --bob brass-plate

  },
  result= "cooling_tower_mk01",
  icon = "__pycoalprocessing__/graphics/icons/cooling_tower_mk01.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
  type = "item",
  name = "cooling_tower_mk01",
  icon = "__pycoalprocessing__/graphics/icons/cooling_tower_mk01.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[cooling_tower_mk01]",
  place_result = "cooling_tower_mk01",
  stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "cooling_tower_mk01",
  icon = "__pycoalprocessing__/graphics/icons/cooling_tower_mk01.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "cooling_tower_mk01"},
  fast_replaceable_group = "cooling_tower_mk01",
  max_health = 300,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  module_specification =
  {
    module_slots = 1
  },
  allowed_effects = {"speed"},
  crafting_categories = {"cooling"},
  crafting_speed = 0.25,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.00,
  },
  energy_usage = "70kW",
  ingredient_count = 1,

  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/cooling_tower_mk01/cooling_tower_mk01.png",
    width = 113,
    height = 133,
    frame_count = 30,
    line_length = 10,
    animation_speed = 2,
    shift = {0.20, -0.3},
  },

  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = Proto.pipes("assembler", {0.1, 0.0}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {2.0, 0.0} }}
    },
    {
      production_type = "output",
      pipe_picture = Proto.pipes("assembler", {0.1, 0.0}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ type="output" , position = {-2.0, 0.0} }}
    },

  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/cooling_tower_mk01.ogg" },
    idle_sound = { filename = "__pycoalprocessing__/sounds/cooling_tower_mk01.ogg", volume = 0.35 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
