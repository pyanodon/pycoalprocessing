local technology = {
  type = "technology",
  name = "dessulfurization",
  icon = "__pycoalprocessing__/graphics/technology/dessulfurization.png",
  icon_size = 128,
  order = "c-a",
  prerequisites = {"sulfur-processing" , "fluid-handling", "coal-processing2"},
  effects =
  {

    {
      type = "unlock-recipe",
      recipe = "dessulfurizator-unit"
    },
    {
      type = "unlock-recipe",
      recipe = "extract-sulfur"
    },

  },
  unit =
  {
    count = 10,
    ingredients = {
      {"science-pack-1", 2},
      {"science-pack-2", 1},
    },
    time = 45
  },
}
data:extend({technology})
