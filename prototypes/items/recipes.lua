--Stuff from bobs:
--hydrogen-chloride, hydrogen, zinc-plate, carbon, nitrogen, sodium-hydroxide, zinc-ore, alumina

local extract_sulfur ={
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
  icon = "__base__/graphics/icons/sulfur.png",
  order = "d [syn-gas]",
}

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
  icon = "__pycoalprocessing__/graphics/icons/cooling-water.png",
  order = "d [syn-gas]",
}

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

local tar_carbon = {
  type = "recipe",
  name = "tar-carbon",
  category = "tar",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="tar", amount=2},
  },
  results={
    {type="item", name="carbon", amount=1},
  },
  main_product= "carbon",
  icon = "__bobplates__/graphics/icons/carbon.png",
  order = "d [syn-gas]",
}

local active_carbon = {
  type = "recipe",
  name = "active-carbon",
  category = "hpf",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="nitrogen", amount=10},
    {type="item", name="zinc-chloride", amount=2},
    {type="item", name="coke", amount=25},
    {type="item", name="sodium-hydroxide", amount=15},
  },
  results={
    {type="item", name="active-carbon", amount=2},
  },
  main_product= "active-carbon",
  icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
  order = "d [syn-gas]",
}



--Iron ore is typically hidden as a product, smelt directly to iron plate instead
--2x iron-oxide = 1x iron-plate in the same time it takes 1x iron-ore -> 1x plate
local iron_oxide = {
  type = "recipe",
  name = "iron-oxide",
  category = "smelting",
  energy_required = 3.5,
  ingredients = {{"iron-oxide", 2}},
  result = "iron-plate"
}

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

data:extend({
  zinc_chloride, tar_carbon, active_carbon, iron_oxide, cooling_water, salt_ex, extract_sulfur,
})
