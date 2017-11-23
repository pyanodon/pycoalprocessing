local recipe1 = {
    type = "recipe",
    name = "aromatics2",
    category = "gasifier",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 150},
        {type = "fluid", name = "water", amount = 500}, --Added Bob hydrogen
        {type = "item", name = "organics", amount = 10}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 300}
    },
    main_product = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
    subgroup = "py-fluids",
    order = "a"
}

local item1 = {
    type = "fluid",
    name = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
    default_temperature = 15,
    base_color = {r = 0.74, g = 0.403, b = 0.388},
    flow_color = {r = 0.74, g = 0.403, b = 0.388},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[aromatics]"
}

data:extend {recipe1, item1}
