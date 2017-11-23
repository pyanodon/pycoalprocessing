local fluid = {
    type = "fluid",
    name = "gasoline",
    icon = "__pycoalprocessing__/graphics/icons/gasoline.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.776, g = 0.709, b = 0.043},
    flow_color = {r = 0.776, g = 0.709, b = 0.043},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[gasoline]"
}

data:extend {fluid}
