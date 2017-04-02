local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
  local north, south, east, west
  if shift_north then
    north =
    {
      filename = "__pycoalprocessing__/graphics/entity/washer/pipe-north.png",
      priority = "low",
      width = 30,
      height = 44,
      shift = shift_north
    }
  else
    north = Proto.empty_sprite
  end
  if shift_south then
    south =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/pipe-south.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      shift = shift_south
    }
  else
    south = Proto.empty_sprite
  end
  if shift_west then
    west =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/pipe-west.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      shift = shift_west
    }
  else
    west = Proto.empty_sprite
  end
  if shift_east then
    east =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/pipe-east.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      shift = shift_east
    }
  else
    east = Proto.empty_sprite
  end
  return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
  type = "recipe",
  name = "washer",
  energy_required = 4,
  enabled = "true",
  ingredients ={
    {"iron-plate", 10},
    {"pipe", 25}, --bob steel-pipe
    {"stone-brick", 30},
    {"basic-circuit-board", 2},
  },
  result= "washer",
  icon = "__pycoalprocessing__/graphics/icons/washer.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
  type = "item",
  name = "washer",
  icon = "__pycoalprocessing__/graphics/icons/washer.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[washer]",
  place_result = "washer",
  stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "washer",
  icon = "__pycoalprocessing__/graphics/icons/washer.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "washer"},
  fast_replaceable_group = "washer",
  max_health = 250,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-3.0, -3.0}, {3.0, 3.0}},
  selection_box = {{-3.1, -3.1}, {3.1, 3.1}},
  module_specification =
  {
    module_slots = 4
  },
  allowed_effects = {"consumption", "speed", "pollution"},
  crafting_categories = {"washer"},
  crafting_speed = 0.75,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.02 / 2,
  },
  energy_usage = "100kW",
  ingredient_count = 4,
  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/washer/washer.png",
    width = 204,
    height = 204,
    frame_count = 80,
	line_length = 10,
    animation_speed = 0.9,
    shift = {0.17, -0.17},
  },

  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = pipe_pictures(nil, {-0.05, -0.8}, nil, {-0.81, 0.075}),
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {0.5, 3.5} }}
    },
    {
      production_type = "output",
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      pipe_picture = pipe_pictures(nil, {-0.05, -0.8}, nil, {-0.81, 0.075}),
      base_level = 1,
      pipe_connections = {{ position = {0.5, -3.5} }}
    },
  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/washer.ogg", volume = 1.5 },
    idle_sound = { filename = "__pycoalprocessing__/sounds/washer.ogg", volume = 0.5 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
