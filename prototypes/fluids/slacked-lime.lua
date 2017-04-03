-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "slacked-lime",
  icon = "__pycoalprocessing__/graphics/icons/slacked-lime.png",
  default_temperature = 15,
  base_color = {r = 0.772, g = 0.772, b = 0.772},
  flow_color = {r = 0.772, g = 0.772, b = 0.772},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
	subgroup = "py-syngas",
	order = "z-[slacked-lime]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
