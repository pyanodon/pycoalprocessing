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
        {type="fluid", name="water", amount=60}, --bob {type="fluid", name="hydrogen", amount=60},
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

data:extend{
    diesel, aromatics, olefin, diesel2,
}
