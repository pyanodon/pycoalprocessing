-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
{
  type = "recipe",
  name = "tailings",
  category = "quenching-tower",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="tar", amount=20},
    {type="fluid", name="water", amount=50},
  },
  results=
  {
    {type="fluid", name="dirty-water", amount=65},
    {type="fluid", name="flue-gas", amount=15},
    {type="item", name="zinc-ore", amount=1, probability=0.4},
    {type="item", name="lead-ore", amount=1, probability=0.4},
    {type="item", name="salt", amount=1},
  },
  main_product= "dirty-water",
  icon = "__pycoalprocessing__/graphics/icons/dirty-water.png",
  order = "e [syn-gas]",
}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "dirty-water",
  icon = "__pycoalprocessing__/graphics/icons/dirty-water.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.176, g = 0.054, b = 0.054},
  flow_color = {r = 0.176, g = 0.054, b = 0.054},
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
