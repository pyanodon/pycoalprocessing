RECIPE {
    type = "recipe",
    name = "methanol-from-hydrogen",
    category = "methanol",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "carbon-dioxide", amount = 30},
        {type = "fluid", name = "hydrogen", amount = 50},
        {type = "item", name = "zinc-plate", amount = 1},
        {type = "item", name = "nichrome", amount = 2}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 40}
    },
    subgroup = "py-methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    icon_size = 32,
    order = "b"
}:add_unlock("methanol-processing-2")

RECIPE {
    type = "recipe",
    name = "syngas2",
    category = "gasifier",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-gas", amount = 40},
        {type = "fluid", name = "oxygen", amount = 50},
        {type = "fluid", name = "water", amount = 100}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 100},
        {type = "fluid", name = "tar", amount = 30},
        {type = "item", name = "ash", amount = 1}
    },
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "a-b-[syn-gas]"
}

--uses bob_carbon
RECIPE {
    type = "recipe",
    name = "tar-carbon",
    category = "tar",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "tar", amount = 40}
    },
    results = {
        {type = "item", name = "carbon", amount = 4}
    },
    main_product = "carbon",
    subgroup = "py-items",
    order = "carbon",
    icon = data.raw.item.carbon.icon,
    icon_size = 32,
}:add_unlock("coal-processing-1")

--alternative silicon plate
RECIPE {
    type = "recipe",
    name = "silicon-plate2",
    category = "electrolysis",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "crushed-quartz", amount = 5},
		{type = "item", name = "carbon", amount = 1},
		{type = "item", name = "calcium-chloride", amount = 4},
    },
    results = {
        {type = "item", name = "silicon", amount = 5}
    },
    main_product = "silicon",
    icon = data.raw.item.silicon.icon,
    icon_size = 32,
}

RECIPE {
    type = "recipe",
    name = "salt-ex",
    category = "evaporator",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "water-saline", amount = 100}
    },
    results = {
        {type = "item", name = "salt", amount = 1, probability = 0.4}
    },
    main_product = "salt",
    subgroup = "py-items",
    order = "salt",
    icon = "__pycoalprocessing__/graphics/icons/salt.png",
    icon_size = 32,
}

RECIPE {
    type = "recipe",
    name = "saline",
    category = "chemistry",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "water", amount = 100},
        {type = "item", name = "salt", amount = 10}
    },
    results = {
        {type = "fluid", name = "water-saline", amount = 100}
    },
    main_product = "water-saline",
    subgroup = "py-items",
    order = "saline",
    icon = "__pycoalprocessing__/graphics/icons/water-saline.png",
    icon_size = 32,
}

RECIPE {
    type = "recipe",
    name = "void-flue-gas",
    category = "void-fluid",
    enabled = "false",
    hidden = "true",
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "flue-gas", amount = 20}
    },
    results = {
        {type = "item", name = "void", amount = 1, probability = 0}
    },
    subgroup = "void",
    icon = "__pycoalprocessing__/graphics/icons/flue-gas.png",
    icon_size = 32,
    order = "flue-gas"
}:add_unlock("void-fluid")

--GLASS PRODUCTION
RECIPE {
    type = "recipe",
    name = "glass-sand",
    category = "hpf",
    enabled = "true",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "pure-sand", amount = 15},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "quartz", amount = 8}
    },
    results = {
        {type = "item", name = "glass", amount = 10}
    },
    main_product = "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "i"
}

--GLASS PRODUCTION2
RECIPE {
    type = "recipe",
    name = "glass-sand2",
    category = "hpf",
    enabled = "true",
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "pure-sand", amount = 15},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "crushed-quartz", amount = 4}
    },
    results = {
        {type = "item", name = "glass", amount = 14}
    },
    main_product = "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "j"
}

--GLASS PRODUCTION3 - compatibility with angels
RECIPE {
    type = "recipe",
    name = "glass-sand3",
    category = "smelting",
    enabled = "true",
    energy_required = 5,
    ingredients = {
        {type = "item", name = "sand", amount = 20}
    },
    results = {
        {type = "item", name = "glass", amount = 1}
    },
    --main_product= "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "j"
}

