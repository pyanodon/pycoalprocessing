local _TANK_SIZE = _G.PYC.TAILINGS_POND.TANK_SIZE

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe_tailings_pond = {
  type = "recipe",
  name = "tailings-pond",
  enabled = "false",
  ingredients =
  {
    {"small-pump", 1},
    {"storage-tank", 4},
    {"stone-brick", 20}
  },
  result = "tailings-pond"
}

-------------------------------------------------------------------------------
--[[Items]]--
local item_tailings_pond = {
  type = "item",
  name = "tailings-pond",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"goes-to-quickbar"},
  subgroup = "coal-processing",
  order = "t",
  place_result = "tailings-pond",
  stack_size = 50
}

-------------------------------------------------------------------------------
--[[Entities]]--
local entity_tailings_pond =
{
  type = "storage-tank",
  name = "tailings-pond",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 3, result = "tailings-pond"},
  max_health = 500,
  corpse = "big-remnants",
  --2.4
  collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  fluid_box =
  {
    base_area = (_TANK_SIZE / 10),
    pipe_covers = Proto.pipe_covers(true, true, true, true),
    pipe_connections = {
      {position = {0, -3}},
      {position = {0, 3}},
      {position = {3, 0}},
      {position = {-3, 0}},
    },
  },
  --window_bounding_box = {{-2.390625, -2.390625},{2.390625, 2.390625}},
  window_bounding_box = {{-2.4, -2.4},{2.4, 2.4}},
  pictures =
  {
    picture =
    {
      sheet =
      {
        filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-mask-2.png",
        priority = "high",
        frames = 1,
        width = 171,
        height = 185,
        --shift = {0.6875, 0.109375}
        shift = {0, 0}
      }
    },
    fluid_background = Proto.empty_sprite,
    window_background =
    {
      filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-pond-empty-window-2.png",
      priority = "extra-high",
      width = 171,
      height = 185
    },
    flow_sprite = Proto.empty_sprite,
  },
  flow_length_in_ticks = 360,
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound = {
      filename = "__base__/sound/storage-tank.ogg",
      volume = 0.8
    },
    apparent_volume = 1.5,
    max_sounds_per_type = 3
  },
  circuit_wire_connection_points =
  {
    {
      shadow = { red = {0, 0}, green = {0,0}},
      wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
    },
    {
      shadow = { red = {0, 0}, green = {0,0}},
      wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
    },
    {
      shadow = { red = {0, 0}, green = {0,0}},
      wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
    },
    {
      shadow = { red = {0, 0}, green = {0,0}},
      wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
    }
  },
  circuit_connector_sprites =
  {
    _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
    _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
    _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
    _G.get_circuit_connector_sprites({2.546875, -2.4375}, nil, 0),
  },
  circuit_wire_max_distance = 8.5
}

