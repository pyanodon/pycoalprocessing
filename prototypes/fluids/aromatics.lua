-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
	{
	  type = "recipe",
	  name = "aromatics",
	  category = "olefin",
	  enabled = "false",
	  energy_required = 2,
	  ingredients ={
		{type="item", name="chromium", amount=2},
		{type="fluid", name="olefin", amount=20},
		{type="fluid", name="water", amount=20},
	  },
	  results=
	  {
		{type="fluid", name="aromatics", amount=15},
		{type="fluid", name="hydrogen", amount=10},
	  },
	  main_product= "aromatics",
	  icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
	  --order = "b-c [syn-gas]",
	}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "aromatics",
  icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.74, g = 0.403, b = 0.388},
  flow_color = {r = 0.74, g = 0.403, b = 0.388},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
	subgroup = "py-syngas",
	order = "z-[aromatics]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
