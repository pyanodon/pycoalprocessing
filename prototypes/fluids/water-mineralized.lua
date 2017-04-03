-------------------------------------------------------------------------------
--[[MINERALIZED WATER COPIED FROM ANGELS]]--
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
    type = "fluid",
    name = "water-mineralized",
    icon = "__pycoalprocessing__/graphics/icons/water-mineralized.png",
	default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r = 0.7, g = 0.7, b = 0.6},
    flow_color = {r = 0.7, g = 0.7, b = 0.6},
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
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end