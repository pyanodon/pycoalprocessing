local function new_fluid(params)
  params.type = "fluid"
  params.icon = params.icon or "__pycoalprocessinggraphics__/graphics/icons/" .. params.name .. ".png"
  params.icon_size = params.icon_size or 32
  params.default_temperature = params.default_temperature or 10
  params.max_temperature = params.max_temperature or 100
  params.gas_temperature = params.gas_temperature or 15
  params.heat_capacity = params.heat_capacity or "1kJ"
  
  FLUID(params)
end

new_fluid{
  name = "tar",
  base_color = {r = 0.066, g = 0.164, b = 0.121},
  flow_color = {r = 1, g = 1, b = 1},
  subgroup = "py-fluids",
  
}

new_fluid {
    name = "tpa",
    base_color = {r = 0.937, g = 0.803, b = 0.007},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[tpa]"
}

new_fluid{
    name = "diesel",
    base_color = {r = 0.5, g = 0.210, b = 0.023},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[diesel]"
}

new_fluid {
    name = "olefin",
    base_color = {r = 0.6, g = 0.388, b = 0.745},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[olefin]"
}

new_fluid {
    name = "acidgas",
    base_color = {r = 0.741, g = 0.788, b = 0.196},
    flow_color = {r = 1, g = 1, b = 1},
}

RECIPE {
    type = "recipe",
    name = "anthraquinone",
    category = "rectisol",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 100},
        {type = "fluid", name = "steam",     amount = 600},
        {type = "item",  name = "chromium",  amount = 2}
    },
    results = {
        {type = "fluid", name = "anthraquinone", amount = 50}
    }
}:add_unlock("sulfur-processing")

new_fluid {
    name = "anthraquinone",
    base_color = {r = 0.737, g = 0.592, b = 0.917},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[anthraquinone]"
}

RECIPE {
    type = "recipe",
    name = "aromatics2",
    category = "gasifier",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 150},
        {type = "fluid", name = "water",     amount = 500}, --Added Bob hydrogen
        {type = "item",  name = "organics",  amount = 10}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 300}
    }
}:add_unlock("advanced-oil-processing")

new_fluid {
    name = "aromatics",
    base_color = {r = 0.74, g = 0.403, b = 0.388},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[aromatics]"
}

RECIPE {
    type = "recipe",
    name = "boric-acid",
    category = "gasifier", --bob electrolysis
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "diborane", amount = 100},
        {type = "fluid", name = "water",    amount = 500}
    },
    results = {
        {type = "fluid", name = "boric-acid", amount = 500}
    }
}:add_unlock("lab-instrument")

new_fluid {
    name = "boric-acid",
    base_color = {r = 0.662, g = 0.752, b = 0.764},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[boric-acid]"
}

new_fluid {
    name = "carbon-dioxide",
    icon = "__pycoalprocessinggraphics__/graphics/icons/carbon-dioxide.png",
    base_color = {r = 0.807, g = 0.949, b = 0.941},
    flow_color = {r = 1, g = 1, b = 1},
}

RECIPE {
    type = "recipe",
    name = "coal-gas",
    category = "distilator",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "coal", amount = 10}
    },
    results = {
        {type = "fluid", name = "coal-gas",   amount = 40},
        {type = "fluid", name = "tar",        amount = 50},
        {type = "item",  name = "iron-oxide", amount = 1, probability = 0.3},
        {type = "item",  name = "coke",       amount = 6}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-coal.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "e"
}

RECIPE {
    type = "recipe",
    name = "coal-gas-from-wood",
    category = "distilator",
    enabled = true,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "wood", amount = 10}
    },
    results = {
        {type = "fluid", name = "coal-gas",   amount = 10},
        {type = "fluid", name = "tar",        amount = 30},
        {type = "item",  name = "iron-oxide", amount = 1, probability = 0.3},
        {type = "item",  name = "coal",       amount = 10}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-wood.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "coal-gas-from-coke",
    category = "distilator",
    enabled = true,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "coke", amount = 20}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 20},
        {type = "fluid", name = "tar",      amount = 20},
        {type = "item",  name = "ash",      amount = 1}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas-from-coke.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "f"
}

new_fluid {
    name = "coal-gas",
    icon = "__pycoalprocessinggraphics__/graphics/icons/coalgas.png",
    icon_size = 32,
    base_color = {r = 0.921, g = 0.776, b = 0.541},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "a-[coal-gas]"
}

RECIPE {
    type = "recipe",
    name = "coal-slurry",
    category = "fluid-separator",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "tailings", amount = 250}
    },
    results = {
        {type = "fluid", name = "water",       amount = 100},
        {type = "fluid", name = "coal-slurry", amount = 150}
    },
    main_product = "coal-slurry"
}:add_unlock("fluid-separation")

