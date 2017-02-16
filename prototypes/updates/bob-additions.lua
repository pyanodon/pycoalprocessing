--luacheck: globals bobmods

--bob mods is present, add hydrogen processing
local methanol_from_hydrogen = {
  type = "recipe",
  name = "methanol-from-hydrogen",
  category = "methanol",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="fluid", name="carbon-dioxide", amount=3},
    {type="fluid", name="hydrogen", amount=5},
    {type="item", name="zinc-ore", amount=1},
    {type="item", name="alumina", amount=2}, },
  results=
  {
    {type="fluid", name="methanol", amount=4},
  },
  --main_product= "methanol",
  subgroup = "py-methanol",
  icon = "__pycoalprocessing__/graphics/icons/methanol.png",
  order = "b-[methanol]",
}

local syngas_from_coal_oxygen = {
  type = "recipe",
  name = "syngas2",
  category = "gasifier",
  enabled = "false",
  energy_required = 3,
  ingredients ={
    {type="fluid", name="coal-gas", amount=4},
    {type="fluid", name="oxygen", amount=5},
    {type="fluid", name="water", amount=10},
  },
  results=
  {
    {type="fluid", name="syngas", amount=7},
    {type="fluid", name="tar", amount=3},
    {type="item", name="ash", amount=1}
  },
  --main_product= "syngas",
  icon = "__pycoalprocessing__/graphics/icons/syngas.png",
  subgroup = "py-syngas",
  order = "a-b-[syn-gas]",
}

--uses bob_carbon
local recipe_tar_carbon = {
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
  subgroup = "py-items",
  order = "carbon",
  icon = data.raw.item.carbon.icon,
  --"__bobplates__/graphics/icons/carbon.png",
}

local recipe_salt_ex = {
  type = "recipe",
  name = "salt-ex",
  category = "evaporator",
  enabled = "false",
  energy_required = 4,
  ingredients ={
    {type="fluid", name="water-saline", amount=10},
  },
  results={
    {type="item", name="salt", amount=1, probability=0.4},
  },
  main_product = "salt",
  subgroup = "py-items",
  order = "salt",
  icon = "__pycoalprocessing__/graphics/icons/salt.png",

}

local void_flue_gas = {
  type = "recipe",
  name = "void-flue-gas",
  category = "void-fluid",
  enabled = "false",
  hidden = "true",
  energy_required = 1,
  ingredients =
  {
    {type="fluid", name="flue-gas", amount=2}
  },
  results=
  {
    {type="item", name="void", amount=1, probability=0},
  },
  subgroup = "void",
  icon = "__pycoalprocessing__/graphics/icons/flue-gas.png",
  order = "flue-gas"
}

data:extend({methanol_from_hydrogen, recipe_tar_carbon, recipe_salt_ex, syngas_from_coal_oxygen, void_flue_gas})

bobmods.lib.tech.add_recipe_unlock("void-fluid", "void-flue-gas")
bobmods.lib.tech.add_recipe_unlock("methanol-processing-2", "methanol-from-hydrogen")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "syngas2")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "salt-ex")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tar-carbon")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-nickel-zinc")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-tin-lead")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gold-silver")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-bauxite-cobalt")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-rutile-tungsten")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gem-ore")
