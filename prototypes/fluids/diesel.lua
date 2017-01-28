-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
	{
	  type = "recipe",
	  name = "diesel",
	  category = "olefin",
	  enabled = "false",
	  energy_required = 2,
	  ingredients ={
		{type="item", name="chromium", amount=2},
		{type="fluid", name="methanol", amount=15},
		{type="fluid", name="carbon-dioxide", amount=20},
	  },
	  results=
	  {
		{type="fluid", name="diesel", amount=15},
		{type="fluid", name="olefin", amount=10},
	  },
	  main_product= "diesel",
	  icon = "__pycoalprocessing__/graphics/icons/diesel.png",
	  --order = "b-c [syn-gas]",
	}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "diesel",
  icon = "__pycoalprocessing__/graphics/icons/diesel.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.5, g = 0.210, b = 0.023},
  flow_color = {r = 0.5, g = 0.210, b = 0.023},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
	subgroup = "py-syngas",
	order = "z-[diesel]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
