-------------------------------------------------------------------------------
--[[New stuff when bobs is present]]--
-------------------------------------------------------------------------------
--updated-bob mods is present, add hydrogen processing
local methanol_from_hydrogen = {
    type = "recipe",
    name = "methanol-from-hydrogen",
    category = "methanol",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="carbon-dioxide", amount=30},
        {type="fluid", name="hydrogen", amount=50},
        {type="item", name="zinc-plate", amount=1},
        {type="item", name="nichrome", amount=2}, },
    results=
    {
        {type="fluid", name="methanol", amount=40},
    },
    --main_product= "methanol",
    subgroup = "py-methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    order = "b",
}

local syngas_from_coal_oxygen = {
    type = "recipe",
    name = "syngas2",
    category = "gasifier",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="coal-gas", amount=40},
        {type="fluid", name="oxygen", amount=50},
        {type="fluid", name="water", amount=100},
    },
    results=
    {
        {type="fluid", name="syngas", amount=100},
        {type="fluid", name="tar", amount=30},
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
    energy_required = 2,
    ingredients ={
        {type="fluid", name="tar", amount=40},
    },
    results={
        {type="item", name="carbon", amount=4},
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
        {type="fluid", name="water-saline", amount=100},
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
        {type="fluid", name="flue-gas", amount=20}
    },
    results=
    {
        {type="item", name="void", amount=1, probability=0},
    },
    subgroup = "void",
    icon = "__pycoalprocessing__/graphics/icons/flue-gas.png",
    order = "flue-gas"
}

-------------------------------------------------------------------------------
--GLASS PRODUCTION
local glass ={
    type = "recipe",
    name = "glass-sand",
    category = "hpf",
    enabled = "true",
    energy_required = 3,
    ingredients ={
        {type="item", name="pure-sand", amount=15},
        {type="fluid", name="coal-gas", amount=100},
        {type="item", name="quartz", amount=8},
    },
    results={
        {type="item", name="glass", amount=10},

    },
    main_product= "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    subgroup = "py-items-hpf",
    order = "i",
}
-------------------------------------------------------------------------------
--GLASS PRODUCTION2
local glass2 ={
    type = "recipe",
    name = "glass-sand2",
    category = "hpf",
    enabled = "true",
    energy_required = 2.5,
    ingredients ={
        {type="item", name="pure-sand", amount=15},
        {type="fluid", name="coal-gas", amount=100},
        {type="item", name="crushed-quartz", amount=4},
    },
    results={
        {type="item", name="glass", amount=14},

    },
    main_product= "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    subgroup = "py-items-hpf",
    order = "j",
}
-------------------------------------------------------------------------------
-- TUNGSTEN POWDER
local tungsten_powder ={
    type = "recipe",
    name = "tungsten-powder",
    category = "ball-mill",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="item", name="crushed-tungsten", amount=10},
    },
    results={
        {type="item", name="powdered-tungsten", amount=10},

    },
    main_product= "powdered-tungsten",
    icon = "__bobplates__/graphics/icons/powdered-tungsten.png",
    subgroup = "py-items",
    order = "c",
}

