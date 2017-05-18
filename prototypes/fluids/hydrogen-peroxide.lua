-------------------------------------------------------------------------------
--[[hydrogen-peroxide]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local hydrogen_peroxide= {
    type = "recipe",
    name = "hydrogen-peroxide",
    category = "carbonfilter",
    enabled = "false",
    energy_required = 2.7,
    ingredients ={
        {type="fluid", name="anthraquinone", amount=100},
        --{type="item", name="nickel-plate", amount=5},
        {type="item", name="iron-plate", amount=5}
    },
    results=
    {
        {type="fluid", name="hydrogen-peroxide", amount=50},
    },
    main_product= "hydrogen-peroxide",
    icon = "__pycoalprocessing__/graphics/icons/hydrogen-peroxide.png",
    subgroup = "py-syngas",
    order = "z-[hydrogen-peroxide]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "hydrogen-peroxide",
    icon = "__pycoalprocessing__/graphics/icons/hydrogen-peroxide.png",
    default_temperature = 15,
    base_color = {r = 0.674, g = 1, b = 0.929},
    flow_color = {r = 0.674, g = 1, b = 0.929},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[hydrogen-peroxide]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid, hydrogen_peroxide})
