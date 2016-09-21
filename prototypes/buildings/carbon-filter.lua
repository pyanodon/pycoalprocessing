data:extend(
  {
  {
    type = "item",
    name = "carbon-filter",
    icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-b[carbon-filter]",
    place_result = "carbon-filter",
    stack_size = 10,
  },
  {
    type = "assembling-machine",
    name = "carbon-filter",
    icon = "__pycoalprocessing__/graphics/icons/carbon-filter.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "carbon-filter"},
	fast_replaceable_group = "carbon-filter",
    max_health = 150,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"carbonfilter"},
    crafting_speed = 0.3,
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
      filename = "__pycoalprocessing__/graphics/entity/carbon-filter/carbon-filter.png",
      priority = "high",
      width = 167,
      height = 160,
      frame_count = 25,
      line_length = 5,
      shift = {0.09, 0.0},
	  animation_speed = 2
    },
	fluid_boxes =
    {
      {
        production_type = "input",
		--pipe_picture = floatationpipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {2.7, -2.0} }}
      },
	  
	  {
        production_type = "output",
		--pipe_picture = floatationpipepictures()
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-2.7, -2.0} }}
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