--SMELT CRUSHED TIN
local recipe_crushed_tin = {
    type = "recipe",
    name = "crushed-tin",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-tin", 1}},
    result = "tin-plate",
    result_count = 2,
}
--SMELT CRUSHED LEAD
local recipe_crushed_lead = {
    type = "recipe",
    name = "crushed-lead",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-lead", 1}},
    result = "lead-plate",
    result_count = 2,
}
--SMELT CRUSHED SILVER
local recipe_crushed_silver = {
    type = "recipe",
    name = "crushed-silver",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-silver", 1}},
    results={
        {type="item", name="silver-plate", amount=2},
    },
}
--BOB SMELT GOLD |override?|
local recipe_crushed_gold = {
    type = "recipe",
    name = "crushed-silver",
    category = "chemical-furnace",
    energy_required = 3.5,
    enabled = "false",
    ingredients =
    {
        {type="item", name="crushed-gold", amount=1},
        {type="fluid", name="chlorine", amount=5}
    },
    result = "gold-plate",
    result_count = 2,
}
--BOB SMELT ZINC |override?|
local recipe_crushed_zinc = {
    type = "recipe",
    name = "crushed-zinc",
    category = "electrolysis",
    energy_required = 3.5,
    enabled = "false",
    ingredients =
    {
        {type="item", name="crushed-zinc", amount=1},
        {type="fluid", name="sulfuric-acid", amount=10}
    },
    result = "zinc-plate",
    result_count = 2,
}
--BOB SMELT NICKEL |override?|
local recipe_crushed_nickel = {
    type = "recipe",
    name = "crushed-nickel",
    category = "electrolysis",
    energy_required = 3.5,
    enabled = "false",
    ingredients =
    {
        {type="item", name="crushed-nickel", amount=1},
        {type="fluid", name="oxygen", amount=10}
    },
    results=
    {
        {type="fluid", name="sulfur-dioxide", amount=20},
        {type="item", name="nickel-plate", amount=2}
    },
    main_product= "nickel-plate",
    icon = "__bobplates__/graphics/icons/plate/nickel-plate.png",
    order = "c-a-f[nickel-plate]",
}
--BOB SMELT RUTILE |override?|
local recipe_crushed_rutile = {
    type = "recipe",
    name = "crushed-rutile",
    category = "electrolysis",
    energy_required = 6,
    enabled = "false",
    ingredients =
    {
        {type="item", name="calcium-chloride", amount=2},
        {type="item", name="carbon", amount=1},
        {type="item", name="crushed-rutile", amount=2}
    },
    result = "titanium-plate",
    result_count = 4,
}

-------------------------------------------------------------------------------
--LUBRICANT FROM GLYCEROL
local recipe_lube_glycerol ={
    type = "recipe",
    name = "lube-glycerol",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.0,
    ingredients ={
        {type="fluid", name="glycerol", amount=100},
        {type="fluid", name="lithia-water", amount=200},
    },
    results={
        {type="fluid", name="lubricant", amount=100},
    },
    main_product= "lubricant",
    icon = "__pycoalprocessing__/graphics/icons/lube-glycerol.png",
    subgroup = "py-items",
    order = "a [coal-gas]",
}
-------------------------------------------------------------------------------
--EXPLOSIVES FROM GLYCEROL
local recipe_explosives_glycerol ={
    type = "recipe",
    name = "explosive-glycerol",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.0,
    ingredients ={
        {type="fluid", name="glycerol", amount=100},
        {type="fluid", name="sulfuric-acid", amount=150},
    },
    results={
        {type="item", name="explosives", amount=5},
    },
    main_product= "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    subgroup = "py-items",
    order = "a [coal-gas]",
}
-------------------------------------------------------------------------------
--RESIN FROM GLYCEROL
local recipe_resin_glycerol ={
    type = "recipe",
    name = "resin-glycerol",
    category = "hpf",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
        {type="fluid", name="glycerol", amount=150},
        {type="item", name="coke", amount=5},
    },
    results={
        {type="item", name="resin", amount=20},
    },
    main_product= "resin",
    icon = "__pycoalprocessing__/graphics/icons/resin-glycerol.png",
    subgroup = "py-items-hpf",
    order = "k",
}
-------------------------------------------------------------------------------
--SYNGAS DISTILATION
local recipe_syngas_distilation ={
    type = "recipe",
    name = "syngas-distilation",
    category = "distilator",
    enabled = "false",
    energy_required = 1.5,
    ingredients ={
        {type="fluid", name="syngas", amount=150},
    },
    results={
        {type="fluid", name="hydrogen", amount=100},
        {type="fluid", name="carbon-dioxide", amount=50},
    },
    main_product= "hydrogen",
    icon = "__pycoalprocessing__/graphics/icons/syngas-distilation.png",
    subgroup = "py-items",
    order = "a [coal-gas]",
}

