local fluid = {
    type = "fluid",
    name = "oleochemicals",
    icon = "__pycoalprocessing__/graphics/icons/oleochemicals.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.870, g = 0.717, b = 0.0},
    flow_color = {r = 0.870, g = 0.717, b = 0.0},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-fluids",
    order = "z-[oleochemicals]"
}

data:extend {fluid}
