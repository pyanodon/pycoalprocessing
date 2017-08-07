-------------------------------------------------------------------------------
--[[creosote]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1 =
{
    type = "recipe",
    name = "creosote",
    category = "tar",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="tar", amount=100},
    },
    results=
    {
        {type="fluid", name="creosote", amount=80},
    },
    main_product= "creosote",
    icon = "__pycoalprocessing__/graphics/icons/creosote.png",
}
-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "creosote",
    icon = "__pycoalprocessing__/graphics/icons/creosote.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.360, g = 0.250, b = 0.070},
    flow_color = {r = 0.360, g = 0.250, b = 0.070},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-fluids",
    order = "creosote",
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({recipe1, fluid})