-- CRUSHED BAUXITE
local crushed_bauxite = {
    type = "item",
    name = "crushed-bauxite",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-bauxite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED GOLD
local crushed_gold = {
    type = "item",
    name = "crushed-gold",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-gold.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED LEAD
local crushed_lead = {
    type = "item",
    name = "crushed-lead",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-lead.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED NICKEL
local crushed_nickel = {
    type = "item",
    name = "crushed-nickel",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-nickel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED RUTILE
local crushed_rutile = {
    type = "item",
    name = "crushed-rutile",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-rutile.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED SILVER
local crushed_silver = {
    type = "item",
    name = "crushed-silver",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-silver.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED QUARTZ
local crushed_quartz = {
    type = "item",
    name = "crushed-quartz",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-quartz.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED TIN
local crushed_tin = {
    type = "item",
    name = "crushed-tin",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-tin.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED TUNGSTEN
local crushed_tungsten = {
    type = "item",
    name = "crushed-tungsten",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-tungsten.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED ZINC
local crushed_zinc = {
    type = "item",
    name = "crushed-zinc",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-zinc.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

--WOOD-TO-WOODEN BOARD override bobs?
-------------------------------------------------------------------------------
local wooden_board = {
    type = "recipe",
    name = "wood-board",
    category = "wpu",
    enabled = "true",
    energy_required = 1.5,
    ingredients ={
        {type="item", name="wood", amount=1},
    },
    results={
        {type="item", name="wooden-board", amount=1},
    },
    icon = "__bobelectronics__/graphics/icons/wooden-board.png",
    subgroup = "py-items",
    order = "a8",
}

--HYDROGEN to CM1
local hydrogen_c = {
    type = "recipe",
    name = "hydrogen-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="hydrogen", amount=200},
        {type="fluid", name="water", amount=500},
        {type="item", name="coke", amount=5},
    },
    results={
        {type="fluid", name="combustion-mixture1", amount=100, temperature=520},
        {type="fluid", name="steam", amount=500, temperature=60},
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-hydrogen.png",
    main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "k",
}

data:extend{
    methanol_from_hydrogen, recipe_tar_carbon, recipe_salt_ex, syngas_from_coal_oxygen,
    void_flue_gas, glass, glass2, tungsten_powder, recipe_crushed_tin, recipe_syngas_distilation,
    recipe_crushed_lead, recipe_crushed_silver, recipe_crushed_gold, recipe_crushed_zinc, recipe_crushed_nickel,
    recipe_crushed_rutile, crushed_quartz, recipe_lube_glycerol, recipe_explosives_glycerol, recipe_resin_glycerol,
    crushed_bauxite, crushed_gold, crushed_lead, crushed_nickel, crushed_rutile, crushed_silver,
    crushed_tin, crushed_tungsten, crushed_zinc, wooden_board, hydrogen_c
}

bobmods.lib.tech.add_recipe_unlock("void-fluid", "void-flue-gas")
bobmods.lib.tech.add_recipe_unlock("methanol-processing-2", "methanol-from-hydrogen")
bobmods.lib.tech.add_recipe_unlock("desulfurization", "explosive-glycerol")

bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "syngas2")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "salt-ex")
bobmods.lib.tech.add_recipe_unlock("coal-processing-1", "tar-carbon")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-nickel-zinc")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-tin-lead")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gold-silver")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-bauxite-cobalt")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-rutile-tungsten")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "tailings-gem-ore")

bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "syngas-distilation")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "lube-glycerol")
bobmods.lib.tech.add_recipe_unlock("coal-processing-2", "resin-glycerol")

bobmods.lib.tech.add_recipe_unlock("energy1", "hydrogen-combustion")

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
