-------------------------------------------------------------------------------
--[[acetylene]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local acetylene= {
    type = "recipe",
    name = "acetylene",
    category = "chemistry",
    enabled = "false",
    energy_required = 8,
    ingredients ={
        {type="fluid", name="water", amount=300},
        {type="item", name="calcium-carbide", amount=20},
    },
    results=
    {
        {type="fluid", name="acetylene", amount=100},
		{type="fluid", name="slacked-lime", amount=50},
    },
    main_product= "acetylene",
    icon = "__pycoalprocessing__/graphics/icons/acetylene.png",
    subgroup = "py-syngas",
    order = "z-[acetylene]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "acetylene",
    icon = "__pycoalprocessing__/graphics/icons/acetylene.png",
    default_temperature = 15,
    base_color = {r = 0.862, g = 0.388, b = 0.713},
    flow_color = {r = 0.862, g = 0.388, b = 0.713},
    max_temperature = 100,
	gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[acetylene]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid, acetylene})
