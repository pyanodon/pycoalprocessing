-------------------------------------------------------------------------------
--NOT A GOOD NAME
local ash ={
    type = "item",
    name = "ash",
    icon = "__pycoalprocessing__/graphics/icons/ash.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "ash",
    stack_size = 100
}

-------------------------------------------------------------------------------
--CHROMIUM
local chromium ={
    type = "item",
    name = "chromium",
    icon = "__pycoalprocessing__/graphics/icons/chromium.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "chromium",
    stack_size = 100
}
-------------------------------------------------------------------------------
--GRAVEL
local gravel = {
    type = "item",
    name = "gravel",
    icon = "__pycoalprocessing__/graphics/icons/gravel.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "gravel",
    stack_size = 300
}

-------------------------------------------------------------------------------
--NOT A GOOD NAME
local coke = {
    type = "item",
    name = "coke",
    fuel_value = "10MJ",
    icon = "__pycoalprocessing__/graphics/icons/coke.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "coke",
    stack_size = 500
}
-------------------------------------------------------------------------------
--NICHROME
local recipe_nichrome = {
    type = "recipe",
    name = "nichrome",
    category = "hpf",
    enabled = "false",
    energy_required = 2.5,
    ingredients ={
        {type="fluid", name="water", amount=10}, --updated-bob nitrogen
        {type="item", name="iron-plate", amount=10}, --updated-bob nickel-plate
        {type="item", name="chromium", amount=5},
    },
    result = "nichrome"
}
local nichrome = {
    type = "item",
    name = "nichrome",
    icon = "__pycoalprocessing__/graphics/icons/nichrome.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "nichrome",
    stack_size = 200
}

-------------------------------------------------------------------------------
--IRON OXIDE
--Iron ore is typically hidden as a product, smelt directly to iron plate instead
--2x iron-oxide = 1x iron-plate in the same time it takes 1x iron-ore -> 1x plate
local recipe_iron_oxide = {
    type = "recipe",
    name = "iron-oxide",
    category = "smelting",
    energy_required = 3.5,
    ingredients = {{"iron-oxide", 2}},
    result = "iron-plate"
}

local iron_oxide = {
    type = "item",
    name = "iron-oxide",
    icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "iron-oxide",
    stack_size = 200
}

--ACTIVE CARBON
-------------------------------------------------------------------------------
local recipe_active_carbon = {
    type = "recipe",
    name = "active-carbon",
    category = "hpf",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="fluid", name="water", amount=10}, --updated-bob nitrogen
        {type="item", name="zinc-chloride", amount=2},
        {type="item", name="coke", amount=25},
        --{type="item", name="sodium-hydroxide", amount=5},
    },
    results={
        {type="item", name="active-carbon", amount=5},
    },
}

local active_carbon = {
    type = "item",
    name = "active-carbon",
    fuel_value = "25MJ",
    icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "hpf-[active-carbon]",
    stack_size = 100
}

--ZINC CHLORIDE
-------------------------------------------------------------------------------
local recipe_zinc_chloride ={
    type = "recipe",
    name = "zinc-chloride",
    category = "chemistry",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="fluid", name="water", amount=2}, --updated-bob hydrogen-chloride
        {type="item", name="iron-plate", amount=1}, --updated-bob zinc-plate
        {type="item", name="copper-plate", amount=1}, --updated-bob --remove
    },
    results={
        {type="item", name="zinc-chloride", amount=1},
        --{type="fluid", name="hydrogen", amount=2}, --updated-bob hydrogen
    },
    main_product= "zinc-chloride",
    icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
    order = "d [syn-gas]",
}

local zinc_chloride = {
    type = "item",
    name = "zinc-chloride",
    icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "zinc-chloride",
    stack_size = 100
}

-------------------------------------------------------------------------------
--TAILINGS DUST
local recipe_tailings_dust = {
    type = "recipe",
    name = "tailings-dust",
    category = "evaporator",
    enabled = "false",
    energy_required = 6,
    ingredients ={
        {type="fluid", name="dirty-water", amount=10},
    },
    results={
        {type="item", name="tailings-dust", amount=6},
        --{type="fluid", name="water", amount=4, temperature=100}
    },
    main_product = "tailings-dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_dust.png",
}
local tailings_dust = {
    type = "item",
    name = "tailings-dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_dust.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "tailings-dust",
    stack_size = 1000
}

