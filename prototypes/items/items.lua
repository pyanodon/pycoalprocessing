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
        {type="fluid", name="water", amount=10}, -- bob nitrogen
        {type="item", name="iron-plate", amount=10}, --bob nickel-plate
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
        {type="fluid", name="water", amount=10}, -- bob nitrogen
        {type="item", name="zinc-chloride", amount=2},
        {type="item", name="coke", amount=25},
        --{type="item", name="sodium-hydroxide", amount=5},
    },
    results={
        {type="item", name="active-carbon", amount=3},
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
        {type="fluid", name="water", amount=2}, --bob hydrogen-chloride
        {type="item", name="iron-plate", amount=1}, --bob zinc-plate
        {type="item", name="copper-plate", amount=1}, --bob --remove
    },
    results={
        {type="item", name="zinc-chloride", amount=1},
        --{type="fluid", name="hydrogen", amount=2}, --bob hydrogen
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
        {type="item", name="soil", amount=5},
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
        {type="item", name="iron-plate", amount=5}, --bob titanium-plate
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
    name = "pure_sand",
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
    name = "rich_dust",
    icon = "__pycoalprocessing__/graphics/icons/richdust.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "rich_dust",
    stack_size = 500
}
-------------------------------------------------------------------------------
--COAL DUST
local coal_dust ={
    type = "item",
    name = "coal_dust",
    icon = "__pycoalprocessing__/graphics/icons/coal_dust.png",
    flags = {"goes-to-main-inventory"},
	fuel_value = "6MJ",
    subgroup = "py-items",
    order = "coal_dust",
    stack_size = 500
}
-------------------------------------------------------------------------------
--CHROMITE SAND
local chromite_sand ={
    type = "item",
    name = "chromite_sand",
    icon = "__pycoalprocessing__/graphics/icons/chromite_sand.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "chromite_sand",
    stack_size = 500
}
-------------------------------------------------------------------------------
--NEXELIT-PLATE
local nexelit_plate ={
    type = "item",
    name = "nexelit_plate",
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
    name = "sand_casting",
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
        {type="fluid", name="lithia-water", amount=30},
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
        {type="item", name="nexelit_plate", amount=10},
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
		flask
    }
)
