local technology = {
  type = "technology",
  name = "coal-processing-1",
  icon = "__pycoalprocessing__/graphics/technology/coal-processing-1.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"steel-processing"},
  effects =
  {
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
    {
      type = "unlock-recipe",
      recipe = "water-mineralized"
    },

  },
  unit =
  {
    count = 30,
    ingredients = {
      {"science-pack-1", 1},
    },
    time = 35
  },
}
data:extend({technology})
