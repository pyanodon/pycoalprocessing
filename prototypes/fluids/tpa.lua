-------------------------------------------------------------------------------
--[[tpa]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local tpa= {
    type = "recipe",
    name = "tpa",
    category = "rectisol",
    enabled = "false",
    energy_required = 4,
    ingredients ={
        {type="fluid", name="aromatics", amount=10},
        {type="fluid", name="liquid-air", amount=60},
        {type="item", name="cobalt-ore", amount=2},
    },
    results=
    {
        {type="fluid", name="tpa", amount=5},
    },
    main_product= "tpa",
    icon = "__pycoalprocessing__/graphics/icons/tpa.png",
    subgroup = "py-syngas",
    order = "z-[tpa]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "tpa",
    icon = "__pycoalprocessing__/graphics/icons/tpa.png",
    default_temperature = 15,
    base_color = {r = 0.937, g = 0.803, b = 0.007},
    flow_color = {r = 0.937, g = 0.803, b = 0.007},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[tpa]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid, tpa})
