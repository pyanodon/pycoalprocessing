-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
{
  type = "recipe",
  name = "creosote",
  category = "tar",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="fluid", name="tar", amount=10},
  },
  results=
  {
    {type="fluid", name="creosote", amount=5},
  },
  main_product= "creosote",
  icon = "__pycoalprocessing__/graphics/icons/creosote.png",
  order = "c [syn-gas]",
}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "creosote",
  icon = "__pycoalprocessing__/graphics/icons/creosote.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.360, g = 0.250, b = 0.070},
  flow_color = {r = 0.360, g = 0.250, b = 0.070},
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
