local methanol_from_syngas = {
    type = "recipe",
    name = "methanol-from-syngas",
    category = "methanol",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 50},
        {type = "item", name = "copper-plate", amount = 2},
        {type = "item", name = "iron-plate", amount = 1} --bob zinc-plate
    },
    results = {
        {type = "fluid", name = "methanol", amount = 50}
    },
    --main_product= "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    subgroup = "py-methanol",
    order = "a"
}

--OLEOCHEMICALS-to-METHANOL
local oleo_methanol = {
    type = "recipe",
    name = "oleo-methanol",
    category = "methanol",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 100},
        {type = "item", name = "chromium", amount = 5}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 250},
        {type = "fluid", name = "water", amount = 150}
    },
    main_product = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol-oleochemicals.png",
    subgroup = "py-methanol",
    order = "c"
}

--bob-additions: methanol_from_hydrogen

local methanol = {
    type = "fluid",
    name = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.231, g = 0.776, b = 0.333},
    flow_color = {r = 0.231, g = 0.776, b = 0.333},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59
}

data:extend {methanol_from_syngas, oleo_methanol, methanol}
