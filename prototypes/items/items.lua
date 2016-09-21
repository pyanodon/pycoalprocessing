data:extend({

{
    type = "item",
    name = "ash",
    icon = "__pycoalprocessing__/graphics/icons/ash.png",
    flags = {"goes-to-main-inventory"},
	subgroup = "coal-processing",
    order = "c[coal-processing]",
    stack_size = 100
},

{
    type = "item",
    name = "canister",
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
    flags = {"goes-to-main-inventory"},
	subgroup = "coal-processing",
    order = "c[coal-processing]",
    stack_size = 100
},

{
    type = "item",
    name = "iron-oxide",
    icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
    flags = {"goes-to-main-inventory"},
	subgroup = "coal-processing",
    order = "a[coal-processing]",
    stack_size = 200
},

{
    type = "item",
    name = "coke",
	fuel_value = "13MJ",
    icon = "__pycoalprocessing__/graphics/icons/coke.png",
    flags = {"goes-to-main-inventory"},
	subgroup = "coal-processing",
    order = "b[coal-processing]",
    stack_size = 200
},

{
    type = "fluid",
    name = "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/coalgas.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.921, g = 0.776, b = 0.541},
    flow_color = {r = 0.921, g = 0.776, b = 0.541},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "tar",
    icon = "__pycoalprocessing__/graphics/icons/tar.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.349, g = 0.478, b = 0.364},
    flow_color = {r = 0.349, g = 0.478, b = 0.364},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "creosote",
    icon = "__pycoalprocessing__/graphics/icons/creosote.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.360, g = 0.250, b = 0.070},
    flow_color = {r = 0.360, g = 0.250, b = 0.070},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.8, g = 0.564, b = 0.129},
    flow_color = {r = 0.8, g = 0.564, b = 0.129},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/refsyngas.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.8, g = 0.239, b = 0.129},
    flow_color = {r = 0.8, g = 0.239, b = 0.129},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},  

{
    type = "fluid",
    name = "acidgas",
    icon = "__pycoalprocessing__/graphics/icons/acidgas.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.741, g = 0.788, b = 0.196},
    flow_color = {r = 0.741, g = 0.788, b = 0.196},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "carbon-dioxide",
    icon = "__pycoalprocessing__/graphics/icons/carbon-dioxide.png",
	default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.807, g = 0.949, b = 0.941},
    flow_color = {r = 0.807, g = 0.949, b = 0.941},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},

{
    type = "fluid",
    name = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
	default_temperature = 15,
    heat_capacity = "3KJ",
    base_color = {r = 0.772, g = 0.921, b = 0.396},
    flow_color = {r = 0.772, g = 0.921, b = 0.396},
    max_temperature = 100,
	pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
},


})