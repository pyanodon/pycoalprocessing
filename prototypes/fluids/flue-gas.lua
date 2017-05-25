-------------------------------------------------------------------------------
--[[flue-gas]]--
-------------------------------------------------------------------------------
--[[fluid]]--
local fluid =
{
    type = "fluid",
    name = "flue-gas",
    icon = "__pycoalprocessing__/graphics/icons/flue-gas.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.839, g = 0.811, b = 0.745},
    flow_color = {r = 0.839, g = 0.811, b = 0.745},
    max_temperature = 100,
	gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({fluid})
