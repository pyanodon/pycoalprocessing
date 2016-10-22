--luacheck: globals bobmods

local void_flue_gas = {
  type = "recipe",
  name = "void-flue-gas",
  category = "void-fluid",
  enabled = "false",
  hidden = "true",
  energy_required = 1,
  ingredients =
  {
    {type="fluid", name="flue-gas", amount=2}
  },
  results=
  {
    {type="item", name="void", amount=1, probability=0},
  },
  subgroup = "void",
  icon = "__pycoalprocessing__/graphics/icons/flue-gas.png",
  order = "flue-gas"
}

data:extend({void_flue_gas})

bobmods.lib.tech.add_recipe_unlock("void-fluid", "void-flue-gas")
