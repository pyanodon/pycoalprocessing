
--(( TECHNOLOGY ))--
TECHNOLOGY("logistics-2"):remove_prereq("logistic-science-pack"):add_prereq("fine-electronics"):add_prereq("chromium"):add_prereq("advanced-electronics"):add_prereq("lubricant")

TECHNOLOGY("railway"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("automobilism"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("electric-engine"):add_prereq("chemical-science-pack")

TECHNOLOGY("production-science-pack"):remove_prereq("productivity-module"):remove_prereq("advanced-material-processing-2"):remove_prereq("railway"):add_prereq("uranium-processing"):add_prereq("speed-module-2"):add_prereq("effectivity-module-2"):add_prereq("robotics"):add_prereq("filtration-2"):add_prereq("energy-3")

TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("robotics"):remove_prereq("advanced-electronics-2"):remove_prereq("low-density-structure"):add_prereq("automation-3"):add_prereq("kovarex-enrichment-process"):add_prereq("fusion-reactor-equipment"):add_prereq("destroyer")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("military-4"):add_prereq("production-science-pack")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("utility-science-pack"):add_prereq("production-science-pack")

TECHNOLOGY("explosives"):remove_prereq("sulfur-processing"):add_prereq("mukmoux")

--(( RECIPES ))--
RECIPE{
    type = "recipe",
    name = "fast-transport-belt",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
    {
      {name = "iron-gear-wheel", amount = 2},
      {name = "transport-belt", amount = 2},
      {name = "nbfe-alloy", amount = 1},
      {type = "fluid", name = "lubricant", amount = 10}
    },
    results =
    {
        {name =  "fast-transport-belt", amount = 2}
    }
  }

RECIPE{
    type = "recipe",
    name = "fast-underground-belt",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
        {name = "underground-belt", amount = 2},
        {name = "iron-gear-wheel", amount = 10},
        {name = "nbfe-alloy", amount = 1},
        {name = "chromium", amount = 1},
    },
    results =
    {
        {name =  "fast-underground-belt", amount = 2}
    }
  }

RECIPE{
    type = "recipe",
    name = "fast-splitter",
    energy_required = 2,
    enabled = false,
    ingredients =
    {
        {name = "splitter", amount = 1},
        {name = "iron-gear-wheel", amount = 5},
        {name = "advanced-circuit", amount = 2},
        {name = "nbfe-alloy", amount = 1},
        {name = "chromium", amount = 1},
    },
    results =
    {
        {name =  "fast-splitter", amount = 1}
    }
}

RECIPE {
  type = "recipe",
  name = "electric-engine-unit",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 1,
  ingredients = {
      {type = "item", name = "iron-stick", amount =  1},
      {type = "item", name = "copper-cable", amount = 100},
      {type = "item", name = "electronic-circuit", amount =  3},
      {type = "fluid", name = "lubricant", amount = 50},
  },
  results = {
      {type = "item", name = "electric-engine-unit", amount = 1}
  },
  --icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
  --icon_size = 32
}--:add_unlock("placeholder")

RECIPE("lubricant"):remove_unlock("lubricant")

RECIPE("flying-robot-frame"):remove_ingredient("electronic-circuit"):add_ingredient({type = "item", name = "advanced-circuit", amount = 1})

RECIPE("explosives"):remove_unlock("explosives")

RECIPE("battery"):remove_unlock("battery")

--Science pack changes
RECIPE {
  type = "recipe",
  name = "production-science-pack",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 5,
  ingredients = {
      {type = "item", name = "saturated-nexelit-cartridge", amount = 2},
      {type = "item", name = "speed-module-2", amount = 1},
      {type = "item", name = "effectivity-module-2", amount = 1},
      {type = "item", name = "coal-briquette", amount = 5},
      {type = "item", name = "uranium-fuel-cell", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 2}
  },
  results = {
      {type = "item", name = "production-science-pack", amount = 2}
  },
  --icon = "__pycoalprocessinggraphics__/graphics/icons/crush-niobium.png",
  --icon_size = 32,
  --main_product = "niobium-powder",
  --subgroup = "py-crusher",
  --order = "a"
}

RECIPE {
    type = "recipe",
    name = "utility-science-pack",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "assembling-machine-3", amount = 2},
        {type = "item", name = "nuclear-fuel", amount = 3},
        {type = "item", name = "fusion-reactor-equipment", amount = 1},
        {type = "item", name = "destroyer-capsule", amount = 4}
    },
    results = {
        {type = "item", name = "utility-science-pack", amount = 3}
    },
    --icon = "__pycoalprocessinggraphics__/graphics/icons/crush-niobium.png",
    --icon_size = 32,
    --main_product = "niobium-powder",
    --subgroup = "py-crusher",
    --order = "a"
  }