new_fluid {
    name = "coal-slurry",
    base_color = {r = 0.247, g = 0.247, b = 0.247},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[coal-slurry]"
}

new_fluid {
    name = "combustion-mixture1",
    heat_capacity = "2kJ",
    base_color = {r = 0.811, g = 0.325, b = 0.0},
    flow_color = {r = 1, g = 1, b = 1},
    max_temperature = 3000,
    gas_temperature = 15,
    subgroup = "py-combustion",
    order = "z-[combustion-mixture1]",
    auto_barrel = false
}

RECIPE {
    type = "recipe",
    name = "creosote",
    category = "tar",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "tar", amount = 100}
    },
    results = {
        {type = "fluid", name = "creosote", amount = 80}
    },
    crafting_machine_tint =
    {
        primary = {r = 0.360, g = 0.250, b = 0.070},
        secondary = {r = 1, g = 1, b = 1},
        tertiary = {r = 0.360, g = 0.250, b = 0.070},
        quaternary = {r = 0.360, g = 0.250, b = 0.070},
    },
    main_product = "creosote"
}:add_unlock("creosote")

new_fluid {
    name = "creosote",
    icon_size = 64,
    base_color = {r = 0.360, g = 0.250, b = 0.070},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "creosote"
}

RECIPE {
    type = "recipe",
    name = "diborane",
    category = "hpf",
    enabled = false,
    energy_required = 7,
    ingredients = {
        {type = "fluid", name = "water", amount = 250},
        {type = "item",  name = "borax", amount = 10}
    },
    results = {
        {type = "fluid", name = "diborane", amount = 150}
    }
}:add_unlock("energy-1")

new_fluid {
    name = "diborane",
    base_color = {r = 0.858, g = 0.929, b = 0.952},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[diborane]"
}

new_fluid {
    name = "flue-gas",
    base_color = {r = 0.839, g = 0.811, b = 0.745},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
}

new_fluid {
    name = "gasoline",
    base_color = {r = 0.776, g = 0.709, b = 0.043},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[gasoline]"
}

new_fluid {
    name = "glycerol",
    base_color = {r = 0.913, g = 0.890, b = 0.6},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "z-[glycerol]"
}

RECIPE {
    type = "recipe",
    name = "hydrogen-peroxide",
    category = "carbonfilter",
    enabled = false,
    energy_required = 2.7,
    ingredients = {
        {type = "fluid", name = "anthraquinone", amount = 100},
        {type = "item",  name = "iron-plate",    amount = 5}
    },
    results = {
        {type = "fluid", name = "hydrogen-peroxide", amount = 50}
    }
}:add_unlock("sulfur-processing")

new_fluid {
    name = "hydrogen-peroxide",
    base_color = {r = 0.674, g = 1, b = 0.929},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[hydrogen-peroxide]"
}

RECIPE {
    type = "recipe",
    name = "methanol-from-syngas",
    category = "methanol",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "syngas",       amount = 150},
        {type = "item",  name = "copper-plate", amount = 3},
        {type = "item",  name = "iron-plate",   amount = 1} --bob zinc-plate
    },
    results = {
        {type = "fluid", name = "methanol", amount = 150}
    },
    subgroup = "py-methanol",
    order = "a"
}:add_unlock("methanol-processing-1")

RECIPE {
    type = "recipe",
    name = "oleo-methanol",
    category = "methanol",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 100},
        {type = "item",  name = "chromium",      amount = 5}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 250},
        {type = "fluid", name = "water",    amount = 150}
    },
    main_product = "methanol",
    icon = "__pycoalprocessinggraphics__/graphics/icons/methanol-oleochemicals.png",
    icon_size = 32,
    subgroup = "py-methanol",
    order = "c"
}:add_unlock("methanol-processing-2")


new_fluid {
    name = "methanol",
    heat_capacity = "1kJ",
    base_color = {r = 0.231, g = 0.776, b = 0.333},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
}

RECIPE {
    type = "recipe",
    name = "glass",
    category = "glassworks",
    enabled = true,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "sand", amount = 20},
    },
    results = {
        {type = "fluid", name = "molten-glass", amount = 20}
    },
    main_product = "molten-glass",
    subgroup = "py-items",
    order = "aac"
}

RECIPE {
    type = "recipe",
    name = "glass-2",
    category = "glassworks",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "powdered-quartz", amount = 2},
        {type = "item", name = "pure-sand",       amount = 10},
    },
    results = {
        {type = "fluid", name = "molten-glass", amount = 50}
    },
    main_product = "molten-glass",
    subgroup = "py-items",
    order = "aac"
}:add_unlock("advanced-material-processing")


new_fluid {
    name = "molten-glass",
    icon_size = 64,
    base_color = {r = 0.7, g = 0.7, b = 0.7},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-items",
    order = "c"
}

