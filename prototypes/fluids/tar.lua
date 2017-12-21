local fluid = {
    type = "fluid",
    name = "tar",
    icon = "__pycoalprocessing__/graphics/icons/tar.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.066, g = 0.164, b = 0.121},
    flow_color = {r = 0.066, g = 0.164, b = 0.121},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59
}

data:extend {fluid}
