-------------------------------------------------------------------------------
--[[syngas]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1 =
{
    type = "recipe",
    name = "syngas",
    category = "gasifier",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="coal-gas", amount=4},
        {type="fluid", name="water", amount=10},
    },
    results=
    {
        {type="fluid", name="syngas", amount=4},
        {type="fluid", name="tar", amount=3},
        {type="item", name="ash", amount=1, probability=0.5}
    },
    main_product= "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.8, g = 0.564, b = 0.129},
    flow_color = {r = 0.8, g = 0.564, b = 0.129},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "a-a-[syn-gas]",
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({recipe1, fluid})