new_fluid {
    name = "muddy-sludge",
    icon = "__pycoalprocessinggraphics__/graphics/icons/dirty-water-light.png",
    icon_size = 64,
    base_color = {r = 108, g = 54, b = 54},
    flow_color = {r = 1, g = 1, b = 1},
}

RECIPE {
    type = "recipe",
    name = "niobium-complex",
    category = "chemistry",
    enabled = false,
    energy_required = 3.5,
    ingredients = {
        {type = "fluid", name = "organic-solvent",     amount = 50},
        {type = "fluid", name = "water",               amount = 100},
        {type = "item",  name = "niobium-concentrate", amount = 10}
    },
    results = {
        {type = "fluid", name = "niobium-complex", amount = 100}
    },
    subgroup = "py-fluids",
    order = "c"
}:add_unlock("niobium")

new_fluid {
    name = "niobium-complex",
    base_color = {r = 0.482, g = 0.607, b = 0.650},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "z-[niobium-complex]"
}

new_fluid {
    name = "olefin",
    base_color = {r = 0.6, g = 0.388, b = 0.745},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "z-[olefin]"
}

new_fluid {
    name = "oleochemicals",
    base_color = {r = 0.870, g = 0.717, b = 0.0},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "z-[oleochemicals]"
}

new_fluid {
    name = "organic-solvent",
    base_color = {r = 0.172, g = 0.705, b = 0.447},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "z-[organic-solvent]"
}

new_fluid {
    name = "rare-earth-mud",
    base_color = {r = 0.2, g = 0.192, b = 0.125},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
}

RECIPE {
    type = "recipe",
    name = "refsyngas-from-filtered-syngas",
    category = "carbonfilter",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "syngas",        amount = 100},
        {type = "item",  name = "active-carbon", amount = 1}
    },
    results = {
        {type = "fluid", name = "refsyngas", amount = 70}
    }
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "refsyngas-from-meth",
    category = "rectisol",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "syngas",   amount = 100},
        {type = "fluid", name = "methanol", amount = 100}
    },
    results = {
        {type = "fluid", name = "refsyngas",      amount = 100},
        {type = "fluid", name = "water",          amount = 30}, --bob hydrogen
        {type = "fluid", name = "carbon-dioxide", amount = 30},
        {type = "fluid", name = "acidgas",        amount = 65}
    },
    main_product = "refsyngas"
}:add_unlock("methanol-processing-2")

RECIPE {
    type = "recipe",
    name = "refsyngas-from-meth-canister",
    category = "rectisol",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "syngas",                amount = 100},
        {type = "item",  name = "methanol-gas-canister", amount = 1}
    },
    results = {
        {type = "fluid", name = "refsyngas",          amount = 100},
        {type = "fluid", name = "water",              amount = 30}, --bob hydrogen
        {type = "fluid", name = "carbon-dioxide",     amount = 20},
        {type = "fluid", name = "acidgas",            amount = 60},
        {type = "item",  name = "empty-gas-canister", amount = 1,  ignored_by_productivity = 1}
    },
    main_product = "refsyngas"
}:add_unlock("methanol-processing-1")

new_fluid {
    name = "refsyngas",
    base_color = {r = 0.8, g = 0.239, b = 0.129},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
}

new_fluid {
    name = "slacked-lime",
    base_color = {r = 0.772, g = 0.772, b = 0.772},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
    order = "z-[slacked-lime]"
}

RECIPE {
    type = "recipe",
    name = "syngas",
    category = "gasifier",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-gas", amount = 50},
        {type = "fluid", name = "water",    amount = 100}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 70},
        {type = "fluid", name = "tar",    amount = 30},
        {type = "item",  name = "ash",    amount = 1}
    },
    main_product = "syngas"
}:add_unlock("syngas")

new_fluid {
    name = "syngas",
    base_color = {r = 0.8, g = 0.564, b = 0.129},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-syngas",
    order = "a-a-[syn-gas]"
}

new_fluid {
    name = "tailings",
    icon = "__pycoalprocessinggraphics__/graphics/icons/dirty-water.png",
    icon_size = 64,
    base_color = {r = 0.176, g = 0.054, b = 0.054},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
}

RECIPE {
    type = "recipe",
    name = "tpa",
    category = "rectisol",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 100},
        {type = "fluid", name = "steam",     amount = 600},
        {type = "item",  name = "nichrome",  amount = 2}
    },
    results = {
        {type = "fluid", name = "tpa", amount = 50}
    }
}:add_unlock("kevlar")

new_fluid {
    name = "water-saline",
    icon_size = 64,
    base_color = {r = 0.9, g = 0.9, b = 1},
    flow_color = {r = 1, g = 1, b = 1},
    subgroup = "py-fluids",
}
