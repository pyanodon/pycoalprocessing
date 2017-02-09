--Stuff from bobs:
--hydrogen-chloride, hydrogen, zinc-plate, carbon, nitrogen, sodium-hydroxide, zinc-ore, alumina

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
--ZINC CHLORIDE

local zinc_chloride ={
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
  main_product= "zinc-chloride",
  icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
  order = "d [syn-gas]",
}
-------------------------------------------------------------------------------
--CARBON FROM TAR
local tar_carbon = {
  type = "recipe",
  name = "tar-carbon",
  category = "tar",
  enabled = "false",
  energy_required = 0.75,
  ingredients ={
    {type="fluid", name="tar", amount=10},
  },
  results={
    {type="item", name="carbon", amount=4},
  },
  main_product= "carbon",
  icon = "__bobplates__/graphics/icons/carbon.png",
  order = "d [syn-gas]",
}
-------------------------------------------------------------------------------
--ACTIVE CARBON
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
--HEAVY OIL FROM COALGAS
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
--LIGHT OIL FROM SYNGAS
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
--PETGAS FROM REFSYNGAS
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
--REFINED SYNGAS TO LIGHT OIL
local ref_to_light_oil = {
  type = "recipe",
  name = "ref_to_light_oil",
  category = "fts-reactor",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="hydrogen", amount=25},
	{type="fluid", name="water", amount=50},
	{type="fluid", name="refsyngas", amount=15},
	
  },
  results={
    {type="fluid", name="light-oil", amount=40},
	{type="fluid", name="water", amount=50, temperature=70},
	{type="fluid", name="carbon-dioxide", amount=20},
  },
  icon = "__pycoalprocessing__/graphics/icons/ref_to_light_oil.png",
  order = "d [syn-gas]",
}
-------------------------------------------------------------------------------
--REFINED SYNGAS TO PETROLEUM GAS
local ref_to_petroleum_gas = {
  type = "recipe",
  name = "ref_to_petroleum_gas",
  category = "fts-reactor",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="hydrogen", amount=35},
	{type="fluid", name="water", amount=50},
	{type="fluid", name="refsyngas", amount=15},
	
  },
  results={
    {type="fluid", name="petroleum-gas", amount=60},
	{type="fluid", name="water", amount=50, temperature=70},
	{type="fluid", name="carbon-dioxide", amount=10},
  },
  icon = "__pycoalprocessing__/graphics/icons/ref_to_petroleum_gas.png",
  order = "d [syn-gas]",
}
-------------------------------------------------------------------------------
--IRON OXIDE TO IRON PLATE
local iron_oxide = {
  type = "recipe",
  name = "iron-oxide",
  category = "smelting",
  energy_required = 3.5,
  ingredients = {{"iron-oxide", 2}},
  result = "iron-plate"
}
-------------------------------------------------------------------------------
--EXTRACTION OF SALT
local salt_ex = {
  type = "recipe",
  name = "salt-ex",
  category = "evaporator",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="water-saline", amount=10},
  },
  results={
    {type="item", name="salt", amount=1},
  },
  main_product= "salt",
  icon = "__pycoalprocessing__/graphics/icons/salt.png",
  order = "d [syn-gas]",
}
-------------------------------------------------------------------------------
--TAILINGS DUST
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
-- EXTRACT SOIL
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
-------------------------------------------------------------------------------
-- NICHROME
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
-- DRILL-HEAD
local recipe_drill_head = {
  type = "recipe",
  name = "drill-head",
  category = "assembly",
  energy_required = 3,
  ingredients ={
    {type="item", name="steel-plate", amount=8},
    {type="item", name="chromium", amount=5},
	{type="item", name="titanium-plate", amount=5},
  },
  results={
    {type="item", name="drill-head", amount=2},
	},
}


data:extend({
  recipe_extract_sulfur,
  recipe_cooling_water,
  zinc_chloride,
  tar_carbon,
  recipe_active_carbon,
  heavy_oil_from_coal_gas,
  light_oil_from_syngas,
  petgas_from_refsyngas,
  ref_to_light_oil,
  ref_to_petroleum_gas,
  iron_oxide,
  salt_ex,
  recipe_tailings_dust,
  recipe_fluegas_to_syngas,
  recipe_soil,
  recipe_nichrome,
  recipe_drill_head
})
