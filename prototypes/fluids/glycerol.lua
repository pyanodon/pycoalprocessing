local fluid = {
    type = "fluid",
    name = "glycerol",
    icon = "__pycoalprocessing__/graphics/icons/glycerol.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.913, g = 0.890, b = 0.6},
    flow_color = {r = 0.913, g = 0.890, b = 0.6},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-fluids",
    order = "z-[glycerol]"
}

data:extend {fluid}
