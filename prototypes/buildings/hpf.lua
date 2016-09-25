data:extend(
  {
    {
      type = "recipe",
      name = "hpf",
      energy_requiered = 10,
      enabled = false,
      ingredients =
      {
        {"concrete", 20},
        {"steel-plate", 20},
        {"glass", 10},
		{"steel-bearing", 5},
        {"invar-alloy", 10},
        {"advanced-circuit", 10},
      },
      result= "hpf",
      icon = "__pycoalprocessing__/graphics/icons/hpf.png",
    },
    {
      type = "item",
      name = "hpf",
      icon = "__pycoalprocessing__/graphics/icons/hpf.png",
      flags = {"goes-to-quickbar"},
      subgroup = "coal-processing",
      order = "a-d[hpf]",
      place_result = "hpf",
      stack_size = 10,
    },
    {
      type = "assembling-machine",
      name = "hpf",
      icon = "__pycoalprocessing__/graphics/icons/hpf.png",
      flags = {"placeable-neutral","player-creation"},
      minable = {mining_time = 1, result = "hpf"},
      fast_replaceable_group = "hpf",
      max_health = 300,
      corpse = "medium-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
      selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
      module_specification =
      {
        module_slots = 4
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      crafting_categories = {"hpf"},
      crafting_speed = 0.1,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.03 / 2,
      },
      energy_usage = "370kW",
      ingredient_count = 5,

      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/hpf/hpf-off.png",
        width = 167,
        height = 173,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.1, 0.0},
      },

	working_visualisations =
    {
      {
        north_position = {0.1, 0},
        west_position = {0.1, 0},
        south_position = {0.1, 0},
        east_position = {0.1, 0},
        animation =
        {
          filename = "__pycoalprocessing__/graphics/entity/hpf/hpf-anim.png",
		  priority = "medium",
          frame_count = 50,
		  line_length = 10,
          width = 167,
          height = 173,
          animation_speed = 0.7
        }
      },
	  {
          north_position = {1.543, -2.68},
          west_position = {1.543, -2.68},
          south_position = {1.543, -2.68},
          east_position = {1.543, -2.68},
          animation =
          {
            filename = "__pycoalprocessing__/graphics/entity/hpf/smoke-anim.png",
			priority = "extra-high",
            frame_count = 80,
            line_length = 20,
            width = 79,
            height = 44,
            animation_speed = 0.3
          }
        }
	},
	
      fluid_boxes =
      {
        {
          production_type = "input",
          --pipe_picture = floatationpipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {3.0, -0.0} }}
        },

      },
      pipe_covers = pipecoverspictures(),
      vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = { filename = "__pycoalprocessing__/sounds/hpf.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/hpf.ogg", volume = 0.3 },
        apparent_volume = 2.5,
      },
    },
  })
