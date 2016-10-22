-------------------------------------------------------------------------------
--[[Recipes]]--
---make empty canister in assembly machine.
local recipe_canister = {
type = "recipe",
name = "methanol-canister",
category = "crafting",
enabled=false,
energy_required = 3,
ingredients = {
{type="item", name="steel-plate", amount = 2}, --bob aluminium-plate
{type="item", name="copper-plate", amount = 1}, -- bob brass-plate
},
results = {
  {type = "item", name = "empty-methanol-canister", amount = 1},
},
icon = "__pycoalprocessing__/graphics/icons/canister.png",
order = "c [methanol]",
}

local recipe_fill_canister = {
  type = "recipe",
  name = "fill-methanol-canister",
  catgory = "crafting-with-fluid", --bob bob-pump
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="fluid", name="methanol", amount=10},
    {type="item", name="empty-methanol-canister", amount=1},
  },
  results=
  {
    {type="item", name="filled-methanol-canister", amount=1}
  },
  icon = "__pycoalprocessing__/graphics/icons/canister.png",
  order = "c [methanol]",
}

-- empty canister
--duplicate recipe for use directly in rectisol
local recipe_empty_canister = {
  type = "recipe",
  name = "empty-methanol-canister",
  category = "crafting-with-fluid",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="item", name="filled-methanol-canister", amount=1},
  },
  results=
  {
    {type="item", name="empty-methanol-canister", amount=1},
    {type="fluid", name="methanol", amount=10},
  },
  main_product= "methanol",
  icon = "__pycoalprocessing__/graphics/icons/canister.png",
  order = "d [methanol]",
}
-------------------------------------------------------------------------------
--[[Items]]--
local empty_canister = {
  type = "item",
  name = "empty-methanol-canister",
  icon = "__pycoalprocessing__/graphics/icons/canister.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "c[coal-processing]",
  stack_size = 100
}

local filled_canister = {
  type = "item",
  name = "filled-methanol-canister",
  icon = "__pycoalprocessing__/graphics/icons/canister.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "c[coal-processing]",
  stack_size = 100
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({empty_canister, filled_canister, recipe_fill_canister, recipe_empty_canister, recipe_canister})
