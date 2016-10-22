local technology = {
  type = "technology",
  name = "methanol-processing2",
  icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology-methanol2.png",
  icon_size = 128,
  order = "c-b",
  prerequisites = {"methanol-processing1"},
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "methanol-from-syngas"
    },
    {
      type = "unlock-recipe",
      recipe = "methanol-from-hydrogen"
    },
    {
      type = "unlock-recipe",
      recipe = "refsyngas-from-meth"
    },
    {
      type = "unlock-recipe",
      recipe = "refsyngas-from-meth-canister"
    },
  },
  unit =
  {
    count = 150,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 35
  },
}
data:extend({technology})
