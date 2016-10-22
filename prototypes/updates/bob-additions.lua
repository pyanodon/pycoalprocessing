--luacheck: globals bobmods

local methanol_from_hydrogen = {
  type = "recipe",
  name = "methanol-from-hydrogen",
  category = "methanol",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="fluid", name="carbon-dioxide", amount=3},
    {type="fluid", name="hydrogen", amount=5},
    {type="item", name="zinc-ore", amount=1},
    {type="item", name="alumina", amount=2}, },
  results=
  {
    {type="fluid", name="methanol", amount=4},
  },
  main_product= "methanol",
  icon = "__pycoalprocessing__/graphics/icons/methanol.png",
  order = "f [methanol]",
}

data:extend({methanol_from_hydrogen})

bobmods.lib.tech.add_recipe_unlock("methanol-processing2", "methanol-from-hydrogen")
