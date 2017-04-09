-------------------------------------------------------------------------------
--[[diborane]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local diborane= {
    type = "recipe",
    name = "diborane",
    category = "hpf",
    enabled = "false",
    energy_required = 7,
    ingredients ={
        {type="fluid", name="hydrogen", amount=25},
        {type="item", name="borax", amount=10},
    },
    results=
    {
        {type="fluid", name="diborane", amount=5},
    },
    main_product= "diborane",
    icon = "__pycoalprocessing__/graphics/icons/diborane.png",
    subgroup = "py-syngas",
    order = "z-[diborane]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "diborane",
    icon = "__pycoalprocessing__/graphics/icons/diborane.png",
    default_temperature = 15,
    base_color = {r = 0.858, g = 0.929, b = 0.952},
    flow_color = {r = 0.858, g = 0.929, b = 0.952},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[diborane]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid, diborane})
