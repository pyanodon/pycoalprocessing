-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe_treated_lumber= {
    type = "recipe",
    name = "treated-lumber",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 2,
    ingredients ={
      {type="fluid", name="creosote", amount=10},
      {type="item", name="raw-wood", amount=1},
    },
    results=
    {
      {type="item", name="treated-lumber", amount=4},
    },
    icons = {
      {icon = "__pycoalprocessing__/graphics/icons/treated-lumber.png"},
    },
    subgroup = "py-quenching-ores",
    order = "tailings-a",
}
-------------------------------------------------------------------------------
--[[Items]]--
local treated_lumber = {
  type = "item",
  name = "treated-lumber",
  icon = "__pycoalprocessing__/graphics/icons/treated-lumber.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "a[treated-lumber]",
  stack_size = 100
}
-------------------------------------------------------------------------------
--[[Entites]]--
------------------------------------------------------------------------------- 
--[[Extend Data]]--
data:extend({recipe_treated_lumber, treated_lumber})
