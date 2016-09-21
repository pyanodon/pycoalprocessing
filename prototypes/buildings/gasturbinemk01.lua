data:extend(
  {
  {
    type = "item",
    name = "gasturbinemk01",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk01.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[gasturbinemk01]",
    place_result = "gasturbinemk01",
    stack_size = 15,
  },
  {
    type = "generator",
    name = "gasturbinemk01",
    icon = "__pycoalprocessing__/graphics/icons/gas-turbinemk01.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gasturbinemk01"},
    max_health = 300,
    corpse = "big-remnants",
	effectivity = 25,
	fluid_usage_per_tick = 0.02,
	resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
	fluid_box ={
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1.5, 0.5} },
        { position = {1.5, 0.5} },
      },
    },

    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      emissions = 0.03,
	},
  horizontal_animation =
		{
			filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk01/gasturbinemk01.png",
			width = 160,
			height = 224,
			frame_count = 25,
			line_length = 5,
			shift = {-0.0,-2.3},
			animation_speed = 0.8,
		},
		vertical_animation =
		{
			filename = "__pycoalprocessing__/graphics/entity/gas-turbinemk01/gasturbinemk01.png",
			width = 160,
			height = 224,
			frame_count = 25,
			line_length = 5,
			shift = {0.5,-2.3},
			animation_speed = 0.8,
		},
	min_perceived_performance = 0.1,
    performance_to_sound_speedup = 0.3,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk01.ogg" },
      idle_sound = { filename = "__pycoalprocessing__/sounds/gasturbinemk01.ogg", volume = 0.45 },
      apparent_volume = 2.5,
    }
},
})