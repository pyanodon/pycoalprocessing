--[[recipes]]--
local recipe1 =
{
     type = "recipe",
    name = "niobium-complex",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.0,
    ingredients ={
        {type="fluid", name="organic-solvent", amount=50},
		{type="fluid", name="hydrogen-chloride", amount=100},
		{type="item", name="niobium-concentrate", amount=10},
    },
    results={
        {type="fluid", name="niobium-complex", amount=100},
    },
	main_product= "niobium-complex",
    icon = "__pycoalprocessing__/graphics/icons/niobium-complex.png",
    subgroup = "py-fluid-handling",
    order = "c",
}
-------------------------------------------------------------------------------
--[[niobium-complex]]--
local item1=
{
    type = "fluid",
    name = "niobium-complex",
    icon = "__pycoalprocessing__/graphics/icons/niobium-complex.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.482, g = 0.607, b = 0.650},
    flow_color = {r = 0.482, g = 0.607, b = 0.650},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-fluid-handling",
    order = "z-[niobium-complex]"
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if item1 then data:extend({item1}) end
if recipe1 then data:extend({recipe1}) end
if entity1 then data:extend({entity1}) end