-------------------------------------------------------------------------------
-- SOIL
local recipe_soil ={
    type = "recipe",
    name = "soil",
    category = "soil-extraction",
    enabled = "true",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="water", amount=100},
    },
    results={
        {type="item", name="soil", amount=10},
    },
    icon = "__pycoalprocessing__/graphics/icons/soil.png",
}
local soil = {
    type = "item",
    name = "soil",
    icon = "__pycoalprocessing__/graphics/icons/soil.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "soil",
    stack_size = 1000
}

-------------------------------------------------------------------------------
-- NEXELIT-ORE
local nexelit_ore = {
    type = "item",
    name = "nexelit-ore",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 300
}

-------------------------------------------------------------------------------
-- DRILL-HEAD
local recipe_drill_head = {
    type = "recipe",
    name = "drill-head",
    category = "crafting",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="item", name="steel-plate", amount=8},
        {type="item", name="chromium", amount=3},
        {type="item", name="iron-plate", amount=5}, --updated-bob titanium-plate
    },
    results={
        {type="item", name="drill-head", amount=2},
    },
}

local drill_head = {
    type = "item",
    name = "drill-head",
    icon = "__pycoalprocessing__/graphics/icons/drill-head.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}

-------------------------------------------------------------------------------
--SAND
local sand ={
    type = "item",
    name = "sand",
    icon = "__pycoalprocessing__/graphics/icons/sand.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "sand",
    stack_size = 500
}

-------------------------------------------------------------------------------
--PURE SAND
local pure_sand ={
    type = "item",
    name = "pure-sand",
    icon = "__pycoalprocessing__/graphics/icons/pure-sand.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "pure-sand",
    stack_size = 500
}
-------------------------------------------------------------------------------
--LIMESTONE
local limestone ={
    type = "item",
    name = "limestone",
    icon = "__pycoalprocessing__/graphics/icons/limestone.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "limestone",
    stack_size = 300
}
-------------------------------------------------------------------------------
--ORGANICS
local organics ={
    type = "item",
    name = "organics",
    icon = "__pycoalprocessing__/graphics/icons/organics.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "organics",
    stack_size = 300
}
-------------------------------------------------------------------------------
--COARSE FRACTION
local coarse ={
    type = "item",
    name = "coarse",
    icon = "__pycoalprocessing__/graphics/icons/coarse.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "coarse",
    stack_size = 500
}
-------------------------------------------------------------------------------
--RICH DUST
local rich_dust ={
    type = "item",
    name = "rich-dust",
    icon = "__pycoalprocessing__/graphics/icons/richdust.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "rich-dust",
    stack_size = 500
}
-------------------------------------------------------------------------------
--COAL DUST
local coal_dust ={
    type = "item",
    name = "coal-dust",
    icon = "__pycoalprocessing__/graphics/icons/coal_dust.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "7MJ",
    subgroup = "py-items",
    order = "coal-dust",
    stack_size = 500
}
-------------------------------------------------------------------------------
--CHROMITE SAND
local chromite_sand ={
    type = "item",
    name = "chromite-sand",
    icon = "__pycoalprocessing__/graphics/icons/chromite_sand.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "chromite-sand",
    stack_size = 500
}
-------------------------------------------------------------------------------
--NEXELIT-PLATE
local nexelit_plate ={
    type = "item",
    name = "nexelit-plate",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "nexelit-plate",
    stack_size = 100

}
-------------------------------------------------------------------------------
--SAND-CASTING
local sand_casting ={
    type = "item",
    name = "sand-casting",
    icon = "__pycoalprocessing__/graphics/icons/sand-casting.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "sand-casting",
    stack_size = 200

}
-------------------------------------------------------------------------------
-- LITHIUM PEROXIDE
local recipe_lithium_peroxide = {
    type = "recipe",
    name = "lithium-peroxide",
    category = "chemistry",
    enabled = "false",
    energy_required = 5,
    ingredients ={
        --{type="fluid", name="lithia-water", amount=30},
        {type="fluid", name="water", amount=30},
        {type="fluid", name="hydrogen-peroxide", amount=10},
    },
    results={
        {type="item", name="lithium-peroxide", amount=5},
    },
}

local lithium_peroxide = {
    type = "item",
    name = "lithium-peroxide",
    icon = "__pycoalprocessing__/graphics/icons/lithium-peroxide.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}
-------------------------------------------------------------------------------
-- NEXELIT CARTRIDGE
local recipe_nexelit_cartridge = {
    type = "recipe",
    name = "nexelit-cartridge",
    category = "crafting",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="item", name="lithium-peroxide", amount=25},
        {type="item", name="nexelit-plate", amount=10},
    },
    results={
        {type="item", name="nexelit-cartridge", amount=1},
    },
}

