data:extend(
  {
  {
    type = "item",
    name = "gasifier",
    icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-b[gasifier]",
    place_result = "gasifier",
    stack_size = 10,
  },
  {
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
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"gasifier"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.02 / 2,
	},
    energy_usage = "250kW",
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
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4.5, -0.5} }}
      },
	  {
        production_type = "input",
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4.5, 1.5} }}
      },
	  {
        production_type = "input",
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-4.5, 3.5} }}
      },
	  {
        production_type = "output",
		--pipe_picture = floatationpipepictures()
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-2.5, 4.5} }}
      },
	  {
        production_type = "output",
		--pipe_picture = floatationpipepictures()
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-0.5, 4.5} }}
      },
    },
    pipe_covers = pipecoverspictures(),
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 2.5,
    },
    },
}
)