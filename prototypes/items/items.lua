-------------------------------------------------------------------------------
--NOT A GOOD NAME
local ash ={
  type = "item",
  name = "ash",
  icon = "__pycoalprocessing__/graphics/icons/ash.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "ash",
  stack_size = 100
}
-------------------------------------------------------------------------------
--CHROMIUM
local chromium ={
  type = "item",
  name = "chromium",
  icon = "__pycoalprocessing__/graphics/icons/chromium.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "chromium",
  stack_size = 100
}
--temporary for testing
local recipe_chromium = {
  type = "recipe",
  name = "chromium",
  category = "smelting",
  energy_required = 0.5,
  ingredients ={
    {type="item", name="steel-plate", amount=3},
  },
  result = "chromium"
}
-------------------------------------------------------------------------------
--NOT A GOOD NAME
local coke = {
  type = "item",
  name = "coke",
  fuel_value = "10MJ",
  icon = "__pycoalprocessing__/graphics/icons/coke.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "coke",
  stack_size = 500
}
-------------------------------------------------------------------------------
--NICHROME
local nichrome = {
  type = "item",
  name = "nichrome",
  icon = "__pycoalprocessing__/graphics/icons/nichrome.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "nichrome",
  stack_size = 200
}
-------------------------------------------------------------------------------
--IRON OXIDE
local iron_oxide = {
  type = "item",
  name = "iron-oxide",
  icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "iron-oxide",
  stack_size = 200
}

-------------------------------------------------------------------------------
--ACTIVE CARBON
local active_carbon = {
  type = "item",
  name = "active-carbon",
  fuel_value = "25MJ",
  icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "active-carbon",
  stack_size = 100
}
-------------------------------------------------------------------------------
--ZINC CHLORIDE
local zinc_chloride = {
  type = "item",
  name = "zinc-chloride",
  icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "zinc-chloride",
  stack_size = 100
}

-------------------------------------------------------------------------------
--TAILINGS DUST
local tailings_dust = {
  type = "item",
  name = "tailings-dust",
  icon = "__pycoalprocessing__/graphics/icons/coal_dirt_dust.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "tailings-dust",
  stack_size = 1000
}
-------------------------------------------------------------------------------
-- SOIL
local soil = {
  type = "item",
  name = "soil",
  icon = "__pycoalprocessing__/graphics/icons/soil.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "soil",
  stack_size = 1000
}
-------------------------------------------------------------------------------
-- NEXELIT-ORE
local nexelit_ore = {
  type = "item",
  name = "nexelit-ore",
  icon = "__pycoalprocessing__/graphics/icons/nexelit-ore.png",
  flags = {"goes-to-main-inventory"},
  order = "g",
  stack_size = 300
}
-------------------------------------------------------------------------------
-- DRILL-HEAD
local drill_head = {
  type = "item",
  name = "drill-head",
  icon = "__pycoalprocessing__/graphics/icons/drill-head.png",
  flags = {"goes-to-main-inventory"},
  order = "g",
  stack_size = 200
}
data:extend(
{
  ash,
  chromium,
  recipe_chromium,
  coke,
  nichrome,
  iron_oxide,
  active_carbon,
  zinc_chloride,
  tailings_dust,
  soil,
  nexelit_ore,
  drill_head
  }
)
