-------------------------------------------------------------------------------
--HEAVY OIL FROM COALGAS
local heavy_oil_from_coal_gas ={
    type = "recipe",
    name = "heavy-oil_from_coal-gas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9,
    ingredients ={
        {type="fluid", name="coal-gas", amount=35},
        {type="item", name="nichrome", amount=2},
        {type="fluid", name="water", amount=200},
    },
    results={
        {type="fluid", name="heavy-oil", amount=25},
        {type="fluid", name="tar", amount=20},
        {type="fluid", name="water", amount=200, temperature=100},
    },
    main_product= "heavy-oil",
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
}
-------------------------------------------------------------------------------
--LIGHT OIL FROM SYNGAS
local light_oil_from_syngas ={
    type = "recipe",
    name = "light-oil_from_syngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9,
    ingredients ={
        {type="fluid", name="syngas", amount=30},
        {type="item", name="nichrome", amount=2},
        {type="fluid", name="water", amount=200},
    },
    results={
        {type="fluid", name="light-oil", amount=30},
        {type="fluid", name="olefin", amount=15},
        {type="fluid", name="water", amount=200, temperature=100},
    },
    main_product= "light-oil",
    icon = "__base__/graphics/icons/fluid/light-oil.png",
}
-------------------------------------------------------------------------------
--PETGAS FROM REFSYNGAS
local petgas_from_refsyngas ={
    type = "recipe",
    name = "petgas_from-refsyngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients ={
        {type="fluid", name="refsyngas", amount=25},
        {type="item", name="nichrome", amount=2},
        {type="fluid", name="light-oil", amount=15},
    },
    results={
        {type="fluid", name="petroleum-gas", amount=40},
        {type="fluid", name="olefin", amount=15},
    },
    main_product= "petroleum-gas",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
}
-------------------------------------------------------------------------------
--REFINED SYNGAS TO LIGHT OIL
local ref_to_light_oil ={
    type = "recipe",
    name = "ref_to_light-oil",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 10,
    ingredients ={
        --{type="fluid", name="hydrogen", amount=25},
        {type="fluid", name="water", amount=200},
        {type="fluid", name="refsyngas", amount=15},

    },
    results={
        {type="fluid", name="light-oil", amount=40},
        {type="fluid", name="water", amount=200, temperature=100},
        {type="fluid", name="carbon-dioxide", amount=20},
    },
    icon = "__pycoalprocessing__/graphics/icons/ref_to_light_oil.png",
    main_product= "light-oil",
    order = "c",
}

-------------------------------------------------------------------------------
--SULFURIC ACID FROM PETGAS
local sulfuric_petgas ={
    type = "recipe",
    name = "sulfuric-petgas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients ={
        {type="fluid", name="petroleum-gas", amount=25},
        {type="fluid", name="water", amount=200},
        {type="fluid", name="acidgas", amount=15},
        {type="item", name="chromium", amount=5},

    },
    results={
        {type="fluid", name="aromatics", amount=10},
        {type="fluid", name="water", amount=200, temperature=100},
        {type="fluid", name="sulfuric-acid", amount=50},
    },
    icon = "__pycoalprocessing__/graphics/icons/sulfuric-petgas.png",
    main_product= "sulfuric-acid",
    order = "c",
}
-------------------------------------------------------------------------------
--COMBUSTION MIXTURE01 FROM OLEFINS
local combustion_olefin ={
    type = "recipe",
    name = "combustion-olefin",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients ={
        {type="fluid", name="olefin", amount=30},
        {type="fluid", name="water", amount=200,},
        --{type="fluid", name="hydrogen", amount=15},
        {type="item", name="nichrome", amount=5},

    },
    results={
        {type="fluid", name="carbon-dioxide", amount=10},
        {type="fluid", name="water", amount=200, temperature=100},
        {type="fluid", name="combustion-mixture1", amount=30},
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-mixture1.png",
    main_product= "combustion-mixture1",
    order = "c",
}
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--RARE EARTH BENEFICIATION
local rare_earth_beneficiation ={
    type = "recipe",
    name = "rare-earth-beneficiation",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 8,
    ingredients ={
        {type="fluid", name="sulfuric-acid", amount=20},
        {type="fluid", name="water", amount=200,},
        {type="item", name="rare-earth-dust", amount=10},

    },
    results={
        {type="item", name="rich-dust", amount=5},
        {type="fluid", name="rare-earth-mud", amount=25},
		{type="fluid", name="water", amount=200, temperature=100},
        {type="item", name="sand", amount=10},
    },
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-mud.png",
    main_product= "rare-earth-mud",
    order = "c",
}
-------------------------------------------------------------------------------
--DIRTY-WATER REACTION
local recipe_dirty_reaction ={
    type = "recipe",
    name = "dirty-reaction",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.3,
    ingredients ={
        {type="fluid", name="dirty-water", amount=80},
		{type="fluid", name="water", amount=200},
		{type="fluid", name="aromatics", amount=45},
    },
    results={
        {type="fluid", name="crude-oil", amount=50},
		{type="fluid", name="water", amount=200, temperature=100},
        {type="fluid", name="olefin", amount=30},
    },
    main_product= "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/dirty-reaction.png",
    subgroup = "py-items",
    order = "c",
}

data:extend{
    heavy_oil_from_coal_gas, light_oil_from_syngas, petgas_from_refsyngas, ref_to_light_oil,
    sulfuric_petgas, combustion_olefin, rare_earth_beneficiation, recipe_dirty_reaction
}