local entity_tailings_pond_sprite =
{
  type = "car",
  name = "tailings-pond-sprite",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"placeable-neutral", "placeable-off-grid", "player-creation"},
  minable = {mining_time = 1, result = "tailings-pond"},
  max_health = 0,
  order="z[zebra]",
  corpse = "big-remnants",
  energy_per_hit_point = 1,
  crash_trigger = _G.crash_trigger(),
  resistances =
  {
    {
      type = "fire",
      percent = 50
    },
    {
      type = "impact",
      percent = 30,
      decrease = 30
    }
  },
  collision_box = {{-0.1, -.1}, {.1,.1}},
  collision_mask = { "item-layer", "object-layer", "player-layer", "water-tile"},
  selection_box = {{0,0}, {0,0}},
  effectivity = 0.5,
  braking_power = "200kW",
  burner =
  {
    effectivity = 0.6,
    fuel_inventory_size = 1,
    smoke =
    {
      {
        name = "smoke",
        deviation = {0.25, 0.25},
        frequency = 50,
        position = {0, 1.5},
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  consumption = "150kW",
  friction = 2e-3,
  light =
  {
    {
      type = "oriented",
      minimum_darkness = 1,
      picture =
      {
        filename = "__core__/graphics/light-cone.png",
        priority = "medium",
        scale = 0,
        width = 0,
        height = 0
      },
      shift = {0, 0},
      size = 0,
      intensity = 0
    }
  },
  animation =
  {
    layers =
    {
      {
        width = 171,
        priority="extra-high",
        height = 185,
        frame_count = 1,
        direction_count = 30,
        shift = {0, 0},
        --shift = {-2/32,-8/32},
        animation_speed = 0.1,
        max_advance = 0.2,
        stripes =
        {
          {
            filename = "__pycoalprocessing__/graphics/entity/tailings-pond/tailings-fluid-sheet.png",
            priority="extra-high",
            width_in_frames = 10,
            height_in_frames = 3,
          },
        }
      },
    }
  },
  stop_trigger_speed = 0.2,
  stop_trigger =
  {
    {
      type = "play-sound",
      sound =
      {
        {
          filename = "__base__/sound/car-breaks.ogg",
          volume = 0
        },
      }
    },
  },
  sound_minimum_speed = 0;
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0 },
  working_sound =
  {
    sound =
    {
      filename = "__base__/sound/car-engine.ogg",
      volume = 0
    },
    activate_sound =
    {
      filename = "__base__/sound/car-engine-start.ogg",
      volume = 0
    },
    deactivate_sound =
    {
      filename = "__base__/sound/car-engine-stop.ogg",
      volume = 0
    },
    match_speed_to_activity = true,
  },
  open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
  close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
  rotation_speed = 0.015,
  weight = 700,
  guns = { "vehicle-machine-gun" },
  inventory_size = 0
}

local entity_tailings_pond_spinner = {
  type = "beacon",
  name = "tailings-pond-spinner",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"placeable-player", "player-creation"},
  minable = {mining_time = 1, result = "tailings-pond"},
  order = "zzz",
  max_health = 0,
  corpse = "small-remnants",
  dying_explosion = "medium-explosion",
  collision_box = {{-2.25, -2.25}, {2.25, 2.25}},
  selection_box = {{-0, -0}, {0, 0}},
  allowed_effects = {"consumption", "speed", "pollution"},
  base_picture = Proto.empty_sprite,
  -- {
  -- filename = "__base__/graphics/entity/beacon/beacon-base.png",
  -- width = 116,
  -- height = 93,
  -- shift = { 0.34375, 0.046875}
  -- },
  animation =
  {
    filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner.png",
    width = 29,
    height = 41,
    line_length = 0,
    frame_count = 50,
    shift = { -1.95, 1.71875},
    animation_speed = 0.25
  },
  animation_shadow =
  {
    filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner-shadow.png",
    width = 29,
    height = 41,
    line_length = 0,
    frame_count = 50,
    shift = { -1.140625, 1.484375},
    animation_speed = 0.25
  },
  radius_visualisation_picture = Proto.empty_sprite,
  -- radius_visualisation_picture =
  -- {
  -- filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
  -- width = 12,
  -- height = 12
  -- },
  supply_area_distance = 0,
  energy_source =
  {
    type = "electric",
    usage_priority = "terciary"
  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  energy_usage = "100W",
  distribution_effectivity = 0.5,
  module_specification =
  {
    module_slots = 1,
    module_info_icon_shift = {0, 0.5},
    module_info_multi_row_initial_height_modifier = -0.3
  }
}

--Ignore this we are currently not using it.
--May change in the future though if we want to use tailings pond without power.
--Will also need to add a custom pole with no connection and 1x supply
local entity_tailings_pond_power_source = { --luacheck: ignore
  type = "electric-energy-interface",
  name = "tailings-pond-power-source",
  icon = "__pycoalprocessing__/graphics/icons/tailings-pond.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {hardness = 0.2, mining_time = 0.5, result = "tailings-pond"},
  order="z",
  max_health = 0,
  corpse = "small-remnants",
  collision_box = {{-0.01, -0.01}, {0.01, 0.01}},
  selection_box = {{-0, -0}, {0, 0}},
  energy_source =
  {
    type = "electric",
    buffer_capacity = "1MJ",
    usage_priority = "terciary",
    input_flow_limit = "100kW",
    output_flow_limit = "100kW"
  },
  energy_production = "1000kW",
  energy_usage = "0kW",
  -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
  animations =
  {
    filename = "__pycoalprocessing__/graphics/entity/tailings-pond/spinner.png",
    width = 29,
    height = 41,
    --line_length = 0,
    direction_count = 1,
    frame_count = 50,
    shift = { -2.0, 1.71875},
    animation_speed = 0.25
  },
  vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound =
    {
      filename = "__base__/sound/accumulator-working.ogg",
      volume = 0
    },
    idle_sound = {
      filename = "__base__/sound/accumulator-idle.ogg",
      volume = 0
    },
    max_sounds_per_type = 5
  },
}

-------------------------------------------------------------------------------
--[[Extend Prototypes]]--

data:extend({
    recipe_tailings_pond, item_tailings_pond,
    entity_tailings_pond,
    entity_tailings_pond_sprite,
    entity_tailings_pond_spinner,
    --entity_tailings_pond_power_source,
    --entity_tailings_pond_pole,
  })
