-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
	{
	  type = "recipe",
	  name = "olefin",
	  category = "olefin",
	  enabled = "false",
	  energy_required = 2,
	  ingredients ={
		{type="item", name="chromium", amount=2},
		{type="fluid", name="hydrogen", amount=60},
		{type="fluid", name="carbon-dioxide", amount=20},
	  },
	  results=
	  {
		{type="fluid", name="olefin", amount=20},
	  },
	  main_product= "olefin",
	  icon = "__pycoalprocessing__/graphics/icons/olefin.png",
	  --order = "b-c [syn-gas]",
	}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "olefin",
  icon = "__pycoalprocessing__/graphics/icons/olefin.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.6, g = 0.388, b = 0.745},
  flow_color = {r = 0.6, g = 0.388, b = 0.745},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
	subgroup = "py-syngas",
	order = "z-[olefin]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
