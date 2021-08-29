
--(( TECHNOLOGY ))--
TECHNOLOGY("logistics-2"):remove_prereq("logistic-science-pack"):add_prereq("niobium"):add_prereq("lubricant")

TECHNOLOGY("railway"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("automobilism"):remove_prereq("logistics-2"):add_prereq("plastics")

TECHNOLOGY("electric-engine"):add_prereq("chemical-science-pack")

TECHNOLOGY("chemical-science-pack"):remove_prereq("advanced-electronics")

TECHNOLOGY("production-science-pack"):remove_prereq("productivity-module"):remove_prereq("advanced-material-processing-2"):remove_prereq("railway"):add_prereq("uranium-processing"):add_prereq("speed-module-2"):add_prereq("effectivity-module-2"):add_prereq("electric-engine"):add_prereq("energy-3")

TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("robotics"):remove_prereq("advanced-electronics-2"):remove_prereq("low-density-structure"):add_prereq("automation-3"):add_prereq("kovarex-enrichment-process"):add_prereq("fusion-reactor-equipment"):add_prereq("destroyer")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("military-4"):add_prereq("production-science-pack"):remove_prereq("speed-module")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack"):remove_prereq("utility-science-pack"):add_prereq("production-science-pack"):add_prereq('low-density-structure')

TECHNOLOGY("explosives"):add_prereq("mukmoux")

TECHNOLOGY("electronics"):set_fields{enabled = false}:set_fields{hidden = true}

TECHNOLOGY("automation-2"):remove_prereq('electronics'):remove_prereq("steel-processing"):add_prereq('automation')
TECHNOLOGY("fast-inserter"):remove_prereq('electronics'):add_prereq('automation')
TECHNOLOGY("solar-energy"):remove_prereq('electronics'):remove_prereq("steel-processing"):remove_prereq("optics")
TECHNOLOGY("electric-energy-distribution-1"):remove_prereq('electronics')
TECHNOLOGY("circuit-network"):remove_prereq('electronics')

TECHNOLOGY("military-2"):remove_prereq("steel-processing")

TECHNOLOGY("engine"):remove_prereq("steel-processing")

TECHNOLOGY("advanced-electronics"):add_prereq("fast-inserter")

TECHNOLOGY("concrete"):remove_prereq("advanced-material-processing"):remove_prereq("automation-2"):add_prereq("separation"):add_prereq("logistic-science-pack")

TECHNOLOGY("rocket-fuel"):remove_prereq("advanced-oil-processing")

TECHNOLOGY("rocket-control-unit"):remove_prereq('speed-module')

TECHNOLOGY("automation-3"):remove_prereq('speed-module'):add_prereq('stack-inserter')

TECHNOLOGY("kovarex-enrichment-process"):remove_prereq('uranium-processing')

TECHNOLOGY("electric-engine"):remove_prereq('concrete')

TECHNOLOGY("logistics-3"):remove_prereq('lubricant'):add_prereq('logistics-2')

TECHNOLOGY("advanced-material-processing"):remove_prereq("steel-processing"):add_prereq('crusher'):remove_prereq('logistic-science-pack')

TECHNOLOGY("stack-inserter"):remove_prereq("logistics-2"):remove_prereq("fast-inserter")

TECHNOLOGY("advanced-material-processing-2"):remove_prereq("advanced-material-processing")

TECHNOLOGY("low-density-structure"):remove_prereq("advanced-material-processing")

TECHNOLOGY("fluid-wagon"):remove_prereq("fluid-handling")

TECHNOLOGY("laser"):remove_prereq("optics")

TECHNOLOGY("rocketry"):remove_prereq('military-science-pack')

TECHNOLOGY("braking-force-3"):add_prereq('production-science-pack')

TECHNOLOGY("braking-force-6"):add_prereq('utility-science-pack')

TECHNOLOGY("worker-robots-speed-3"):remove_pack('utility-science-pack'):add_pack('production-science-pack'):add_prereq('production-science-pack')

TECHNOLOGY("worker-robots-speed-4"):remove_pack('utility-science-pack'):add_pack('production-science-pack')

TECHNOLOGY("worker-robots-speed-5"):add_prereq('utility-science-pack')

TECHNOLOGY("mining-productivity-2"):add_prereq('chemical-science-pack')

TECHNOLOGY("mining-productivity-3"):add_prereq('utility-science-pack')

TECHNOLOGY("mining-productivity-4"):add_prereq('space-science-pack')

TECHNOLOGY("worker-robots-storage-2"):add_prereq('production-science-pack')

TECHNOLOGY("worker-robots-storage-3"):add_prereq('utility-science-pack')

TECHNOLOGY("research-speed-3"):add_prereq('chemical-science-pack')

TECHNOLOGY("research-speed-5"):add_prereq('production-science-pack')

TECHNOLOGY("research-speed-6"):add_prereq('utility-science-pack')

TECHNOLOGY("inserter-capacity-bonus-3"):add_prereq('chemical-science-pack')

TECHNOLOGY("inserter-capacity-bonus-4"):add_prereq('production-science-pack')

TECHNOLOGY("inserter-capacity-bonus-7"):add_prereq('utility-science-pack')

--(( RECIPES ))--

RECIPE{
  type = "recipe",
  name = "small-electric-pole-2",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 2,
  ingredients =
    {
      {type = "item", name = "treated-wood", amount = 3},
      {type = "item", name = "copper-cable", amount = 3},
    },
  results =
    {
        {type = "item", name = "small-electric-pole", amount = 3}
    }
}:add_unlock("wood-processing")

RECIPE{
  type = "recipe",
  name = "concrete",
  category = "crafting-with-fluid",
  enabled = false,
  ingredients =
    {
      {name = "lime", amount = 5},
      {name = "sand", amount = 10},
      {name = "gravel", amount = 10},
      {type = "fluid", name = "water", amount = 100}
    },
    results =
    {
        {name =  "concrete", amount = 5}
    }
  }

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
        --{type = "item", name = "electronic-circuit", amount =  5},
        {type = "item", name = "advanced-circuit", amount = 2},
        {type = "fluid", name = "sulfuric-acid", amount = 5},
        {type = "item", name = "optical-fiber", amount = 2}
    },
    results = {
        {type = "item", name = "processing-unit", amount = 2}
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
        {type = "item", name = "utility-science-pack", amount = 8}
    },
  }

  RECIPE{
    type = "recipe",
    name = "fusion-reactor-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"processing-unit", 25},
      {"low-density-structure", 10}
    },
    result = "fusion-reactor-equipment"
  }

  RECIPE{
    type = "recipe",
    name = "distractor-capsule",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"defender-capsule", 2},
      {"advanced-circuit", 2}
    },
    result = "distractor-capsule",
    result_count = 2
  }

  RECIPE{
    type = "recipe",
    name = "destroyer-capsule",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"distractor-capsule", 2},
      {"speed-module", 1}
    },
    result = "destroyer-capsule",
    result_count = 2
  }

  RECIPE{
    type = "recipe",
    name = "assembling-machine-3",
    enabled = false,
    ingredients =
    {
      --{"speed-module", 2},
      {"stack-inserter", 2},
      {"assembling-machine-2", 2}
    },
    result = "assembling-machine-3"
  }

  -------

  RECIPE{
    type = "recipe",
    name = "rocket-fuel",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients =
      {
        {type = "fluid", name = "hydrogen-peroxide", amount = 80},
        {type = "fluid", name = "methanol", amount = 20}
      },
    result = "rocket-fuel"
  }

  RECIPE{
    type = "recipe",
    name = "lubricant",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="heavy-oil", amount=150},
      {type = "item", name = "nexelit-plate", amount = 2}
    },
    results=
    {
      {type="fluid", name="lubricant", amount=100}
    },
    subgroup = "fluid-recipes",
    crafting_machine_tint =
    {
      primary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000}, -- #44b838ff
      secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}, -- #6eca62ff
      tertiary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000}, -- #a57865ff
      quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}, -- #ff6420ff
    }
  }:add_unlock('advanced-oil-processing')

  RECIPE("flamethrower-ammo"):replace_ingredient('crude-oil', 'light-oil')

  --ENTITY

  data.raw.car.car.burner.fuel_category = "jerry"
  data.raw.car.car.burner.burnt_inventory_size = data.raw.car.car.burner.fuel_inventory_size
  data.raw.car.tank.burner.fuel_category = "jerry"
  data.raw.car.tank.burner.burnt_inventory_size = data.raw.car.tank.burner.fuel_inventory_size
  data.raw.locomotive.locomotive.burner.fuel_category = "jerry"
  data.raw.locomotive.locomotive.burner.burnt_inventory_size = data.raw.locomotive.locomotive.burner.fuel_inventory_size