-- TUNGSTEN POWDER
RECIPE {
    type = "recipe",
    name = "tungsten-powder",
    category = "ball-mill",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "crushed-tungsten", amount = 10}
    },
    results = {
        {type = "item", name = "powdered-tungsten", amount = 10}
    },
    main_product = "powdered-tungsten",
    icon = "__bobplates__/graphics/icons/powdered-tungsten.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c"
}

--SMELT CRUSHED TIN
RECIPE {
    type = "recipe",
    name = "crushed-tin",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-tin", 1}},
    results = {
      {"tin-plate", 1}
    },
    result_count = 2
}

--SMELT CRUSHED LEAD
RECIPE {
    type = "recipe",
    name = "crushed-lead",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-lead", 1}},
    results = {
      {"lead-plate", 1}
    },
    result_count = 2
}

--SMELT CRUSHED SILVER
RECIPE {
    type = "recipe",
    name = "crushed-silver",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-silver", 1}},
    results = {
        {type = "item", name = "silver-plate", amount = 2}
    }
}

--BOB SMELT GOLD |override?|
RECIPE {
    type = "recipe",
    name = "crushed-gold",
    category = "chemical-furnace",
    energy_required = 3.5,
    enabled = "false",
    ingredients = {
        {type = "item", name = "crushed-gold", amount = 1},
        {type = "fluid", name = "chlorine", amount = 5}
    },
    results = {
      {"gold-plate", 1}
    },
    result_count = 2
}

--BOB SMELT ZINC |override?|
RECIPE {
    type = "recipe",
    name = "crushed-zinc",
    category = "electrolysis",
    energy_required = 3.5,
    enabled = "false",
    ingredients = {
        {type = "item", name = "crushed-zinc", amount = 1},
        {type = "fluid", name = "sulfuric-acid", amount = 10}
    },
    results = {
      {"zinc-plate", 1}
    },
    result_count = 2
}

--BOB SMELT NICKEL |override?|
RECIPE {
    type = "recipe",
    name = "crushed-nickel",
    category = "electrolysis",
    energy_required = 3.5,
    enabled = "false",
    ingredients = {
        {type = "item", name = "crushed-nickel", amount = 1},
        {type = "fluid", name = "oxygen", amount = 10}
    },
    results = {
        {type = "fluid", name = "sulfur-dioxide", amount = 20},
        {type = "item", name = "nickel-plate", amount = 2}
    },
    main_product = "nickel-plate",
    icon = "__bobplates__/graphics/icons/plate/nickel-plate.png",
    icon_size = 32,
    order = "c-a-f[nickel-plate]"
}

--BOB SMELT RUTILE |override?|
RECIPE {
    type = "recipe",
    name = "crushed-rutile",
    category = "electrolysis",
    energy_required = 6,
    enabled = "false",
    ingredients = {
        {type = "item", name = "calcium-chloride", amount = 2},
        {type = "item", name = "carbon", amount = 1},
        {type = "item", name = "crushed-rutile", amount = 2}
    },
    results = {
      {"titanium-plate", 1}
    },
    result_count = 4
}

--LUBRICANT FROM GLYCEROL
RECIPE {
    type = "recipe",
    name = "lube-glycerol",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "lithia-water", amount = 200}
    },
    results = {
        {type = "fluid", name = "lubricant", amount = 100}
    },
    main_product = "lubricant",
    icon = "__pycoalprocessing__/graphics/icons/lube-glycerol.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a [coal-gas]"
}

--RESIN FROM GLYCEROL
RECIPE {
    type = "recipe",
    name = "resin-glycerol",
    category = "hpf",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 150},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "item", name = "resin", amount = 20}
    },
    main_product = "resin",
    icon = "__pycoalprocessing__/graphics/icons/resin-glycerol.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "k"
}

--SYNGAS DISTILATION
RECIPE {
    type = "recipe",
    name = "syngas-distilation",
    category = "distilator",
    enabled = "false",
    energy_required = 1.5,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 150}
    },
    results = {
        {type = "fluid", name = "hydrogen", amount = 100},
        {type = "fluid", name = "carbon-dioxide", amount = 50}
    },
    main_product = "hydrogen",
    icon = "__pycoalprocessing__/graphics/icons/syngas-distilation.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a [coal-gas]"
}

