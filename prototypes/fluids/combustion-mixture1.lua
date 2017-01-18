-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
	{
	  type = "recipe",
	  name = "combustion-mixture1",
	  category = "combustion",
	  enabled = "false",
	  energy_required = 2,
	  ingredients ={
		{type="fluid", name="refsyngas", amount=5},
		{type="fluid", name="water", amount=20},
	  },
	  results=
	  {
		{type="fluid", name="combustion-mixture1", amount=12},
		{type="fluid", name="water", amount=20, temperature=100},
	  },
	  main_product= "combustion-mixture1",
	  icon = "__pycoalprocessing__/graphics/icons/combustion-mixture1.png",
	  --order = "b-c [syn-gas]",
	}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "combustion-mixture1",
  icon = "__pycoalprocessing__/graphics/icons/combustion-mixture1.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.811, g = 0.325, b = 0.0},
  flow_color = {r = 0.811, g = 0.325, b = 0.0},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
	subgroup = "py-syngas",
	order = "z-[combustion-mixture1]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
