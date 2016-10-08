-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
  type = "recipe",
  name = "quenching-tower",
  energy_requiered = 10,
  enabled = false,
  ingredients =
  {
    {"concrete", 50},
    {"iron-stick", 50},
    {"pipe", 10}, --bob stone-pipe
    {"small-pump", 2},
    {"advanced-circuit", 15},
  },
  result= "quenching-tower",
  icon = "__pycoalprocessing__/graphics/icons/quenching-tower.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
  type = "item",
  name = "quenching-tower",
  icon = "__pycoalprocessing__/graphics/icons/quenching-tower.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "a-c[quenching-tower]",
  place_result = "quenching-tower",
  stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
  type = "assembling-machine",
  name = "quenching-tower",
  icon = "__pycoalprocessing__/graphics/icons/quenching-tower.png",
  flags = {"placeable-neutral","player-creation"},
  minable = {mining_time = 1, result = "quenching-tower"},
  fast_replaceable_group = "quenching-tower",
  max_health = 500,
  corpse = "big-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
  selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
  module_specification =
  {
    module_slots = 4
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  crafting_categories = {"quenching-tower"},
  crafting_speed = 0.65,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions = 0.01 / 2,
  },
  energy_usage = "300kW",
  ingredient_count = 7,

  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/quenching-tower/quenching-tower.png",
    width = 232,
    height = 241,
    frame_count = 1,
    --animation_speed = 0.5,
    shift = {0.05, 0.0},
  },

  working_visualisations =
  {
    {
      north_position = {0.05, 0},
      west_position = {0.05, 0},
      south_position = {0.05, 0},
      east_position = {0.05, 0},
      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/quenching-tower/quenching-tower-anim.png",
        frame_count = 60,
        line_length = 8,
        width = 232,
        height = 241,
        animation_speed = 0.75
      }
    },
  },

  fluid_boxes =
  {
    {
      production_type = "input",
      --pipe_picture = floatationpipepictures(),
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {4.0, -1.0} }}
    },
    {
      production_type = "input",
      --pipe_picture = floatationpipepictures(),
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_area = 10,
      base_level = -1,
      pipe_connections = {{ type="input", position = {4.0, 1.0} }}
    },

    {
      production_type = "output",
      --pipe_picture = floatationpipepictures()
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, -1.0} }}
    },
    {
      production_type = "output",
      --pipe_picture = floatationpipepictures()
      pipe_covers = Proto.pipe_covers(true, true, true, true),
      base_level = 1,
      pipe_connections = {{ position = {-4.0, 1.0} }}
    },

  },
  pipe_covers = Proto.pipe_covers(true, true, true, true),
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = { filename = "__pycoalprocessing__/sounds/quenching-tower.ogg",volume = 0.42 },
    idle_sound = { filename = "__pycoalprocessing__/sounds/quenching-tower.ogg", volume = 0.36 },
    apparent_volume = 2.5,
  },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
