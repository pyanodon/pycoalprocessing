data:extend(
  {
    {
      type = "recipe",
      name = "methanol-reactor",
      energy_requiered = 15,
      enabled = false,
      ingredients =
      {
        {"gasturbinemk01", 1},
        {"electrolyser", 1},
        {"electronic-circuit", 25},
        {"steel-plate", 20},
        {"steel-bearing", 15},

      },
      result= "methanol-reactor",
      icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
    },
    {
      type = "item",
      name = "methanol-reactor",
      icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
      flags = {"goes-to-quickbar"},
      subgroup = "coal-processing",
      order = "a-c[methanol-reactor]",
      place_result = "methanol-reactor",
      stack_size = 10,
    },
    {
      type = "assembling-machine",
      name = "methanol-reactor",
      icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
      flags = {"placeable-neutral","player-creation"},
      minable = {mining_time = 1, result = "methanol-reactor"},
      fast_replaceable_group = "methanol-reactor",
      max_health = 300,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
      selection_box = {{-3, -3}, {3, 3}},
      module_specification =
      {
        module_slots = 5
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      crafting_categories = {"methanol"},
      crafting_speed = 0.75,
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01 / 2,
      },
      energy_usage = "370kW",
      ingredient_count = 5,

      animation =
      {
        filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/methanol-off.png",
        width = 200,
        height = 238,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.056, -0.7},
      },

      working_visualisations =
      {
        {
          north_position = {0.056, -0.7},
          west_position = {0.056, -0.7},
          south_position = {0.056, -0.7},
          east_position = {0.056, -0.7},
          animation =
          {
            filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/methanol-anim.png",
            frame_count = 50,
            line_length = 10,
            width = 200,
            height = 238,
            animation_speed = 0.25
          }
        },

      },

      fluid_boxes =
      {
        {
          production_type = "input",
          --pipe_picture = floatationpipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {-3.4, 0.5} }}
        },
        {
          production_type = "input",
          --pipe_picture = floatationpipepictures(),
          pipe_covers = pipecoverspictures(),
          base_area = 10,
          base_level = -1,
          pipe_connections = {{ type="input", position = {3.4,0.5} }}
        },

        {
          production_type = "output",
          --pipe_picture = floatationpipepictures()
          pipe_covers = pipecoverspictures(),
          base_level = 1,
          pipe_connections = {{ type="output" , position = {-0.5, 3.2} }}
        },

      },
      pipe_covers = pipecoverspictures(),
      vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
      working_sound =
      {
        sound = { filename = "__pycoalprocessing__/sounds/methanol-reactor.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/methanol-reactor.ogg", volume = 0.65 },
        apparent_volume = 2.5,
      },
    },
  })
