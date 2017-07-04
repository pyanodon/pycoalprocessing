local technology = {
  type = "technology",
  name = "excavation01",
  icon = "__pycoalprocessing__/graphics/technology/borer01.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"coal-processing3", "titanium-processing"},
  effects =
  {

	{
		type = "unlock-recipe",
		recipe = "soil"
	},
	{
		type = "unlock-recipe",
		recipe = "soil-extractormk01"
	},
	{
		type = "unlock-recipe",
		recipe = "ground-borer"
	},
	{
		type = "unlock-recipe",
		recipe = "drill-head"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-nexelit"
	},
  },
 
  unit =
  {
    count = 45,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
	  {"science-pack-3", 1},
    },
    time = 35
  },
}
data:extend({technology})

