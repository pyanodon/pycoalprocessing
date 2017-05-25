-------------------------------------------------------------------------------
--[[acidgas]]--
-------------------------------------------------------------------------------
--[[fluids]]--
local fluid=
{
    type = "fluid",
    name = "acidgas",
    icon = "__pycoalprocessing__/graphics/icons/acidgas.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.741, g = 0.788, b = 0.196},
    flow_color = {r = 0.741, g = 0.788, b = 0.196},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid})
