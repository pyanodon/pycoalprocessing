-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=
{
    type = "recipe",
    name = "recsyngas",
    category = "rectisol",
    enabled = "false",
    energy_required = 4,
    ingredients ={

      {type="fluid", name="syngas", amount=10},
      -- {type="fluid", name="methanol", amount=10},
    },
    results=
    {
      {type="fluid", name="refsyngas", amount=10},
      {type="fluid", name="hydrogen", amount=3},
      {type="fluid", name="carbon-dioxide", amount=2},
      {type="fluid", name="acidgas", amount=6},
    },
    main_product= "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
    order = "e [refsyn-gas]",
}

local recipe2=  {
    type = "recipe",
    name = "filtersyngas",
    category = "carbonfilter",
    enabled = "false",
    energy_required = 4,
    ingredients ={
      {type="fluid", name="syngas", amount=10},
    },
    results=
    {
      {type="fluid", name="refsyngas", amount=4},
    },
    main_product= "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
    order = "d [refsyn-gas]",
  }

-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "refsyngas",
  icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.8, g = 0.239, b = 0.129},
  flow_color = {r = 0.8, g = 0.239, b = 0.129},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity11=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1, recipe2}) end
if item1 then data:extend({item1}) end
if entity11 then data:extend({entity11}) end
