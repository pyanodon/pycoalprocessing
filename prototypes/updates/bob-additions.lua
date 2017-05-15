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
        {type="fluid", name="carbon-dioxide", amount=3},
        {type="fluid", name="hydrogen", amount=5},
        {type="item", name="zinc-ore", amount=1},
        {type="item", name="nichrome", amount=2}, },
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
    energy_required = 2,
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
        {type="fluid", name="coal-gas", amount=10},
        {type="item", name="quartz", amount=8},
    },
    results={
        {type="item", name="glass", amount=10},

    },
    main_product= "glass",
    icon = "__bobplates__/graphics/icons/glass.png",
    subgroup = "py-items",
    order = "c",
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
        {type="fluid", name="chlorine", amount=0.5}
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
        {type="fluid", name="sulfuric-acid", amount=1}
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
        {type="fluid", name="oxygen", amount=1}
    },
    results=
    {
        {type="fluid", name="sulfur-dioxide", amount=2},
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
        {type="fluid", name="glycerol", amount=10},
		{type="fluid", name="lithia-water", amount=20},
    },
    results={
        {type="fluid", name="lubricant", amount=10},
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
        {type="fluid", name="glycerol", amount=10},
		{type="fluid", name="sulfuric-acid", amount=15},
    },
    results={
        {type="item", name="explosives", amount=5},
    },
    main_product= "explosives",
    icon = "__pycoalprocessing__/graphics/icons/resin-glycerol.png",
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
        {type="fluid", name="glycerol", amount=15},
		{type="item", name="coke", amount=5},
    },
    results={
        {type="item", name="resin", amount=20},
    },
    main_product= "resin",
    icon = "__bobplates__/graphics/icons/resin.png",
    subgroup = "py-items",
    order = "a [coal-gas]",
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
        {type="fluid", name="syngas", amount=15},
    },
    results={
        {type="fluid", name="hydrogen", amount=10},
        {type="fluid", name="carbon-dioxide", amount=5},
    },
    main_product= "hydrogen",
    icon = "__pycoalprocessing__/graphics/icons/syngas-distilation.png",
    subgroup = "py-items",
    order = "a [coal-gas]",
}

data:extend{
    methanol_from_hydrogen, recipe_tar_carbon, recipe_salt_ex, syngas_from_coal_oxygen,
    void_flue_gas, glass, tungsten_powder, recipe_crushed_tin, recipe_syngas_distilation,
    recipe_crushed_lead, recipe_crushed_silver, recipe_crushed_gold, recipe_crushed_zinc, recipe_crushed_nickel,
    recipe_crushed_rutile, recipe_lube_glycerol, recipe_explosives_glycerol, recipe_resin_glycerol,
}

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
--bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-quartz")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-rutile")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushed-nickel")

bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-silver")
--bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-cobalt")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-bauxite")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-gold")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-lead")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-tin")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-tungsten")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-zinc")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-silver")
--bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-quartz")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-rutile")
bobmods.lib.tech.add_recipe_unlock("crusher", "crushing-nickel")
