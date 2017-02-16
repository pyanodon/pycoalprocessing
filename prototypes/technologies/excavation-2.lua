local technology = {
  type = "technology",
  name = "excavation-2",
  icon = "__pycoalprocessing__/graphics/technology/excavation-2.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"excavation-1"},
  effects =
  {

	{
		type = "unlock-recipe",
		recipe = "mining-bauxite"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-cobalt"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-gold"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-lead"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-nickel"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-quartz"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-rutile"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-silver"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-stone"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-tin"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-tungsten"
	},
	{
		type = "unlock-recipe",
		recipe = "mining-zinc"
	},


  },

  unit =
  {
    count = 50,
    ingredients = {
      {"science-pack-1", 1},
      {"science-pack-2", 1},
	  {"science-pack-3", 1},
    },
    time = 35
  },
}
data:extend({technology})
