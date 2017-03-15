local technology = {
  type = "technology",
  name = "coal-processing-3",
  icon = "__pycoalprocessing__/graphics/technology/coal-processing-3.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"coal-processing-2", "methanol-processing-2"},
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
		recipe = "making_chromium"
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
		recipe = "olefin"
    },
	{
		type = "unlock-recipe",
		recipe = "fts-reactor"
    },
	{
		type = "unlock-recipe",
		recipe = "ref_to_light_oil"
    },
	{
		type = "unlock-recipe",
		recipe = "ref_to_petroleum_gas"
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
