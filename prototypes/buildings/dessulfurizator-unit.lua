local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
  local north, south, east, west
  if shift_north then
    north =
    {
      filename = "__base__/graphics/entity/assembling-machine-2/pipe-north.png",
      priority = "extra-high",
      width = 41,
      height = 40,
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
      width = 41,
      height = 40,
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
      width = 41,
      height = 40,
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
      width = 41,
      height = 40,
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
  name = "dessulfurizator-unit",
  energy_requiered = 17,
  enabled = false,
  ingredients =
  {
    {"storage-tank", 3},
    {"chemical-plant", 1},
    {"electronic-circuit", 40},
    {"steel-plate", 20}, -- bob titanium-plate
    {"iron-plate", 50}, --bob invar-alloy

  },
  result= "dessulfurizator-unit",
  icon = "__pycoalprocessing__/graphics/icons/dessulfurizator-unit.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
  type = "item",
  name = "dessulfurizator-unit",
  icon = "__pycoalprocessing__/graphics/icons/dessulfurizator-unit.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[dessulfurizator-unit]",
  place_result = "dessulfurizator-unit",
  stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "dessulfurizator-unit",
  icon = "__pycoalprocessing__/graphics/icons/dessulfurizator-unit.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "dessulfurizator-unit"},
  fast_replaceable_group = "dessulfurizator-unit",
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
  crafting_categories = {"dessulfurization"},
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
    filename = "__pycoalprocessing__/graphics/entity/dessulfurizator-unit/dessulfurizator-anim.png",
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
      pipe_picture = pipe_pictures( nil, {-0.00, -0.75}, {0.65, 0.10}, {-0.65, 0.10}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {3.5, 1.5} }}
    },
    {
      production_type = "input",
      pipe_picture = pipe_pictures(nil, {-0.00, -0.75}, {0.65, 0.10}, {-0.65, 0.10}),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
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
