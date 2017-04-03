-------------------------------------------------------------------------------
--NEXELIT PLATE
local nexelit_plate ={
    type = "recipe",
    name = "nexelit_plate",
    category = "advanced-foundry",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="item", name="nexelit-ore", amount=2},
        {type="fluid", name="petroleum-gas", amount=15},
        {type="item", name="limestone", amount=2},
        {type="item", name="sand_casting", amount=1},
    },
    results=
    {
        {type="item", name="nexelit_plate", amount=2},
    },
    main_product= "nexelit_plate",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
}
-------------------------------------------------------------------------------
--IRON PLATE
local iron_plate ={
    type = "recipe",
    name = "iron_plate",
    category = "advanced-foundry",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="item", name="fuelrod-mk01", amount=1},
        {type="item", name="iron-ore", amount=5},
        {type="item", name="limestone", amount=2},
        {type="item", name="sand_casting", amount=1},
    },
    results=
    {
        {type="item", name="iron-plate", amount=8},
    },
    main_product= "iron-plate",
    icon = data.raw.item["iron-plate"].icon,
}

data:extend{
    nexelit_plate,
    iron_plate,
}
