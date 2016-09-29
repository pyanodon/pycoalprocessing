data:extend(
  {
    {
      type = "recipe",
      name = "distilator",
      energy_requiered = 10,
      enabled = false,
      ingredients =
      {
        {"steel-plate", 20},
        {"pipe", 10},
        {"iron-plate", 10},
        {"storage-tank", 2},
      },
      result= "distilator",
      icon = "__pycoalprocessing__/graphics/icons/distilator.png",
    },
    {
      type = "item",
      name = "distilator",
      icon = "__pycoalprocessing__/graphics/icons/distilator.png",
      flags = {"goes-to-quickbar"},
      subgroup = "coal-processing",
      order = "a[distilator]",
      place_result = "distilator",
      stack_size = 10,
    },
    {
      type = "assembling-machine",
      name = "distilator",
      icon = "__pycoalprocessing__/graphics/icons/distilator.png",
      flags = {"placeable-neutral","player-creation"},
      minable = {mining_time = 1, result = "distilator"},
      fast_replaceable_group = "distilator",
      max_health = 300,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
      selection_box = {{-4, -4}, {4, 4}},
      module_specification =
      {
        module_slots = 2
      },
      allowed_effects = {"consumption", "speed", "pollution"},
      crafting_categories = {"distilator"},
      crafting_speed = 0.75,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
      },
      energy_usage = "300kW",
      ingredient_count = 4,
      animation ={
        layers={
          {
            filename = "__pycoalprocessing__/graphics/entity/distilator/distilator.png",
            width = 283,
            height = 266,
            frame_count = 1,
            --line_length = 4,
            --animation_speed = 0.5,
            shift = {0.45, -0.156},
          },
        }
      },
      fluid_boxes =
      {
        {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {4.5, 0.5} }}
		  
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {4.5, -0.5} }}
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {0.5, 4.5} }}
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {-0.5, 4.5} }}
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {0.5, -4.5} }}
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {-0.5, -4.5} }}
        },
        {
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {-4.5, 0.5} }}
        },
		{
          production_type = "output",
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ position = {-4.5, -0.5} }}
        },

      },
      vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = { filename = "__base__/sound/oil-refinery.ogg" },
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        apparent_volume = 2.5,
      },
    },
  }
)
