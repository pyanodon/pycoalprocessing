-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1= {
	type = "recipe",
	name = "methanol-from-syngas",
	category = "methanol",
	enabled = "false",
	energy_required = 2,
	ingredients ={
	
		{type="fluid", name="syngas", amount=5},
		{type="item", name="copper-ore", amount=2},
		{type="item", name="zinc-ore", amount=1},
	},
	results=
	{
		{type="fluid", name="methanol", amount=4},
	},
	main_product= "methanol",
	icon = "__pycoalprocessing__/graphics/icons/methanol.png",
	order = "e [methanol]",
}

-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "methanol",
  icon = "__pycoalprocessing__/graphics/icons/methanol.png",
  default_temperature = 15,
  heat_capacity = "3KJ",
  base_color = {r = 0.231, g = 0.776, b = 0.333},
  flow_color = {r = 0.231, g = 0.776, b = 0.333},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
