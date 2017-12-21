--[[dirty-water]] --

local dirty_water = {
    type = "fluid",
    name = "dirty-water",
    icon = "__pycoalprocessing__/graphics/icons/dirty-water.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.176, g = 0.054, b = 0.054},
    flow_color = {r = 0.176, g = 0.054, b = 0.054},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59
}

data:extend {dirty_water}
