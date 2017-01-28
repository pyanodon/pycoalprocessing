local technology = {
  type = "technology",
  name = "coal-processing3",
  icon = "__pycoalprocessing__/graphics/technology/coal-processing-technology3.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"coal-processing2", "methanol-processing2"},
  effects =
  {

	{
		type = "unlock-recipe",
		recipe = "olefin-plant"
	},
	{
		type = "unlock-recipe",
		recipe = "nichrome"
    },
	{
		type = "unlock-recipe",
		recipe = "chromium"
    },
	{
		type = "unlock-recipe",
		recipe = "heavy-oil_from_coal-gas"
    },
	{
		type = "unlock-recipe",
		recipe = "light-oil_from_syngas"
    },
	{
		type = "unlock-recipe",
		recipe = "petgas_from_refsyngas"
    },
	{
		type = "unlock-recipe",
		recipe = "diesel"
    },
	{
		type = "unlock-recipe",
		recipe = "aromatics"
    },
	{
		type = "unlock-recipe",
		recipe = "coal-gas-from-creosote"
    },
	{
		type = "unlock-recipe",
		recipe = "olefin"
    },

  },
 
  unit =
  {
    count = 50,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
	  {"science-pack-3", 2},
    },
    time = 35
  },
}
data:extend({technology})

