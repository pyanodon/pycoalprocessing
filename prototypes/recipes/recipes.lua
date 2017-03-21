-------------------------------------------------------------------------------
--[[Recipes without new item results]]--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--Making Chromium
local making_chromium ={
    type = "recipe",
    name = "making_chromium",
    category = "hpf",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="carbon-dioxide", amount=10},
		{type="item", name="chromite_sand", amount=5},
		{type="item", name="coke", amount=5},
		{type="item", name="limestone", amount=5},
    },
    results={
        {type="item", name="chromium", amount=1,},
    },
    main_product= "chromium",
    icon = "__pycoalprocessing__/graphics/icons/chromium.png",
    subgroup = "py-items-hpf",
    order = "hpf-[chromium]",
}

--Create coal from wood
local raw_wood_to_coal = {
    type = "recipe",
    name = "raw-wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["raw-wood"].icon, tint={a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[raw-wood-to-coal]",
    ingredients = {
        {type="item", name="raw-wood", amount=1}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

local wood_to_coal = {
    type = "recipe",
    name = "wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["wood"].icon, tint = {a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[wood-to-coal]",
    ingredients = {
        {type="item", name="wood", amount=2}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

-------------------------------------------------------------------------------
--Extract sulfur from acidgas
local extract_sulfur ={
    type = "recipe",
    name = "extract-sulfur",
    category = "desulfurization",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="acidgas", amount=10,},
    },
    results={
        {type="item", name="sulfur", amount=2,},
    },
    main_product= "sulfur",
    icon = data.raw.item.sulfur.icon,
    subgroup = "py-items",
    order = "sulfur",
}

-------------------------------------------------------------------------------
--Turn warm water into cooled water
local cooling_water ={
    type = "recipe",
    name = "cooling-water",
    category = "cooling",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="water", amount=5, temperature=100},
    },
    results={
        {type="fluid", name="water", amount=5, temperature=15},
    },
    main_product= "water",
    subgroup = "py-fluids",
    order = "water",
    icon = "__pycoalprocessing__/graphics/icons/cooling-water.png",
}

-------------------------------------------------------------------------------
--FLUEGAS TO SYNGAS
local fluegas_to_syngas ={
    type = "recipe",
    name = "fluegas_to_syngas",
    category = "carbonfilter",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="flue-gas", amount=300},
        {type="item", name="active-carbon", amount=5},

    },
    results={
        {type="fluid", name="syngas", amount=30},
    },
    subgroup = "py-syngas",
    order = "fluegas_to_syngas",
    icon = "__pycoalprocessing__/graphics/icons/fluegas_to_syngas.png",
}

-------------------------------------------------------------------------------
--COARSE CLASSIFICATION
local coarse_classification ={
    type = "recipe",
    name = "coarse_classification",
    category = "classifier",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="coarse", amount=5},
    },
    results={
        {type="item", name="stone", amount=5},
		{type="item", name="iron-oxide", amount=2},
		{type="item", name="gravel", amount=4},
    },
    main_product= "gravel",
    icon = "__pycoalprocessing__/graphics/icons/class-coarse.png",
    subgroup = "py-items",
    order = "classifier",
}
-------------------------------------------------------------------------------
--PURE SAND CLASSIFICATION
local pure_sand_classification ={
    type = "recipe",
    name = "pure_sand_classification",
    category = "classifier",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="pure_sand", amount=16},
    },
    results={
        {type="item", name="rich_dust", amount=5},
		{type="item", name="gravel", amount=2},
    },
    main_product= "rich_dust",
    icon = "__pycoalprocessing__/graphics/icons/class-pure-sand.png",
    subgroup = "py-items",
    order = "classifier",
}

-------------------------------------------------------------------------------
--SOIL SEPARATION
local soil_separation ={
    type = "recipe",
    name = "soil_separation",
    category = "solid-separator",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="soil", amount=10},
    },
    results={
        {type="item", name="sand", amount=7},
		{type="item", name="coarse", amount=3},
		{type="item", name="limestone", amount=4},
		{type="item", name="organics", amount=2},
    },
    main_product= "sand",
    icon = "__pycoalprocessing__/graphics/icons/soil-separation.png",
    subgroup = "py-items",
    order = "sand",
}
-------------------------------------------------------------------------------
--RICH DUST SEPARATION
local richdust_separation ={
    type = "recipe",
    name = "richdust_separation",
    category = "solid-separator",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="rich_dust", amount=10},
    },
    results={
        {type="item", name="iron-oxide", amount=2},
		{type="item", name="chromite_sand", amount=6},

    },
    main_product= "chromite_sand",
    icon = "__pycoalprocessing__/graphics/icons/richdust-separation.png",
    subgroup = "py-items",
    order = "richdust",
}

-------------------------------------------------------------------------------
--TAILINGS SEPARATION
local tailings_separation ={
    type = "recipe",
    name = "tailings_separation",
    category = "solid-separator",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="tailings-dust", amount=15},
    },
    results={
        {type="item", name="coal_dust", amount=8},
		{type="item", name="rich_dust", amount=2},

    },
    main_product= "rich_dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_separation.png",
    subgroup = "py-items",
    order = "richdust",
}

-------------------------------------------------------------------------------
--SAND WASHING
local sand_washing ={
    type = "recipe",
    name = "sand_washing",
    category = "washer",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="sand", amount=10},
		{type="fluid", name="water", amount=20},
    },
    results={
        {type="item", name="pure_sand", amount=8},
		{type="fluid", name="dirty-water", amount=8},

    },
    main_product= "pure_sand",
    icon = "__pycoalprocessing__/graphics/icons/sand-washer.png",
    subgroup = "py-items",
    order = "c",
}
-------------------------------------------------------------------------------
--ORGANICS PROCESSING
local organics_processing ={
    type = "recipe",
    name = "organics_processing",
    category = "gasifier",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="item", name="organics", amount=10},
		{type="item", name="nexelit_plate", amount=5},
    },
    results={
        {type="fluid", name="methanol", amount=10},
		{type="fluid", name="syngas", amount=10},

    },
    main_product= "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    subgroup = "py-items",
    order = "c",
}

-------------------------------------------------------------------------------
--SAND CASTING
local sand_casting ={
    type = "recipe",
    name = "sand_casting",
    category = "tar",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="sand", amount=10},
		{type="fluid", name="creosote", amount=15},
    },
    results={
        {type="item", name="sand_casting", amount=4},

    },
    main_product= "sand_casting",
    icon = "__pycoalprocessing__/graphics/icons/sand-casting.png",
    subgroup = "py-items",
    order = "c",
}
-------------------------------------------------------------------------------
--TAR to CRUDE OIL
local tar_oil ={
    type = "recipe",
    name = "tar_oil",
    category = "tar",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="item", name="nexelit_plate", amount=2},
		{type="fluid", name="tar", amount=50},
    },
    results={
        {type="fluid", name="crude-oil", amount=30},

    },
    main_product= "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/tar-oil.png",
    subgroup = "py-items",
    order = "c",
}


-------------------------------------------------------------------------------
data:extend{
  raw_wood_to_coal, wood_to_coal, extract_sulfur, cooling_water, fluegas_to_syngas,
  soil_separation, richdust_separation, sand_washing, tailings_separation,
  making_chromium, coarse_classification, pure_sand_classification, organics_processing,
  sand_casting, tar_oil
}
