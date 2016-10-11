local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
  local north, south, east, west
  if shift_north then
    north =
    {
      filename = "__pycoalprocessing__/graphics/entity/rectisol/pipe-north.png",
      priority = "extra-high",
      width = 44,
      height = 32,
      shift = shift_north
    }
  else
    north = Proto.empty_sprite
  end
  if shift_south then
    south =
    {
      filename = "__pycoalprocessing__/graphics/entity/rectisol/pipe-ending-down.png",
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
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-west.png",
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
      filename = "__base__/graphics/entity/assembling-machine-3/pipe-east.png",
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
  name = "rectisol",
  energy_requiered = 10,
  enabled = false,
  ingredients =
  {
    {"assembling-machine-2", 2},
    {"storage-tank", 2},
    {"pipe", 20},
    {"small-pump", 2},
    {"iron-plate", 25},
    {"steel-plate", 20},
  },
  result= "rectisol",
  icon = "__pycoalprocessing__/graphics/icons/rectisol.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
  type = "item",
  name = "rectisol",
  icon = "__pycoalprocessing__/graphics/icons/rectisol.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[rectisol]",
  place_result = "rectisol",
  stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "rectisol",
  icon = "__pycoalprocessing__/graphics/icons/rectisol.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "rectisol"},
  fast_replaceable_group = "rectisol",
  max_health = 150,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
  selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
  module_specification =
  {
    module_slots = 3
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  crafting_categories = {"rectisol"},
  crafting_speed = 0.5,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.02 / 2,
  },
  energy_usage = "300kW",
  ingredient_count = 7,

  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/rectisol/rectisol.png",
    width = 250,
    height = 239,
    frame_count = 1,
    --animation_speed = 0.5,
    shift = {0.38, -0.0},
  },

  working_visualisations =
  {
    {
      north_position = {-1.07, 1.132},
      west_position = {-1.07, 1.132},
      south_position = {-1.07, 1.132},
      east_position = {-1.07, 1.132},
      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/rectisol/rec-tanks-anim.png",
        frame_count = 80,
        line_length = 10,
        width = 121,
        height = 55,
        animation_speed = 0.15
      }
    },
    {
      north_position = {2.03, -1.28},
      west_position = {2.03, -1.28},
      south_position = {2.03, -1.28},
      east_position = {2.03, -1.28},
      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/rectisol/rec-lifter-anim.png",
        frame_count = 80,
        line_length = 40,
        width = 47,
        height = 77,
        animation_speed = 0.35
      }
    }
  },

  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {4.0, -1.0} }}
    },
    {
      production_type = "input",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {4.0, 1.0} }}
    },

    {
      production_type = "output",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, -1.0} }}
    },
    {
      production_type = "output",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, -3.0} }}
    },
    {
      production_type = "output",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, 1.0} }}
    },
    {
      production_type = "output",
      pipe_picture = pipe_pictures({0.0, 0.65}, {-0.05, -0.8}, nil, nil),
      pipe_covers = Proto.pipe_covers(false, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, 3.0} }}
    },

  },
  pipe_covers = Proto.pipe_covers(true, true, true, true),
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/rectisol.ogg" },
    idle_sound = { filename = "__pycoalprocessing__/sounds/rectisol.ogg", volume = 0.6 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
