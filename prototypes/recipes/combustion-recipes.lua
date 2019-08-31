--COALGAS to CM1
RECIPE {
    type = "recipe",
    name = "coalgas-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 500},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-coalgas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "a"
}:add_unlock("energy-1")

--COALSLURRY to CM1
RECIPE {
    type = "recipe",
    name = "coalslurry-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-slurry", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 550},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-coal-slurry.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "a"
}:add_unlock("energy-2")

--SYNGAS to CM1
RECIPE {
    type = "recipe",
    name = "syngas-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 600},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-syngas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "c"
}:add_unlock("energy-1")

--DIBORANE to CM1
RECIPE {
    type = "recipe",
    name = "diborane-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "diborane", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 600},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-diborane.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "d"
}:add_unlock("energy-1")

--HEAVY OIL to CM1
RECIPE {
    type = "recipe",
    name = "heavy-oil-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "heavy-oil", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 500},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-heavy-oil.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "d"
}:add_unlock("energy-2")

--LIGHT OIL to CM1
RECIPE {
    type = "recipe",
    name = "light-oil-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 550},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-light-oil.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "d"
}:add_unlock("energy-2")

--PETGAS to CM1
RECIPE {
    type = "recipe",
    name = "petgas-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 600},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-petgas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "d"
}:add_unlock("energy-2")

--METHANOL to CM1
RECIPE {
    type = "recipe",
    name = "methanol-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "methanol", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 650},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-methanol.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "e"
}:add_unlock("methanol-processing-2")

--REFSYNGAS to CM1
RECIPE {
    type = "recipe",
    name = "refsyngas-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 700},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-refsyngas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "f"
}:add_unlock("energy-2")

--ACETYLENE to CM1
RECIPE {
    type = "recipe",
    name = "acetylene-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "acetylene", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 670},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-acetylene.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "g"
}:add_unlock("energy-2")

--OLEFIN to CM1
RECIPE {
    type = "recipe",
    name = "olefin-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coke", amount = 3}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 750},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-olefin.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "h"
}:add_unlock("energy-3")

--DIESEL to CM1
RECIPE {
    type = "recipe",
    name = "diesel-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "diesel", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "fuelrod-mk01", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 800},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-diesel.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "i"
}:add_unlock("energy-3")

--GASOLINE to CM1
RECIPE {
    type = "recipe",
    name = "gasoline-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "gasoline", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coke", amount = 5},
        {type = "item", name = "fuelrod-mk01", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 150, temperature = 850},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-gasoline.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "j"
}:add_unlock("energy-3")

--SUPERCRITICAL COAL
RECIPE {
    type = "recipe",
    name = "supercritical-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 150},
        {type = "fluid", name = "refsyngas", amount = 50},
        {type = "fluid", name = "water", amount = 1500},
        {type = "item", name = "coal-briquette", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 600, temperature = 900},
        {type = "fluid", name = "steam", amount = 1500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-super-critical.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "k"
}:add_unlock("energy-3")

--ULTRASUPERCRITICAL COAL
RECIPE {
    type = "recipe",
    name = "ultrasupercritical-combustion",
    category = "combustion",
    enabled = false,
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 150},
        {type = "fluid", name = "refsyngas", amount = 50},
        {type = "fluid", name = "water", amount = 1500},
        {type = "item", name = "coal-briquette", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 600, temperature = 1000},
        {type = "fluid", name = "steam", amount = 1500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-ultra-super-critical.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "l"
}:add_unlock("energy-3")
