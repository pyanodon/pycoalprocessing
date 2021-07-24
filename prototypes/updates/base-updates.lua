
--(( TECHNOLOGY ))--
TECHNOLOGY("logistics-2"):remove_prereq("logistic-science-pack"):add_prereq("niobium"):add_prereq("lubricant")

TECHNOLOGY("railway"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("automobilism"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("electric-engine"):add_prereq("chemical-science-pack")

TECHNOLOGY("production-science-pack"):remove_prereq("productivity-module"):remove_prereq("advanced-material-processing-2"):remove_prereq("railway"):add_prereq("uranium-processing"):add_prereq("speed-module-2"):add_prereq("effectivity-module-2"):add_prereq("robotics"):add_prereq("filtration-2"):add_prereq("energy-3")

TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("robotics"):remove_prereq("advanced-electronics-2"):remove_prereq("low-density-structure"):add_prereq("automation-3"):add_prereq("kovarex-enrichment-process"):add_prereq("fusion-reactor-equipment"):add_prereq("destroyer")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("military-4"):add_prereq("production-science-pack")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("utility-science-pack"):add_prereq("production-science-pack")

TECHNOLOGY("explosives"):add_prereq("mukmoux")

TECHNOLOGY("electronics"):set_field{enabled = false}

TECHNOLOGY("automation-2"):remove_prereq('electronics')
TECHNOLOGY("fast-inserter"):remove_prereq('electronics'):add_prereq('automation')
TECHNOLOGY("solar-energy"):remove_prereq('electronics'):remove_prereq("steel-processing"):remove_prereq("optics")
TECHNOLOGY("electric-energy-distribution-1"):remove_prereq('electronics')
TECHNOLOGY("circuit-network"):remove_prereq('electronics')

TECHNOLOGY("coal-liquefaction"):set_field{ enabled = false}

TECHNOLOGY("oil-processing"):add_pack('chemical-science-pack'):add_prereq('chemical-science-pack'):remove_prereq('fluid-handling')

TECHNOLOGY("flammables"):add_pack('military-science-pack')

TECHNOLOGY("military-2"):remove_prereq("steel-processing")

TECHNOLOGY("engine"):remove_prereq("steel-processing")

TECHNOLOGY("advanced-electronics"):add_prereq("fast-inserter")

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
}

RECIPE("lubricant"):remove_unlock("lubricant")

RECIPE("flying-robot-frame"):remove_ingredient("electronic-circuit"):add_ingredient({type = "item", name = "advanced-circuit", amount = 1})

RECIPE("explosives"):remove_unlock("explosives")

RECIPE("battery"):remove_unlock("battery")

RECIPE {
    type = "recipe",
    name = "processing-unit",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "electronic-circuit", amount =  5},
        {type = "item", name = "advanced-circuit", amount = 2},
        {type = "fluid", name = "sulfuric-acid", amount = 5},
        {type = "item", name = "optical-fiber", amount = 1}
    },
    results = {
        {type = "item", name = "processing-unit", amount = 1}
    },
  }

  RECIPE {
    type = "recipe",
    name = "low-density-structure",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "item", name = "steel-plate", amount =  2},
        {type = "item", name = "plastic-bar", amount = 5},
        {type = "item", name = "niobium-plate", amount = 10}
    },
    results = {
        {type = "item", name = "low-density-structure", amount = 1}
    },
  }

--Science pack changes
RECIPE {
  type = "recipe",
  name = "production-science-pack",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 5,
  ingredients = {
      {type = "item", name = "saturated-nexelit-cartridge", amount = 2},
      {type = "item", name = "speed-module-2", amount = 2},
      {type = "item", name = "effectivity-module-2", amount = 2},
      {type = "item", name = "coal-briquette", amount = 5},
      {type = "item", name = "uranium-fuel-cell", amount = 1},
      {type = "item", name = "electric-engine-unit", amount = 4}
  },
  results = {
      {type = "item", name = "production-science-pack", amount = 3}
  },
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
        {type = "item", name = "utility-science-pack", amount = 4}
    },
  }

  --ENTITY

  data.raw.car.car.burner.fuel_category = "jerry"
  data.raw.car.car.burner.burnt_inventory_size = data.raw.car.car.burner.fuel_inventory_size
  data.raw.car.tank.burner.fuel_category = "jerry"
  data.raw.car.tank.burner.burnt_inventory_size = data.raw.car.tank.burner.fuel_inventory_size
  data.raw.locomotive.locomotive.burner.fuel_category = "jerry"
  data.raw.locomotive.locomotive.burner.burnt_inventory_size = data.raw.locomotive.locomotive.burner.fuel_inventory_size
