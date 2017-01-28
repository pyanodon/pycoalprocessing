-------------------------------------------------------------------------------
--heavy oil from coalgas
local heavy_oil_from_coal_gas ={
  type = "recipe",
  name = "heavy-oil_from_coal-gas",
  category = "olefin",
  enabled = "false",
  energy_required = 1.5,
  ingredients ={
    {type="fluid", name="coal-gas", amount=35,},
	{type="item", name="nichrome", amount=2,},
	{type="fluid", name="water", amount=40,},
  },
  results={
    {type="fluid", name="heavy-oil", amount=25,},
	{type="fluid", name="tar", amount=20,},
  },
  main_product= "heavy-oil",
  icon = "__base__/graphics/icons/fluid/heavy-oil.png",
  subgroup = "py-items",
  order = "Water",
}
-------------------------------------------------------------------------------
--light oil from syngas
local light_oil_from_syngas ={
  type = "recipe",
  name = "light-oil_from_syngas",
  category = "olefin",
  enabled = "false",
  energy_required = 1.5,
  ingredients ={
    {type="fluid", name="syngas", amount=30,},
	{type="item", name="nichrome", amount=2,},
	{type="fluid", name="water", amount=40,},
  },
  results={
    {type="fluid", name="light-oil", amount=30,},
	{type="fluid", name="olefin", amount=15,},
  },
  main_product= "light-oil",
  icon = "__base__/graphics/icons/fluid/light-oil.png",
  subgroup = "py-items",
  order = "Water",
}
-------------------------------------------------------------------------------
--petgas from refsyngas
local petgas_from_refsyngas ={
  type = "recipe",
  name = "petgas_from_refsyngas",
  category = "olefin",
  enabled = "false",
  energy_required = 1.5,
  ingredients ={
    {type="fluid", name="refsyngas", amount=25,},
	{type="item", name="nichrome", amount=2,},
	{type="fluid", name="light-oil", amount=15,},
  },
  results={
    {type="fluid", name="petroleum-gas", amount=40,},
	{type="fluid", name="olefin", amount=15,},
  },
  main_product= "petroleum-gas",
  icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
  subgroup = "py-items",
  order = "Water",
}
-------------------------------------------------------------------------------
--extract sulfur from acidgas
local recipe_extract_sulfur ={
  type = "recipe",
  name = "extract-sulfur",
  category = "dessulfurization",
  enabled = "false",
  energy_required = 1,
  ingredients ={
    {type="fluid", name="acidgas", amount=10,},
  },
  results={
    {type="item", name="sulfur", amount=2,},
  },
  main_product= "sulfur",
  --icon = "__base__/graphics/icons/sulfur.png",
  icon = data.raw.item.sulfur.icon,
  subgroup = "py-items",
  order = "sulfur",
}
-------------------------------------------------------------------------------
--Turn warm water into cooled water
local recipe_cooling_water ={
  type = "recipe",
  name = "cooling-water",
  category = "cooling",
  enabled = "false",
  energy_required = 1,
  ingredients ={
    {type="fluid", name="water", amount=5, temperature=100},
  },
  results={
    {type="fluid", name="water", amount=5, temperature=15},
  },
  main_product= "water",
  subgroup = "py-fluids",
  order = "water",
  icon = "__pycoalprocessing__/graphics/icons/cooling-water.png",

}
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
local recipe_nichrome = {
  type = "recipe",
  name = "nichrome",
  category = "hpf",
  energy_required = 2.5,
  ingredients ={
    {type="fluid", name="water", amount=10}, -- bob nitrogen
    {type="item", name="nickel-plate", amount=10},
    {type="item", name="chromium", amount=5},
  },
  result = "nichrome"
}
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--SHOULD SMELT DIRECTLY TO PLATE
--Iron ore is typically hidden as a product, smelt directly to iron plate instead
--2x iron-oxide = 1x iron-plate in the same time it takes 1x iron-ore -> 1x plate
local iron_oxide = {
  type = "item",
  name = "iron-oxide",
  icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
  flags = {"goes-to-main-inventory"},
  subgroup = "py-items",
  order = "iron-oxide",
  stack_size = 200
}
local recipe_iron_oxide = {
  type = "recipe",
  name = "iron-oxide",
  category = "smelting",
  energy_required = 3.5,
  ingredients = {{"iron-oxide", 2}},
  result = "iron-plate"
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

local recipe_active_carbon = {
  type = "recipe",
  name = "active-carbon",
  category = "hpf",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="water", amount=10}, -- bob nitrogen
    {type="item", name="zinc-chloride", amount=2},
    {type="item", name="coke", amount=25},
    --{type="item", name="sodium-hydroxide", amount=5},
  },
  results={
    {type="item", name="active-carbon", amount=2},
  },
  icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
  main_product= "active-carbon",
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
local recipe_zinc_chloride = {
  type = "recipe",
  name = "zinc-chloride",
  category = "chemistry",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="water", amount=2}, --bob hydrogen-chloride
    {type="item", name="iron-plate", amount=1}, --bob zinc-plate
    {type="item", name="copper-plate", amount=1}, --bob --remove
  },
  results={
    {type="item", name="zinc-chloride", amount=1},
    --{type="fluid", name="hydrogen", amount=2}, --bob hydrogen
  },
  main_product = "zinc-chloride",
  icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
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
local recipe_tailings_dust = {
  type = "recipe",
  name = "tailings-dust",
  category = "evaporator",
  enabled = "false",
  energy_required = 6,
  ingredients ={
    {type="fluid", name="dirty-water", amount=10},
  },
  results={
    {type="item", name="tailings-dust", amount=6},
    --{type="fluid", name="water", amount=4, temperature=100}
  },
  main_product = "tailings-dust",
  icon = "__pycoalprocessing__/graphics/icons/coal_dirt_dust.png",
}
-------------------------------------------------------------------------------
--FLUE GAS TO SYN GAS

local recipe_fluegas_to_syngas ={
  type = "recipe",
  name = "fluegas_to_syngas",
  category = "carbonfilter",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="flue-gas", amount=300},
    {type="item", name="active-carbon", amount=5},

  },
  results={
    {type="fluid", name="syngas", amount=30},
  },
  subgroup = "py-syngas",
  order = "fluegas_to_syngas",
  icon = "__pycoalprocessing__/graphics/icons/fluegas_to_syngas.png",
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
local recipe_soil ={
  type = "recipe",
  name = "soil",
  category = "soil-extraction",
  enabled = "false",
  energy_required = 1,
  ingredients ={
    {type="fluid", name="water", amount=100},
  },
  results={
    {type="item", name="soil", amount=5},
  },
  subgroup = "py-items",
  order = "soil",
  icon = "__pycoalprocessing__/graphics/icons/soil.png",
}


data:extend(
{
  recipe_extract_sulfur,
  recipe_cooling_water,
  ash,
  coke,
  iron_oxide,
  recipe_iron_oxide,
  active_carbon,
  recipe_active_carbon,
  zinc_chloride,
  recipe_zinc_chloride,
  recipe_fluegas_to_syngas,
  recipe_tailings_dust,
  tailings_dust,
  heavy_oil_from_coal_gas,
  light_oil_from_syngas,
  petgas_from_refsyngas,
  nichrome,
  chromium,
  recipe_chromium,
  recipe_nichrome,
  soil,
  recipe_soil
  }
)
