-------------------------------------------------------------------------------
--[[Recipes without new item results]]--
-------------------------------------------------------------------------------
--Create coal from wood
local raw_wood_to_coal = {
    type = "recipe",
    name = "raw-wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["raw-wood"].icon, tint={a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[raw-wood-to-coal]",
    ingredients = {
        {type="item", name="raw-wood", amount=1}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

local wood_to_coal = {
    type = "recipe",
    name = "wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["wood"].icon, tint = {a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[wood-to-coal]",
    ingredients = {
        {type="item", name="wood", amount=2}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

-------------------------------------------------------------------------------
--Extract sulfur from acidgas
local extract_sulfur ={
    type = "recipe",
    name = "extract-sulfur",
    category = "desulfurization",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="acidgas", amount=10,},
    },
    results={
        {type="item", name="sulfur", amount=2,},
    },
    main_product= "sulfur",
    icon = data.raw.item.sulfur.icon,
    subgroup = "py-items",
    order = "sulfur",
}

-------------------------------------------------------------------------------
--Turn warm water into cooled water
local cooling_water ={
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
--FLUEGAS TO SYNGAS
local fluegas_to_syngas ={
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
    --{type="fluid", name="hydrogen", amount=25},
	{type="fluid", name="water", amount=50},
	{type="fluid", name="refsyngas", amount=15},

  },
  results={
    {type="fluid", name="light-oil", amount=40},
	{type="fluid", name="water", amount=50, temperature=100},
	{type="fluid", name="carbon-dioxide", amount=20},
  },
  icon = "__pycoalprocessing__/graphics/icons/ref_to_light_oil.png",
  main_product= "light-oil",
  order = "c",
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
    --{type="fluid", name="hydrogen", amount=35},
	{type="fluid", name="water", amount=50},
	{type="fluid", name="refsyngas", amount=15},

  },
  results={
    {type="fluid", name="petroleum-gas", amount=60},
	{type="fluid", name="water", amount=50, temperature=100},
	{type="fluid", name="carbon-dioxide", amount=10},
  },
  icon = "__pycoalprocessing__/graphics/icons/ref_to_petroleum_gas.png",
  main_product= "petroleum-gas",
  order = "c",
}

-------------------------------------------------------------------------------
data:extend{
  raw_wood_to_coal, wood_to_coal, extract_sulfur, cooling_water, fluegas_to_syngas,
  ref_to_petroleum_gas, ref_to_light_oil, petgas_from_refsyngas, light_oil_from_syngas,
  heavy_oil_from_coal_gas,
}
