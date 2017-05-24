-------------------------------------------------------------------------------
--[[boric-acid]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local boric_acid= {
    type = "recipe",
    name = "boric-acid",
    category = "electrolysis", --updated-bob electrolysis
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="diborane", amount=100},
        {type="fluid", name="water", amount=500},
    },
    results=
    {
        {type="fluid", name="boric-acid", amount=500},
    },
    main_product= "boric-acid",
    icon = "__pycoalprocessing__/graphics/icons/boric-acid.png",
    subgroup = "py-syngas",
    order = "z-[boric-acid]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "boric-acid",
    icon = "__pycoalprocessing__/graphics/icons/boric-acid.png",
    default_temperature = 15,
    base_color = {r = 0.662, g = 0.752, b = 0.764},
    flow_color = {r = 0.662, g = 0.752, b = 0.764},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[boric-acid]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid, boric_acid})
