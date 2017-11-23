local fluid = {
    type = "fluid",
    name = "rare-earth-mud",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-mud.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.2, g = 0.192, b = 0.125},
    flow_color = {r = 0.2, g = 0.192, b = 0.125},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59
}

data:extend {fluid}
