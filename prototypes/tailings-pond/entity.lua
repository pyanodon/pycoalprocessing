local empty_sprite =
{
  filename = "__core__/graphics/empty.png",
  priority = "extra-high",
  width = 1,
  height = 1
}

local tailings_pond =
{
  type = "storage-tank",
  name = "tailings-pond",
  icon = "__tailings-pond__/graphics/item/tailings-pond-item-icon.png",
  flags = {"placeable-player", "player-creation"},
  minable = {hardness = 0.2, mining_time = 3, result = "tailings-pond"},
  max_health = 500,
  corpse = "big-remnants",
  collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  fluid_box =
  {
    base_area = (_G.TAILINGS_POND.TANK_SIZE / 10),
    pipe_covers = _G.pipecoverspictures(),
    pipe_connections = {
      {position = {0, -3}},
      {position = {0, 3}},
      {position = {3, 0}},
      {position = {-3, 0}},
    },
  },
  window_bounding_box = {{-2.390625, -2.390625},{2.390625, 2.390625}},
  pictures =
  {
    picture =
    {
      sheet =
      {
        filename = "__tailings-pond__/graphics/entity/tailings-pond-mask.png",
        priority = "high",
        frames = 1,
        width = 171,
        height = 185,
        --shift = {0.6875, 0.109375}
        shift = {0, 0}
      }
    },
    fluid_background = empty_sprite,
    --window_background = empty_sprite,
    window_background =
    {
        filename = "__tailings-pond__/graphics/entity/tailings-pond-empty-window.png",
        priority = "extra-high",
        width = 171,
        height = 185
    },
    flow_sprite = empty_sprite,
  },
  flow_length_in_ticks = 360,
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
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

local sprite =
{
  type = "car",
  name = "tailings-pond-sprite",
  icon = "__tailings-pond__/graphics/item/tailings-pond-item-icon.png",
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
           filename = "__tailings-pond__/graphics/entity/tailings-fluid-sheet.png",
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
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0 },
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

data:extend({sprite, tailings_pond})
