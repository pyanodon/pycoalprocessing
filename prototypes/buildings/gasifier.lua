-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
  type = "recipe",
  name = "gasifier",
  energy_requiered = 10,
  enabled = false,
  ingredients =
  {
    {"steel-plate", 20},
    {"pipe", 20},
    {"iron-plate", 10},
    {"storage-tank", 1},
    {"electronic-circuit", 4},

  },
  result= "gasifier",
  icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
  type = "item",
  name = "gasifier",
  icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[gasifier]",
  place_result = "gasifier",
  stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "gasifier",
  icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "gasifier"},
  fast_replaceable_group = "gasifier",
  max_health = 350,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
  selection_box = {{-4, -4}, {4, 4}},
  module_specification =
  {
    module_slots = 4
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  crafting_categories = {"gasifier"},
  crafting_speed = 1.25,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.02 / 2,
  },
  energy_usage = "270kW",
  ingredient_count = 4,

	animation =
	{
		filename = "__pycoalprocessing__/graphics/entity/gasifier/gasifier-anim.png",
		priority = "high",
		width = 269,
		height = 269,
		frame_count = 30,
		line_length = 6,
		shift = {0.15, 0.3},
	},

  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = Proto.pipes("assembler", {0.1, 0.40}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {-4.5, -1.5} }}
    },
    {
      production_type = "input",
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_picture = Proto.pipes("assembler", {0.1, 0.40}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_connections = {{ type="input", position = {-4.5, -2.5} }}
    },
    {
      production_type = "input",
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_picture = Proto.pipes("assembler", {0.1, 0.40}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_connections = {{ type="input", position = {-4.5, -0.5} }}
    },

    {
      production_type = "output",
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_picture = Proto.pipes("assembler", {0.1, 0.40}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_connections = {{ type="output" , position = {-4.5, 1.5} }}
    },
    {
      production_type = "output",
      pipe_picture = Proto.pipes("assembler", {0.1, 0.40}, {-0.00, -0.75}, {0.55, 0.15}, {-0.5, 0.15}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ type="output" , position = {-4.5, 2.5} }}
    },

  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/gasifier.ogg" },
    idle_sound = { filename = "__pycoalprocessing__/sounds/gasifier.ogg", volume = 0.65 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
