local technology = {
  type = "technology",
  name = "cooling_tower_mk01",
  icon = "__pycoalprocessing__/graphics/technology/coolingmk01.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"electric-engine" , "coal-processing1"},
  effects =
  {

    {
      type = "unlock-recipe",
      recipe = "cooling_tower_mk01"
    },
    {
      type = "unlock-recipe",
      recipe = "cooling_water"
    },

  },
  unit =
  {
    count = 20,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 1},
    },
    time = 45
  },
}
data:extend({technology})