-- CRUSHED BAUXITE
ITEM {
    type = "item",
    name = "crushed-bauxite",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-bauxite.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED GOLD
ITEM {
    type = "item",
    name = "crushed-gold",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-gold.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED LEAD
ITEM {
    type = "item",
    name = "crushed-lead",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-lead.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED NICKEL
ITEM {
    type = "item",
    name = "crushed-nickel",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-nickel.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED RUTILE
ITEM {
    type = "item",
    name = "crushed-rutile",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-rutile.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED SILVER
ITEM {
    type = "item",
    name = "crushed-silver",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-silver.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED QUARTZ
ITEM {
    type = "item",
    name = "crushed-quartz",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-quartz.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED TIN
ITEM {
    type = "item",
    name = "crushed-tin",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-tin.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED TUNGSTEN
ITEM {
    type = "item",
    name = "crushed-tungsten",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-tungsten.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED ZINC
ITEM {
    type = "item",
    name = "crushed-zinc",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-zinc.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

--WOOD-TO-WOODEN BOARD override bobs?
RECIPE {
    type = "recipe",
    name = "wood-board",
    category = "wpu",
    enabled = "true",
    energy_required = 1.5,
    ingredients = {
        {type = "item", name = "wood", amount = 1}
    },
    results = {
        {type = "item", name = "wooden-board", amount = 1}
    },
    icon = "__bobelectronics__/graphics/icons/wooden-board.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a8"
}

--HYDROGEN to CM1
RECIPE {
    type = "recipe",
    name = "hydrogen-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "hydrogen", amount = 200},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 520},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-hydrogen.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "k"
}:add_unlock("energy1")

--SODIUM HYDROXIDE
RECIPE {
    type = "recipe",
    name = "py-sodium-hydroxide",
    category = "chemistry",
    enabled = "false",
    energy_required = 8,
    ingredients = {
        {type = "fluid", name = "slacked-lime", amount = 50},
        {type = "item", name = "salt", amount = 20}
    },
    results = {
        {type = "item", name = "sodium-hydroxide", amount = 10},
        {type = "item", name = "limestone", amount = 1}
    },
    icon = "__bobplates__/graphics/icons/sodium-hydroxide.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a8"
}

--COAL DUST to CARBON
RECIPE {
    type = "recipe",
    name = "coaldust-carbon",
    category = "crafting",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "coal-dust", amount = 20}
    },
    results = {
        {type = "item", name = "carbon", amount = 1},
    },
    icon = "__bobplates__/graphics/icons/carbon.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "m"
}

--alumina
RECIPE {
    type = "recipe",
    name = "alumina2",
    category = "chemical-furnace",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "sodium-hydroxide", amount = 1},
        {type = "item", name = "crushed-bauxite", amount = 1},
    },
    results = {
        {type = "item", name = "alumina", amount = 2},
    },
    icon = "__bobplates__/graphics/icons/corundum.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "m"
}

bobmods.lib.tech.add_recipe_unlock("void-fluid", "void-flue-gas")
bobmods.lib.tech.add_recipe_unlock("methanol-processing-2", "methanol-from-hydrogen")
bobmods.lib.tech.add_recipe_unlock("aluminium-processing", "alumina2")

bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "syngas2")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "salt-ex")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "saline")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-nickel-zinc")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-tin-lead")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gold-silver")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-bauxite-cobalt")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-rutile-tungsten")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gem-ore")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "py-sodium-hydroxide")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "syngas-distilation")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "lube-glycerol")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "resin-glycerol")

bobmods.lib.tech.add_recipe_unlock("energy1", "hydrogen-combustion")

bobmods.lib.tech.add_recipe_unlock("silicon-processing" , "silicon-plate2")

bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-silver")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-cobalt")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-bauxite")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-gold")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-lead")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-tin")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-tungsten")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-zinc")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-silver")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-quartz")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-rutile")
bobmods.lib.tech.add_recipe_unlock("excavation-2", "mining-nickel")

bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-silver")
bobmods.lib.tech.add_recipe_unlock("crusher", "coaldust-carbon")
--bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-cobalt")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-bauxite")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-gold")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-lead")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-tin")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-tungsten")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-zinc")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-silver")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-quartz")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-rutile")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-nickel")
bobmods.lib.tech.add_recipe_unlock("crusher", "tungsten-powder")

bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-silver")
--bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-cobalt")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-bauxite")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-gold")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-lead")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-tin")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-tungsten")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-zinc")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-silver")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-quartz")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-rutile")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-nickel")
