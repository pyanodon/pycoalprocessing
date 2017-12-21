local fluid = {
    type = "fluid",
    name = "olefin",
    icon = "__pycoalprocessing__/graphics/icons/olefin.png",
    icon_size = 32,
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.6, g = 0.388, b = 0.745},
    flow_color = {r = 0.6, g = 0.388, b = 0.745},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[olefin]"
}

data:extend {fluid}
