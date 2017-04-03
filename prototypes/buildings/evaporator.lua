local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
  local north, south, east, west
  if shift_north then
    north =
    {
      filename = "__pycoalprocessing__/graphics/entity/evaporator/long-pipe-north.png",
      priority = "low",
      width = 30,
      height = 44,
      --shift = {0.03125, 0.3125}
      shift = shift_north
    }
  else
    north = Proto.empty_sprite
  end
  if shift_south then
    south =
    {
      filename = "__pycoalprocessing__/graphics/entity/evaporator/pipe-ending-down.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {0.03125, -1.0625}
      shift = shift_south
    }
  else
    south = Proto.empty_sprite
  end
  if shift_west then
    west =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-west.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {0.8125, 0}
      shift = shift_west
    }
  else
    west = Proto.empty_sprite
  end
  if shift_east then
    east =
    {
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-east.png",
      priority = "extra-high",
      width = 40,
      height = 45,
      --shift = {-0.78125, 0.15625}
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
  name = "evaporator",
  energy_requiered = 15,
  enabled = false,
  ingredients =
  {
    {"gasturbinemk01", 1},
    {"chemical-plant", 1},
    {"advanced-circuit", 10},
    {"steel-plate", 40}, -- bob lead-plate
	{"iron-plate", 40}, --bob steel-gear-wheel
    {"iron-gear-wheel", 15}, --bob steel-bearing

  },
  result= "evaporator",
  icon = "__pycoalprocessing__/graphics/icons/evaporator.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
  type = "item",
  name = "evaporator",
  icon = "__pycoalprocessing__/graphics/icons/evaporator.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[evaporator]",
  place_result = "evaporator",
  stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "evaporator",
  icon = "__pycoalprocessing__/graphics/icons/evaporator.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "evaporator"},
  fast_replaceable_group = "evaporator",
  max_health = 300,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-2.48, -2.48}, {2.48, 2.48}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  module_specification =
  {
    module_slots = 4
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  crafting_categories = {"evaporator"},
  crafting_speed = 1,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.02 / 2,
  },
  energy_usage = "500kW",
  ingredient_count = 2,

  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/evaporator/evaporator-off.png",
    width = 168,
    height = 177,
    frame_count = 1,
    --animation_speed = 0.5,
    shift = {0.1, 0.0},
  },

  working_visualisations =
  {
    {
      north_position = {0.1, -0.0},
      west_position = {0.1, -0.0},
      south_position = {0.1, -0.0},
      east_position = {0.1, -0.0},
      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/evaporator/evaporator-anim.png",
        frame_count = 80,
        line_length = 10,
        width = 168,
        height = 177,
        animation_speed = 0.25
      }
    },
  },

  fluid_boxes =
	{
		{
		  production_type = "input",
		  pipe_picture = Proto.pipes("assembler", {0.05, 0.65}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
		  pipe_covers = Proto.pipe_covers(false, true, true, true),
		  base_area = 10,
		  base_level = -1,
		  pipe_connections = {{ type="input", position = {3.0, 0.0} }}
		},
    {
		  production_type = "output",
		  pipe_picture = Proto.pipes("assembler", {0.05, 0.65}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
		  pipe_covers = Proto.pipe_covers(false, true, true, true),
		  base_area = 10,
		  base_level = -1,
		  pipe_connections = {{ type="input", position = {0.0, 3.0} }}
		},
    off_when_no_fluid_recipe = true
	},
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/evaporator.ogg" },
    idle_sound = { filename = "__pycoalprocessing__/sounds/evaporator.ogg", volume = 0.65 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
