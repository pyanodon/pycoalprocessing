local recipe1 = {
    type = "recipe",
    name = "niobium-complex",
    category = "chemistry",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {
        {type = "fluid", name = "organic-solvent", amount = 50},
        {type = "fluid", name = "water", amount = 100}, --bob hydrogen-chloride
        {type = "item", name = "niobium-concentrate", amount = 10}
    },
    results = {
        {type = "fluid", name = "niobium-complex", amount = 100}
    },
    main_product = "niobium-complex",
    icon = "__pycoalprocessing__/graphics/icons/niobium-complex.png",
    subgroup = "py-fluids",
    order = "c"
}

local fluid = {
    type = "fluid",
    name = "niobium-complex",
    icon = "__pycoalprocessing__/graphics/icons/niobium-complex.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.482, g = 0.607, b = 0.650},
    flow_color = {r = 0.482, g = 0.607, b = 0.650},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-fluids",
    order = "z-[niobium-complex]"
}

data:extend {recipe1, fluid}
