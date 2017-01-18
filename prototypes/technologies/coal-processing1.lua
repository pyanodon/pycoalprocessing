local technology = {
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
      recipe = "treated-wood"
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
}
data:extend({technology})
