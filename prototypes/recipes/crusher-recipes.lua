--NIOBIUM POWDER
local niobium_powder = {
    type = "recipe",
    name = "niobium-powder",
    category = "crusher",
    enabled = "false",
    energy_required = 3.5,
    ingredients ={
        {type="item", name="niobium-ore", amount=5},
    },
    results={
        {type="item", name="niobium-powder", amount=5},
		{type="item", name="stone", amount=2},
    },
	icon = "__pycoalprocessing__/graphics/icons/crush-niobium.png",
	main_product = "niobium-powder",
}
--IRON
local crushing_iron ={
    type = "recipe",
    name = "crushing-iron",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="iron-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-iron", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-iron",
    icon = "__pycoalprocessing__/graphics/icons/crush-iron.png",
    order = "a [py-crusher]",
}
--COPPER
local crushing_copper ={
    type = "recipe",
    name = "crushing-copper",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="copper-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-copper", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-copper",
    icon = "__pycoalprocessing__/graphics/icons/crush-copper.png",
    order = "b [py-crusher]",
}
--STONE to GRAVEL
-------------------------------------------------------------------------------
local crushing_stone = {
    type = "recipe",
    name = "stone-to-gravel",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="stone", amount=20},
    },
    results={
        {type="item", name="gravel", amount=15},
    },
    icon = "__pycoalprocessing__/graphics/icons/crush-stone.png",
    order = "c [py-crusher]",
}
--GREAVEL to SAND
-------------------------------------------------------------------------------
local crushing_gravel = {
    type = "recipe",
    name = "gravel-to-sand",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="gravel", amount=20},
    },
    results={
        {type="item", name="sand", amount=15},
    },
    icon = "__pycoalprocessing__/graphics/icons/crush-gravel.png",
    order = "d [py-crusher]",
}

data:extend{crushing_iron, crushing_copper, crushing_stone, crushing_gravel, niobium_powder}

if bobmods then --luacheck: globals bobmods

--BAUXITE
local crushing_bauxite ={
    type = "recipe",
    name = "crushing-bauxite",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="bauxite-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-bauxite", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-bauxite",
    icon = "__pycoalprocessing__/graphics/icons/crush-bauxite.png",
    order = "b [py-crusher]",
}
--GOLD
local crushing_gold ={
    type = "recipe",
    name = "crushing-gold",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="gold-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-gold", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-gold",
    icon = "__pycoalprocessing__/graphics/icons/crush-gold.png",
    order = "b [py-crusher]",
}
--LEAD
local crushing_lead ={
    type = "recipe",
    name = "crushing-lead",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="lead-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-lead", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-lead",
    icon = "__pycoalprocessing__/graphics/icons/crush-lead.png",
    order = "b [py-crusher]",
}
--NICKEL
local crushing_nickel ={
    type = "recipe",
    name = "crushing-nickel",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="nickel-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-nickel", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-nickel",
    icon = "__pycoalprocessing__/graphics/icons/crush-nickel.png",
    order = "b [py-crusher]",
}
--RUTILE
local crushing_rutile ={
    type = "recipe",
    name = "crushing-rutile",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="rutile-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-rutile", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-rutile",
    icon = "__pycoalprocessing__/graphics/icons/crush-rutile.png",
    order = "b [py-crusher]",
}
--SILVER
local crushing_silver ={
    type = "recipe",
    name = "crushing-silver",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="silver-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-silver", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-silver",
    icon = "__pycoalprocessing__/graphics/icons/crush-silver.png",
    order = "b [py-crusher]",
}
--TIN
local crushing_tin ={
    type = "recipe",
    name = "crushing-tin",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="tin-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-tin", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-tin",
    icon = "__pycoalprocessing__/graphics/icons/crush-tin.png",
    order = "b [py-crusher]",
}
--TUNGSTEN
local crushing_tungsten ={
    type = "recipe",
    name = "crushing-tungsten",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="tungsten-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-tungsten", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-tungsten",
    icon = "__pycoalprocessing__/graphics/icons/crush-tungsten.png",
    order = "b [py-crusher]",
}
--ZINC
local crushing_zinc ={
    type = "recipe",
    name = "crushing-zinc",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="zinc-ore", amount=5,},
    },
    results={
        {type="item", name="crushed-zinc", amount=5,},
		{type="item", name="stone", amount=1,},
    },
    main_product= "crushed-zinc",
    icon = "__pycoalprocessing__/graphics/icons/crush-zinc.png",
    order = "b [py-crusher]",
}

    data:extend{
        crushing_bauxite,
        crushing_gold,
        crushing_lead,
        crushing_nickel,
        crushing_rutile,
        crushing_silver,
        crushing_tin,
        crushing_tungsten,
        crushing_zinc
    }
end
