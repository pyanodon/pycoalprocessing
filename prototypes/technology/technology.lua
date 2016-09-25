data:extend(
  {
    --MK01
    {
      type = "technology",
      name = "coal-processing1",
      icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology.png",
      icon_size = 128,
      order = "c-a",
      prerequisites = {"steel-processing"},
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "tailings-pond"
        },
        {
          type = "unlock-recipe",
          recipe = "distilator"
        },
        {
          type = "unlock-recipe",
          recipe = "gasifier"
        },
        {
          type = "unlock-recipe",
          recipe = "gasturbinemk01"
        },
        {
          type = "unlock-recipe",
          recipe = "tar-processing-unit"
        },
        {
          type = "unlock-recipe",
          recipe = "coal-gas"
        },
        {
          type = "unlock-recipe",
          recipe = "creosote"
        },
        {
          type = "unlock-recipe",
          recipe = "syngas"
        },

      },
      unit =
      {
        count = 50,
        ingredients = {
          {"science-pack-1", 1},
        },
        time = 35
      },
    },

    --MK02

    {
      type = "technology",
      name = "coal-processing2",
      icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology2.png",
      icon_size = 128,
      order = "c-a",
      prerequisites = {"electrolysis-1" , "coal-processing1"},
      effects =
      {

        {
          type = "unlock-recipe",
          recipe = "carbon-filter"
        },
        {
          type = "unlock-recipe",
          recipe = "methanol-reactor"
        },
        {
          type = "unlock-recipe",
          recipe = "filtersyngas"
        },
        {
          type = "unlock-recipe",
          recipe = "canister"
        },
        {
          type = "unlock-recipe",
          recipe = "canister2"
        },
        {
          type = "unlock-recipe",
          recipe = "recsyngas"
        },
        {
          type = "unlock-recipe",
          recipe = "rectisol"
        },
        {
          type = "unlock-recipe",
          recipe = "syngas2"
        },
		{
          type = "unlock-recipe",
          recipe = "quenching-tower"
        },
		{
          type = "unlock-recipe",
          recipe = "tailings"
        },
		{
          type = "unlock-recipe",
          recipe = "hpf"
        },
		{
          type = "unlock-recipe",
          recipe = "zinc-chloride"
        },
		{
          type = "unlock-recipe",
          recipe = "active-carbon"
        },

      },
      unit =
      {
        count = 10,
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
        },
        time = 35
      },
    },

    {
      type = "technology",
      name = "py-asphalt",
      icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology-asf.png",
      icon_size = 128,
      order = "c-a",
      prerequisites = {"concrete" , "coal-processing2"},
      effects =
      {

        {
          type = "unlock-recipe",
          recipe = "py-asphalt"
        },

      },
      unit =
      {
        count = 10,
        ingredients = {
          {"science-pack-1", 1},
          {"science-pack-2", 1},
        },
        time = 35
      },
    },

  })
