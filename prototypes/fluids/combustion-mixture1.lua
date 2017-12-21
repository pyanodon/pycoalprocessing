--[[combustion-mixture1]] --

local fluid = {
    type = "fluid",
    name = "combustion-mixture1",
    icon = "__pycoalprocessing__/graphics/icons/combustion-mixture1.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.811, g = 0.325, b = 0.0},
    flow_color = {r = 0.811, g = 0.325, b = 0.0},
    max_temperature = 1000,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-combustion",
    order = "z-[combustion-mixture1]"
}

data:extend {fluid}
