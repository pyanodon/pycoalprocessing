
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
  icon = "__base__/graphics/icons/drilling/drilling-nexelit.png",
  order = "g [py-drilling]",
}

data:extend({
  mining_nexelit,
})
