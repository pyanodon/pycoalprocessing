--(( TECHNOLOGY ))--
TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):add_pack("military-science-pack")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("electronics"):set_fields{enabled = false}:set_fields{hidden = true}

TECHNOLOGY("rocket-fuel"):add_pack("military-science-pack")

TECHNOLOGY("rocket-control-unit"):add_pack("military-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("kovarex-enrichment-process"):add_pack("military-science-pack")

TECHNOLOGY("worker-robots-speed-3"):remove_pack('utility-science-pack'):add_pack('production-science-pack')

TECHNOLOGY("worker-robots-speed-4"):remove_pack('utility-science-pack'):add_pack('production-science-pack')

TECHNOLOGY('circuit-network'):remove_pack('logistic-science-pack')

TECHNOLOGY('landfill'):remove_pack('logistic-science-pack')

TECHNOLOGY("fluid-handling"):remove_pack('logistic-science-pack')

--adding prod and mil sci to base game utility techs
TECHNOLOGY("physical-projectile-damage-6"):add_pack("production-science-pack")

TECHNOLOGY("physical-projectile-damage-7"):add_pack("production-science-pack")

TECHNOLOGY("stronger-explosives-4"):add_pack("production-science-pack")

TECHNOLOGY("stronger-explosives-5"):add_pack("production-science-pack")

TECHNOLOGY("stronger-explosives-6"):add_pack("production-science-pack")

TECHNOLOGY("stronger-explosives-7"):add_pack("production-science-pack")

TECHNOLOGY("refined-flammables-4"):add_pack("production-science-pack")

TECHNOLOGY("refined-flammables-5"):add_pack("production-science-pack")

TECHNOLOGY("refined-flammables-6"):add_pack("production-science-pack")

TECHNOLOGY("refined-flammables-7"):add_pack("production-science-pack")

TECHNOLOGY("energy-weapons-damage-5"):add_pack("production-science-pack")

TECHNOLOGY("energy-weapons-damage-6"):add_pack("production-science-pack")

TECHNOLOGY("energy-weapons-damage-7"):add_pack("production-science-pack")

TECHNOLOGY("weapon-shooting-speed-6"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-5"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-6"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-7"):add_pack("production-science-pack")

TECHNOLOGY("artillery-shell-range-1"):add_pack("production-science-pack")

TECHNOLOGY("artillery-shell-speed-1"):add_pack("production-science-pack")

TECHNOLOGY("follower-robot-count-5"):add_pack("production-science-pack")

TECHNOLOGY("follower-robot-count-6"):add_pack("production-science-pack")

TECHNOLOGY("inserter-capacity-bonus-7"):add_pack("military-science-pack")

TECHNOLOGY("space-science-pack"):add_pack("military-science-pack")

TECHNOLOGY("military-4"):add_pack("production-science-pack")

TECHNOLOGY("uranium-ammo"):add_pack("production-science-pack")

TECHNOLOGY("braking-force-6"):add_pack("military-science-pack")

TECHNOLOGY("braking-force-7"):add_pack("military-science-pack")

TECHNOLOGY("power-armor-mk2"):add_pack("production-science-pack")

TECHNOLOGY("rocket-silo"):add_pack("military-science-pack")

TECHNOLOGY("research-speed-6"):add_pack("military-science-pack")

TECHNOLOGY("logistic-system"):add_pack("military-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("worker-robots-speed-5"):add_pack("military-science-pack")

TECHNOLOGY("worker-robots-speed-6"):add_pack("military-science-pack")

TECHNOLOGY("worker-robots-storage-3"):add_pack("military-science-pack")

TECHNOLOGY("personal-roboport-mk2-equipment"):add_pack("military-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("mining-productivity-3"):add_pack("military-science-pack")

TECHNOLOGY("mining-productivity-4"):add_pack("military-science-pack")

TECHNOLOGY("artillery"):add_pack("production-science-pack")

--(( TECHNOLOGY DEPENDENCIES ))--

TECHNOLOGY('fast-inserter'):set_fields{ dependencies = { 'automation' }}

TECHNOLOGY('military-2'):set_fields{ dependencies = { 'military' }}

TECHNOLOGY('gate'):set_fields{ dependencies = { 'military-2' }}

TECHNOLOGY('car'):set_fields{ dependencies = { 'logistics-2' }}

TECHNOLOGY('heavy-armor'):set_fields{ dependencies = { 'military' }}

TECHNOLOGY('modular-armor'):set_fields{ dependencies = { 'heavy-armor' }}

TECHNOLOGY('power-armor'):set_fields{ dependencies = { 'modular-armor' }}

TECHNOLOGY('power-armor-mk2'):set_fields{ dependencies = { 'power-armor' }}

TECHNOLOGY('electric-energy-accumulators'):set_fields{ dependencies = { 'electric-energy-distribution-1' }}

RECIPE{
  type = "recipe",
  name = "small-electric-pole-2",
  category = "crafting",
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
  energy_required = 10,
  ingredients = {
      {type = "item", name = "iron-stick", amount =  1},
      {type = "item", name = "copper-cable", amount = 100},
      {type = "item", name = "electronic-circuit", amount =  3},
      {type = "fluid", name = "lubricant", amount = 50},
  },
  results = {
      {type = "item", name = "electric-engine-unit", amount = 3}
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

  data.raw.car.car.burner.fuel_category = nil
  data.raw.car.car.burner.fuel_categories = {"jerry", "chemical"}
  data.raw.car.car.burner.burnt_inventory_size = data.raw.car.car.burner.fuel_inventory_size
  data.raw.car.tank.burner.fuel_category = nil
  data.raw.car.tank.burner.fuel_categories = {"jerry", "chemical"}
  data.raw.car.tank.burner.burnt_inventory_size = data.raw.car.tank.burner.fuel_inventory_size
  data.raw.locomotive.locomotive.burner.fuel_category = nil
  data.raw.locomotive.locomotive.burner.fuel_categories = {"jerry", "chemical"}
  data.raw.locomotive.locomotive.burner.burnt_inventory_size = data.raw.locomotive.locomotive.burner.fuel_inventory_size

  --add ash to burnt results for chemical fuel items
  --data.raw.item["coal"].burnt_result = "ash"


  --clean up chemical fuel category to only have coal and coal accessories
