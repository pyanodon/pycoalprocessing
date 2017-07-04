local technology =
{
  type = "technology",
  name = "methanol-processing1",
  icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology-methanol1.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"coal-processing2"},
  effects =
  {

    {
      type = "unlock-recipe",
      recipe = "methanol-reactor"
    },
    {
      type = "unlock-recipe",
      recipe = "methanol-canister"
    },
    {
      type = "unlock-recipe",
      recipe = "empty-methanol-canister"
    },
    {
      type = "unlock-recipe",
      recipe = "fill-methanol-canister"
    },
  },
  unit =
  {
    count = 100,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
    },
    time = 30
  },
}
data:extend({technology})
