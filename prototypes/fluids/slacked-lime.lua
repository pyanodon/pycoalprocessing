local fluid = {
    type = "fluid",
    name = "slacked-lime",
    icon = "__pycoalprocessing__/graphics/icons/slacked-lime.png",
    icon_size = 32,
    default_temperature = 15,
    base_color = {r = 0.772, g = 0.772, b = 0.772},
    flow_color = {r = 0.772, g = 0.772, b = 0.772},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[slacked-lime]"
}

data:extend {fluid}
