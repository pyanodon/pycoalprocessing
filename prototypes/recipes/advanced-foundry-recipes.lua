-------------------------------------------------------------------------------
--NEXELIT PLATE
local nexelit_plate ={
  type = "recipe",
  name = "nexelit_plate",
  category = "advanced-foundry",
  enabled = "false",
  energy_required = 2,
	  ingredients ={
		{type="item", name="nexelit-ore", amount=2},
		{type="fluid", name="petroleum-gas", amount=15},
		{type="item", name="limestone", amount=2},
		{type="item", name="sand_casting", amount=1},
	  },
	  results=
	  {
		{type="item", name="nexelit_plate", amount=2},
	  },
  main_product= "nexelit_plate",
  icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
}



data:extend{
  nexelit_plate,  
}