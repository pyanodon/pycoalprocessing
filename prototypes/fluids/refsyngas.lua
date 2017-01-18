-------------------------------------------------------------------------------
--[[recipes]]--
local refsyngas_from_filtered_syngas= {
  type = "recipe",
  name = "refsyngas-from-filtered-syngas",
  category = "carbonfilter",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="syngas", amount=10},
    {type="item", name="active-carbon", amount=5},
  },
  results=
  {
    {type="fluid", name="refsyngas", amount=5},
  },
  --main_product= "refsyngas",
  icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
  subgroup = "py-syngas",
  order = "b-a[refsyn-gas]",
}

local refsyngas_from_meth = {
  type = "recipe",
  name = "refsyngas-from-meth",
  category = "rectisol",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="syngas", amount=10},
    {type="fluid", name="methanol", amount=10},
  },
  results=
  {
    {type="fluid", name="refsyngas", amount=10},
    {type="fluid", name="water", amount=3}, --bob hydrogen
    {type="fluid", name="carbon-dioxide", amount=2},
    {type="fluid", name="acidgas", amount=6},

  },
  --main_product= "refsyngas",
  icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
  subgroup = "py-syngas",
  order = "b-b-[refsyn-gas]",
}

local refsyngas_from_meth_canister = {
  type = "recipe",
  name = "refsyngas-from-meth-canister",
  category = "rectisol",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="syngas", amount=10},
    {type="item", name="filled-methanol-canister", amount=1},
  },
  results=
  {
    {type="fluid", name="refsyngas", amount=10},
    {type="fluid", name="water", amount=3}, --bob hydrogen
    {type="fluid", name="carbon-dioxide", amount=2},
    {type="fluid", name="acidgas", amount=6},
    {type="item", name="empty-methanol-canister", amount=1},

  },
  --main_product= "refsyngas",
  subgroup = "py-syngas",
  icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
  order = "b-c-[refsyn-gas]",
}

-------------------------------------------------------------------------------
--[[items]]--
local refsyngas =
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
--[[Extend Data]]--
data:extend({refsyngas, refsyngas_from_filtered_syngas, refsyngas_from_meth, refsyngas_from_meth_canister})
