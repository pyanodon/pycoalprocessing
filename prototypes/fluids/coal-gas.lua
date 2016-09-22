-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
{
  type = "recipe",
  name = "coal-gas",
  category = "distilator",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="item", name="coal", amount=10},
  },
  results=
  {
    {type="fluid", name="coal-gas", amount=4},
    {type="fluid", name="tar", amount=5},
    {type="item", name="iron-oxide", amount=1, probability=0.5},
    {type="item", name="coke", amount=4},
  },
  main_product= "coal-gas",
  icon = "__pycoalprocessing__/graphics/icons/coalgas.png",
  order = "a [coal-gas]",
}
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "coal-gas",
  icon = "__pycoalprocessing__/graphics/icons/coalgas.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.921, g = 0.776, b = 0.541},
  flow_color = {r = 0.921, g = 0.776, b = 0.541},
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
