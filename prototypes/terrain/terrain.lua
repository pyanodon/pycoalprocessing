local polluted_ground=
{
  type = "tile",
  name = "polluted-ground",
  collision_mask = {"ground-tile"},
  --autoplace = autoplace_settings("polluted-ground", {{{35, 0.3}, {-5, 0.1}}}),
  autoplace=nil,
  layer = 36,
  variants =
  {
    main =
    {
      {
        picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground1.png",
        count = 16,
        size = 1
      },
      {
        picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground2.png",
        count = 16,
        size = 2,
        probability = 0.39,
        weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
      },
      {
        picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground4.png",
        count = 22,
        line_length = 11,
        size = 4,
        probability = 1,
        weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
      },
    },
    inner_corner =
    {
      picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground-inner-corner.png",
      count = 8
    },
    outer_corner =
    {
      picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground-outer-corner.png",
      count = 8
    },
    side =
    {
      picture = "__tailings-pond__/graphics/terrain/polluted-ground/polluted-ground-side.png",
      count = 8
    }
  },
  walking_sound =
  {
    {
      filename = "__base__/sound/walking/sand-01.ogg",
      volume = 0.8
    },
    {
      filename = "__base__/sound/walking/sand-02.ogg",
      volume = 0.8
    },
    {
      filename = "__base__/sound/walking/sand-03.ogg",
      volume = 0.8
    },
    {
      filename = "__base__/sound/walking/sand-04.ogg",
      volume = 0.8
    }
  },
  map_color={r=0.6 , g=0.1 , b=0.6, a=0.5},
  ageing=0.0002,
  vehicle_friction_modifier = _G.sand_vehicle_speed_modifier
}

data:extend({polluted_ground})
