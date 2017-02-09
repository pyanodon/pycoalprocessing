
local mining_nexelit ={
  type = "recipe",
  name = "mining-nexelit",
  category = "ground-borer",
  enabled = "false",
  energy_required = 0.75,
  ingredients ={
    {type="fluid", name="lubricant", amount=20,},
	{type="fluid", name="coal-gas", amount=10,},
	{type="item", name="drill-head", amount=3,},
  },
  results={
    {type="item", name="nexelit-ore", amount=15,},
  },
  main_product= "nexelit-ore",
  icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-nexelit.png",
  order = "g [coal-processing]",
}

data:extend({
  mining_nexelit,
})