local nexelit_cartridge = {
    type = "item",
    name = "nexelit-cartridge",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-cartridge.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- SATURATED NEXELIT CARTRIDGE
local saturated_nexelit_cartridge = {
    type = "item",
    name = "saturated-nexelit-cartridge",
    icon = "__pycoalprocessing__/graphics/icons/saturated-nexelit-cartridge.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- LIME
local recipe_lime = {
    type = "recipe",
    name = "lime",
    category = "hpf",
    enabled = "false",
    energy_required = 5,
    ingredients ={
        {type="item", name="coke", amount=25},
        {type="item", name="limestone", amount=10},
    },
    results={
        {type="item", name="lime", amount=10},
        {type="fluid", name="carbon-dioxide", amount=10},
    },
    icon = "__pycoalprocessing__/graphics/icons/lime.png",
    subgroup = "py-items",
    order = "g",
}
local lime = {
    type = "item",
    name = "lime",
    icon = "__pycoalprocessing__/graphics/icons/lime.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
--FUEL ROD MK01
-------------------------------------------------------------------------------
local recipe_fuelrod_mk01 = {
    type = "recipe",
    name = "fuelrod-mk01",
    category = "hpf",
    enabled = "false",
    energy_required = 3.5,
    ingredients ={
        {type="item", name="iron-plate", amount=4},
        {type="item", name="nexelit-ore", amount=25},
        {type="item", name="coke", amount=5},
    },
    results={
        {type="item", name="fuelrod-mk01", amount=1},
    },
}

local fuelrod_mk01 = {
    type = "item",
    name = "fuelrod-mk01",
    fuel_value = "150MJ",
    icon = "__pycoalprocessing__/graphics/icons/fuelrod-mk01.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "hpf-[active-carbon]",
    stack_size = 50
}
-------------------------------------------------------------------------------
--FAWOGAE PRODUCTION
-------------------------------------------------------------------------------
local recipe_fawogae = {
    type = "recipe",
    name = "fawogae",
    category = "fawogae",
    enabled = "true",
    energy_required = 5.0,
    ingredients ={
        {type="fluid", name="water", amount=90},
    },
    results={
        {type="item", name="fawogae", amount=5},
    },
}

local fawogae = {
    type = "item",
    name = "fawogae",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-icon.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
    stack_size = 300
}
-------------------------------------------------------------------------------
-- FAWOGAE SUBSTRATE
local fawogae_substrate = {
    type = "item",
    name = "fawogae-substrate",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-substrate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- FLASK
local flask = {
    type = "item",
    name = "flask",
    icon = "__pycoalprocessing__/graphics/icons/flask.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 50
}
--BONEMEAL
-------------------------------------------------------------------------------
local bonemeal = {
    type = "item",
    name = "bonemeal",
    icon = "__pycoalprocessing__/graphics/icons/bonemeal.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
    stack_size = 300
}
-------------------------------------------------------------------------------
-- RAW BORAX
local rawborax = {
    type = "item",
    name = "raw-borax",
    icon = "__pycoalprocessing__/graphics/icons/raw-borax.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- BORAX
local borax = {
    type = "item",
    name = "borax",
    icon = "__pycoalprocessing__/graphics/icons/borax.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- RALESIA
local ralesia = {
    type = "item",
    name = "ralesia",
    icon = "__pycoalprocessing__/graphics/icons/ralesia.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}
-------------------------------------------------------------------------------
-- RICH CLAY
local rich_clay = {
    type = "item",
    name = "rich-clay",
    icon = "__pycoalprocessing__/graphics/icons/rich-clay.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- GROUND SAMPLE 01
local ground_sample01 = {
    type = "item",
    name = "ground-sample01",
    icon = "__pycoalprocessing__/graphics/icons/ground-sample01.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- BIO SAMPLE 01
local bio_sample01 = {
    type = "item",
    name = "bio-sample01",
    icon = "__pycoalprocessing__/graphics/icons/bio-sample01.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- ALIEN SAMPLE 01
local alien_sample01 = {
    type = "item",
    name = "alien-sample01",
    icon = "__pycoalprocessing__/graphics/icons/alien-sample01.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- EQUIPMENT CHASSI
local equipment_chassi = {
    type = "item",
    name = "equipment-chassi",
    icon = "__pycoalprocessing__/graphics/icons/equipment-chassi.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- LAB INSTRUMENT
local lab_instrument = {
    type = "item",
    name = "lab-instrument",
    icon = "__pycoalprocessing__/graphics/icons/lab-instrument.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- LENS
local lens = {
    type = "item",
    name = "lens",
    icon = "__pycoalprocessing__/graphics/icons/lens.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- BORON TRIOXIDE
local boron_trioxide = {
    type = "item",
    name = "boron-trioxide",
	enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/boron-trioxide.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- RALESIA SEEDS
local ralesia_seeds = {
    type = "item",
    name = "ralesia-seeds",
	enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-seeds.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
--NIOBIUM ORE
-------------------------------------------------------------------------------
local recipe_niobium_ore = {
    type = "recipe",
    name = "niobium-ore",
    category = "niobium",
    enabled = "false",
    energy_required = 7,
    ingredients ={
        {type="item", name="drill-head", amount=1},
        {type="fluid", name="refsyngas", amount=10},
    },
    results={
        {type="item", name="niobium-ore", amount=10},
    },
}

local niobium_ore = {
    type = "item",
    name = "niobium-ore",
    icon = "__pycoalprocessing__/graphics/icons/niobium-ore.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "g",
    stack_size = 100
}
--NIOBIUM POWDER
-------------------------------------------------------------------------------
local niobium_powder = {
    type = "item",
    name = "niobium-powder",
    icon = "__pycoalprocessing__/graphics/icons/niobium-powder.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    --order = "g",
    stack_size = 100
}
--NIOBIUM DUST
-------------------------------------------------------------------------------
local recipe_niobium_dust = {
    type = "recipe",
    name = "niobium-dust",
    category = "ball-mill",
    enabled = "false",
    energy_required = 5,
    ingredients ={
        {type="item", name="niobium-powder", amount=5},
    },
    results={
        {type="item", name="niobium-dust", amount=5},
		{type="item", name="gravel", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/niobium-dust.png",
	main_product = "niobium-dust",
}

local niobium_dust = {
    type = "item",
    name = "niobium-dust",
    icon = "__pycoalprocessing__/graphics/icons/niobium-dust.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-mill",
    --order = "g",
    stack_size = 100
}
--NIOBIUM CONCENTRATE
-------------------------------------------------------------------------------
local recipe_niobium_concentrate = {
    type = "recipe",
    name = "niobium-concentrate",
    category = "classifier",
    enabled = "false",
    energy_required = 5,
    ingredients ={
        {type="item", name="niobium-dust", amount=5},
    },
    results={
        {type="item", name="niobium-concentrate", amount=5},
		{type="item", name="sand", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/class-niobium.png",
	main_product = "niobium-concentrate",
}

local niobium_concentrate = {
    type = "item",
    name = "niobium-concentrate",
    icon = "__pycoalprocessing__/graphics/icons/niobium-concentrate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 100
}
--MUKMOUX FAT
-------------------------------------------------------------------------------
local recipe_mukmoux_fat = {
    type = "recipe",
    name = "mukmoux-fat",
    category = "mukmoux",
    enabled = "false",
    energy_required = 7.2,
    ingredients ={
        {type="item", name="fawogae", amount=5},
		{type="item", name="ralesia-seeds", amount=50},
    },
    results={
        {type="item", name="mukmoux-fat", amount=10},
    },
	icon = "__pycoalprocessing__/graphics/icons/mukmoux-fat.png",
	main_product = "mukmoux-fat",
}

local mukmoux_fat = {
    type = "item",
    name = "mukmoux-fat",
    icon = "__pycoalprocessing__/graphics/icons/mukmoux-fat.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}
--NIOBIUM OXIDE
-------------------------------------------------------------------------------
local recipe_niobium_oxide = {
    type = "recipe",
    name = "niobium-oxide",
    category = "chemistry",
    enabled = "false",
    energy_required = 1.5,
    ingredients ={
        {type="fluid", name="nitrogen-dioxide", amount=30},
		{type="fluid", name="niobium-complex", amount=10},
    },
    results={
        {type="item", name="niobium-oxide", amount=10},
    },
	icon = "__pycoalprocessing__/graphics/icons/niobium-oxide.png",
	main_product = "niobium-oxide",
}

local niobium_oxide = {
    type = "item",
    name = "niobium-oxide",
    icon = "__pycoalprocessing__/graphics/icons/niobium-oxide.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}
--NIOBIUM PLATE
-------------------------------------------------------------------------------
local recipe_niobium_plate = {
    type = "recipe",
    name = "niobium-plate",
    category = "electrolysis",
    enabled = "false",
    energy_required = 1.5,
    ingredients ={
        {type="item", name="salt", amount=20},
		{type="item", name="niobium-oxide", amount=6},
    },
    results={
        {type="item", name="niobium-plate", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/niobium-plate.png",
	main_product = "niobium-plate",
}

local niobium_plate = {
    type = "item",
    name = "niobium-plate",
    icon = "__pycoalprocessing__/graphics/icons/niobium-plate.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}
-------------------------------------------------------------------------------
-- RARE-EARTH ORE
local rare_earth_ore = {
    type = "item",
    name = "rare-earth-ore",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-ore.png",
	enabled = "false",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 500
}
--RARE-EARTH-POWDER
-------------------------------------------------------------------------------
local recipe_rare_earth_powder = {
    type = "recipe",
    name = "rare-earth-powder",
    category = "crusher",
    enabled = "false",
    energy_required = 4.0,
    ingredients ={
        {type="item", name="rare-earth-ore", amount=10},
    },
    results={
        {type="item", name="rare-earth-powder", amount=8},
		{type="item", name="stone", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/crush-rare-earth.png",
	main_product = "rare-earth-powder",
}

local rare_earth_powder = {
    type = "item",
    name = "rare-earth-powder",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-powder.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    --order = "g",
    stack_size = 200
}

--RARE-EARTH-DUST
-------------------------------------------------------------------------------
local recipe_rare_earth_dust = {
    type = "recipe",
    name = "rare-earth-dust",
    category = "ball-mill",
    enabled = "false",
    energy_required = 5.0,
    ingredients ={
        {type="item", name="rare-earth-powder", amount=8},
    },
    results={
        {type="item", name="rare-earth-dust", amount=5},
		{type="item", name="gravel", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/rare-earth-dust.png",
	main_product = "rare-earth-dust",
}

local rare_earth_dust = {
    type = "item",
    name = "rare-earth-dust",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-dust.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    --order = "g",
    stack_size = 200
}
--GLASS CORE
-------------------------------------------------------------------------------
local recipe_glass_core = {
    type = "recipe",
    name = "glass-core",
    category = "hpf",
    enabled = "false",
    energy_required = 3.5,
    ingredients ={
        {type="item", name="glass", amount=10},
		{type="item", name="silver-plate", amount=3},
		{type="item", name="sulfur", amount=4},
    },
    results={
        {type="item", name="glass-core", amount=1},
    },
	icon = "__pycoalprocessing__/graphics/icons/glass-core.png",
	main_product = "glass-core",
}

local glass_core = {
    type = "item",
	enabled = "false",
    name = "glass-core",
    icon = "__pycoalprocessing__/graphics/icons/glass-core.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    --order = "g",
    stack_size = 200
}
--CLADDING
-------------------------------------------------------------------------------
local recipe_cladding = {
    type = "recipe",
    name = "cladding",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 2.0,
    ingredients ={
        {type="item", name="glass", amount=5},
		{type="fluid", name="niobium-complex", amount=8},
    },
    results={
        {type="item", name="cladding", amount=1},
    },
	icon = "__pycoalprocessing__/graphics/icons/cladding.png",
	main_product = "cladding",
}

local cladding = {
    type = "item",
	enabled = "false",
    name = "cladding",
    icon = "__pycoalprocessing__/graphics/icons/cladding.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--PPD
-------------------------------------------------------------------------------
local recipe_ppd = {
    type = "recipe",
    name = "ppd",
    category = "electrolysis",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="fluid", name="hydrogen", amount=50},
		{type="fluid", name="aromatics", amount=5},
    },
    results={
        {type="item", name="ppd", amount=10},
    },
	icon = "__pycoalprocessing__/graphics/icons/ppd.png",
	main_product = "ppd",
}

local ppd = {
    type = "item",
	enabled = "false",
    name = "ppd",
    icon = "__pycoalprocessing__/graphics/icons/ppd.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 500
}

--KEVLAR
-------------------------------------------------------------------------------
local recipe_kevlar = {
    type = "recipe",
    name = "kevlar",
    category = "chemistry",
    enabled = "false",
    energy_required = 6.0,
    ingredients ={
		{type="item", name="ppd", amount=5},
        {type="fluid", name="tpa", amount=5},
		{type="fluid", name="organic-solvent", amount=10},
    },
    results={
        {type="item", name="kevlar", amount=5},
    },
	icon = "__pycoalprocessing__/graphics/icons/kevlar.png",
	main_product = "kevlar",
}

local kevlar = {
    type = "item",
	enabled = "false",
    name = "kevlar",
    icon = "__pycoalprocessing__/graphics/icons/kevlar.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--KEVLAR COATING
-------------------------------------------------------------------------------
local recipe_kevlar_coating = {
    type = "recipe",
    name = "kevlar-coating",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="copper-coating", amount=1},
		{type="item", name="kevlar", amount=1},

    },
    results={
        {type="item", name="kevlar-coating", amount=1},
    },
	main_product= "kevlar-coating",
    icon = "__pycoalprocessing__/graphics/icons/kevlar-coating.png",
}

local kevlar_coating = {
    type = "item",
	enabled = "false",
    name = "kevlar-coating",
    icon = "__pycoalprocessing__/graphics/icons/kevlar-coating.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--NbFe ALLOY
-------------------------------------------------------------------------------
local recipe_nbfe_alloy = {
    type = "recipe",
    name = "nbfe-alloy",
    category = "smelting",
    enabled = "false",
    energy_required = 4.0,
    ingredients ={
		{type="item", name="iron-plate", amount=15},
        {type="item", name="niobium-plate", amount=3},
    },
    results={
        {type="item", name="nbfe-alloy", amount=1},
    },
	icon = "__pycoalprocessing__/graphics/icons/nbfe-alloy.png",
	main_product = "nbfe-alloy",
}

local nbfe_alloy = {
    type = "item",
	enabled = "false",
    name = "nbfe-alloy",
    icon = "__pycoalprocessing__/graphics/icons/nbfe-alloy.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--NbFe COATING
-------------------------------------------------------------------------------
local recipe_nbfe_coating = {
    type = "recipe",
    name = "nbfe-coating",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="kevlar-coating", amount=1},
		{type="item", name="nbfe-alloy", amount=1},

    },
    results={
        {type="item", name="nbfe-coating", amount=1},
    },
	main_product= "nbfe-coating",
    icon = "__pycoalprocessing__/graphics/icons/nbfe-coating.png",
}

local nbfe_coating = {
    type = "item",
	enabled = "false",
    name = "nbfe-coating",
    icon = "__pycoalprocessing__/graphics/icons/nbfe-coating.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--ATTACH CLADDING TO GLASS CORE
-------------------------------------------------------------------------------
local recipe_cladded_core = {
    type = "recipe",
    name = "cladded-core",
    category = "crafting",
    enabled = "false",
    energy_required = 2.0,
    ingredients ={
		{type="item", name="cladding", amount=1},
		{type="item", name="glass-core", amount=1},
    },
    results={
        {type="item", name="cladded-core", amount=1},
    },
	main_product= "cladded-core",
    icon = "__pycoalprocessing__/graphics/icons/cladded-core.png",
}
local cladded_core = {
    type = "item",
	enabled = "false",
    name = "cladded-core",
    icon = "__pycoalprocessing__/graphics/icons/cladded-core.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--COPPER COATING
-------------------------------------------------------------------------------
local recipe_copper_coating = {
    type = "recipe",
    name = "copper-coating",
    category = "electrolysis",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="copper-plate", amount=10},
		{type="item", name="cladded-core", amount=1},
		{type="fluid", name="water-mineralized", amount=15},

    },
    results={
        {type="item", name="copper-coating", amount=1},
    },
	main_product= "copper-coating",
    icon = "__pycoalprocessing__/graphics/icons/copper-coating.png",
}
local copper_coating = {
    type = "item",
	enabled = "false",
    name = "copper-coating",
    icon = "__pycoalprocessing__/graphics/icons/copper-coating.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--OPTICAL FIBER
-------------------------------------------------------------------------------
local recipe_optical_fiber = {
    type = "recipe",
    name = "optical-fiber",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="plastic-bar", amount=2},
		{type="item", name="nbfe-coating", amount=1},

    },
    results={
        {type="item", name="optical-fiber", amount=1},
    },
	main_product= "optical-fiber",
    icon = "__pycoalprocessing__/graphics/icons/optical-fiber.png",
}
local optical_fiber = {
    type = "item",
	enabled = "false",
    name = "optical-fiber",
    icon = "__pycoalprocessing__/graphics/icons/optical-fiber.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--BIOFILM
-------------------------------------------------------------------------------
local recipe_biofilm = {
    type = "recipe",
    name = "biofilm",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="fawogae-substrate", amount=20},
		{type="item", name="lime", amount=5},
		{type="item", name="organics", amount=5},
    },
    results={
        {type="item", name="biofilm", amount=1},
    },
	main_product= "biofilm",
    icon = "__pycoalprocessing__/graphics/icons/biofilm.png",
}
local biofilm = {
    type = "item",
	enabled = "false",
    name = "biofilm",
    icon = "__pycoalprocessing__/graphics/icons/biofilm.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--MEDIA FILTER
-------------------------------------------------------------------------------
local recipe_filtration_media = {
    type = "recipe",
    name = "filtration-media",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="sand", amount=30},
		{type="item", name="active-carbon", amount=3},
		{type="item", name="gravel", amount=25},
		{type="item", name="glass", amount=5},
    },
    results={
        {type="item", name="filtration-media", amount=1},
    },
	main_product= "filtration-media",
    icon = "__pycoalprocessing__/graphics/icons/filtration-media.png",
}
local filtration_media = {
    type = "item",
	enabled = "false",
    name = "filtration-media",
    icon = "__pycoalprocessing__/graphics/icons/filtration-media.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
--COAL-BRIQUETTE
-------------------------------------------------------------------------------
local recipe_coal_briquette = {
    type = "recipe",
    name = "coal-briquette",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 3.0,
    ingredients ={
		{type="item", name="coal-dust", amount=35},
		{type="fluid", name="glycerol", amount=10},
		{type="fluid", name="creosote", amount=15},
		{type="fluid", name="tar", amount=5},
    },
    results={
        {type="item", name="coal-briquette", amount=2},
    },
	main_product= "coal-briquette",
    icon = "__pycoalprocessing__/graphics/icons/coal-briquette.png",
}
local coal_briquette = {
    type = "item",
	enabled = "false",
    name = "coal-briquette",
	fuel_value = "20MJ",
    icon = "__pycoalprocessing__/graphics/icons/coal-briquette.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}
-------------------------------------------------------------------------------
-- CALCIUM CARBIDE
local recipe_calcium_carbide = {
    type = "recipe",
    name = "calcium-carbide",
    category = "hpf",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="item", name="coke", amount=10},
        {type="item", name="lime", amount=2},
    },
    results={
        {type="item", name="calcium-carbide", amount=10},
    },
    icon = "__pycoalprocessing__/graphics/icons/calcium-carbide.png",
    subgroup = "py-items",
    order = "g",
}
local calcium_carbide = {
    type = "item",
    name = "calcium-carbide",
    icon = "__pycoalprocessing__/graphics/icons/calcium-carbide.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}
-------------------------------------------------------------------------------
-- CRUSHED IRON
local crushed_iron = {
    type = "item",
    name = "crushed-iron",
	enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-iron.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
-- CRUSHED COPPER
local crushed_copper = {
    type = "item",
    name = "crushed-copper",
	enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-copper.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}
-------------------------------------------------------------------------------
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
 -------------------------------------------------------------------------------
data:extend(
    {
        ash,
        chromium,
        coke,
        recipe_nichrome,
        nichrome,
        recipe_iron_oxide,
        iron_oxide,
        recipe_active_carbon,
        active_carbon,
        zinc_chloride,
        recipe_zinc_chloride,
        recipe_tailings_dust,
        tailings_dust,
        recipe_soil,
        soil,
        nexelit_ore,
        recipe_drill_head,
        drill_head,
        sand,
        limestone,
        organics,
        coarse,
        gravel,
        rich_dust,
        coal_dust,
        pure_sand,
        chromite_sand,
        nexelit_plate,
        sand_casting,
        recipe_lithium_peroxide,
        lithium_peroxide,
        recipe_nexelit_cartridge,
        nexelit_cartridge,
        saturated_nexelit_cartridge,
        recipe_lime,
        lime,
        recipe_fuelrod_mk01,
        fuelrod_mk01,
        recipe_fawogae,
        fawogae,
        fawogae_substrate,
        flask,
        bonemeal,
        rawborax,
        borax,
        ralesia,
        rich_clay,
        ground_sample01,
        bio_sample01,
        alien_sample01,
        equipment_chassi,
        lab_instrument,
        lens,
        boron_trioxide,
        ralesia_seeds,
		recipe_niobium_ore,
		niobium_ore,
		niobium_powder,
		recipe_niobium_dust,
		niobium_dust,
		recipe_niobium_concentrate,
		niobium_concentrate,
		recipe_mukmoux_fat,
		mukmoux_fat,
		recipe_niobium_oxide,
		niobium_oxide,
		recipe_niobium_plate,
		niobium_plate,
		rare_earth_ore,
		recipe_rare_earth_powder,
		rare_earth_powder,
		recipe_rare_earth_dust,
		rare_earth_dust,
		recipe_glass_core,
		glass_core,
		recipe_cladding,
		cladding,
		recipe_cladded_core,
		cladded_core,
		recipe_copper_coating,
		copper_coating,
		recipe_kevlar,
		kevlar,
		recipe_kevlar_coating,
		kevlar_coating,
		recipe_ppd,
		ppd,
		recipe_nbfe_alloy,
		nbfe_alloy,
		recipe_nbfe_coating,
		nbfe_coating,
		recipe_optical_fiber,
		optical_fiber,
		recipe_biofilm,
		biofilm,
		recipe_filtration_media,
		filtration_media,
		recipe_coal_briquette,
		coal_briquette,
		recipe_calcium_carbide,
		calcium_carbide,
		crushed_iron,
		crushed_copper,
		crushed_bauxite,
		crushed_gold,
		crushed_lead,
		crushed_nickel,
		crushed_rutile,
		crushed_silver,
		crushed_tin,
		crushed_tungsten,
		crushed_zinc
    }
)
