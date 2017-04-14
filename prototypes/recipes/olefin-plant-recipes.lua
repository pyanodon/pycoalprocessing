-------------------------------------------------------------------------------
--DIESEL
local diesel ={
    type = "recipe",
    name = "diesel",
    category = "olefin",
    enabled = "false",
    energy_required = 1.5,
    ingredients ={
        {type="item", name="chromium", amount=2},
        {type="fluid", name="methanol", amount=15},
        {type="fluid", name="carbon-dioxide", amount=20},
    },
    results=
    {
        {type="fluid", name="diesel", amount=15},
        {type="fluid", name="olefin", amount=10},
    },
    main_product= "diesel",
    icon = "__pycoalprocessing__/graphics/icons/diesel.png",
}
-------------------------------------------------------------------------------
--DIESEL2
local diesel2 ={
    type = "recipe",
    name = "diesel2",
    category = "olefin",
    enabled = "false",
    energy_required = 1.5,
    ingredients ={
        {type="item", name="chromium", amount=2},
        {type="fluid", name="olefin", amount=20},
    },
    results=
    {
        {type="fluid", name="diesel", amount=15},
    },
    main_product= "diesel",
    icon = "__pycoalprocessing__/graphics/icons/diesel.png",
}
-------------------------------------------------------------------------------
--AROMATICS
local aromatics={
    type = "recipe",
    name = "aromatics",
    category = "olefin",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="item", name="chromium", amount=2},
        {type="fluid", name="olefin", amount=20},
        {type="fluid", name="water", amount=20},
    },
    results=
    {
        {type="fluid", name="aromatics", amount=15},
        {type="fluid", name="water", amount=10},
        --{type="fluid", name="hydrogen", amount=10},
    },
    main_product= "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
    --order = "b-c [syn-gas]",
}
-------------------------------------------------------------------------------
--OLEFIN
local olefin=
{
    type = "recipe",
    name = "olefin",
    category = "olefin",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="item", name="chromium", amount=2},
        {type="fluid", name="water", amount=60}, --updated-bob hydrogen
        {type="fluid", name="carbon-dioxide", amount=20},
    },
    results=
    {
        {type="fluid", name="olefin", amount=20},
    },
    main_product= "olefin",
    icon = "__pycoalprocessing__/graphics/icons/olefin.png",
    --order = "b-c [syn-gas]",
}
-------------------------------------------------------------------------------
--OLEFIN-to-petgas and light-oil
local olefin_petgas=
{
    type = "recipe",
    name = "olefin-petgas",
    category = "fluid-separator",
    enabled = "false",
    energy_required = 2.8,
    ingredients ={
        {type="fluid", name="olefin", amount=30},
        {type="fluid", name="carbon-dioxide", amount=20},
    },
    results=
    {
        {type="fluid", name="petroleum-gas", amount=15},
        {type="fluid", name="light-oil", amount=15},
    },
    main_product= "petroleum-gas",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    --order = "b-c [syn-gas]",
}
-------------------------------------------------------------------------------
--OLEFIN-to-gasoline
local gasoline=
{
    type = "recipe",
    name = "gasoline",
    category = "fluid-separator",
    enabled = "false",
    energy_required = 2.8,
    ingredients ={
        {type="fluid", name="olefin", amount=30},
        --{type="fluid", name="hydrogen", amount=20},
        {type="fluid", name="light-oil", amount=20},
    },
    results=
    {
        {type="fluid", name="gasoline", amount=15},
    },
    main_product= "gasoline",
    icon = "__pycoalprocessing__/graphics/icons/gasoline.png",
    --order = "b-c [syn-gas]",
}
data:extend{
    diesel, aromatics, olefin, diesel2, olefin_petgas, gasoline
}
