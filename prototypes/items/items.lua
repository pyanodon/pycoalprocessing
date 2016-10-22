--NOT A GOOD NAME
local ash ={
  type = "item",
  name = "ash",
  icon = "__pycoalprocessing__/graphics/icons/ash.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "c[coal-processing]",
  stack_size = 100
}

--SHOULD SMELT DIRECTLY TO PLATE
local iron_oxide = {
  type = "item",
  name = "iron-oxide",
  icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "a[coal-processing]",
  stack_size = 200
}

--NOT A GOOD NAME
local coke = {
  type = "item",
  name = "coke",
  fuel_value = "10MJ",
  icon = "__pycoalprocessing__/graphics/icons/coke.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "b[coal-processing]",
  stack_size = 500
}

local active_carbon = {
  type = "item",
  name = "active-carbon",
  fuel_value = "25MJ",
  icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "b[coal-processing]",
  stack_size = 100
}

local zinc_chloride = {
  type = "item",
  name = "zinc-chloride",
  icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "coal-processing",
  order = "c[coal-processing]",
  stack_size = 100
}

data:extend({ash, coke, iron_oxide, active_carbon, zinc_chloride})
