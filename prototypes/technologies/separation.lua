local technology = {
  type = "technology",
  name = "separation",
  icon = "__pycoalprocessing__/graphics/technology/separation.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"excavation-1"},
  effects =
  {

    {
      type = "unlock-recipe",
      recipe = "richdust_separation"
    },
    {
      type = "unlock-recipe",
      recipe = "tailings_separation"
    },
	{
      type = "unlock-recipe",
      recipe = "classifier"
    },
	{
      type = "unlock-recipe",
      recipe = "pure_sand_classification"
    },
	{
      type = "unlock-recipe",
      recipe = "coarse_classification"
    },
	{
      type = "unlock-recipe",
      recipe = "coal-slurry"
    },

  },
  unit =
  {
    count = 30,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 2},
	  {"science-pack-3", 1},
    },
    time = 55
  },
}
data:extend({technology})
