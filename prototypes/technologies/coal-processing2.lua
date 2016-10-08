local technology = {
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
      recipe = "filtersyngas"
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
    {
      type = "unlock-recipe",
      recipe = "combustion-mixture1"
    },
    {
      type = "unlock-recipe",
      recipe = "power-house"
    },
    {
      type = "unlock-recipe",
      recipe = "tar-carbon"
    },
    {
      type = "unlock-recipe",
      recipe = "gasturbinemk02"
    },

  },
  unit =
  {
    count = 50,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 35
  },
}
data:extend({technology})
