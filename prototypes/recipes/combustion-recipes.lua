--COALGAS to CM1
local coalgas = {
    type = "recipe",
    name = "coalgas-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 50, temperature = 500},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-coalgas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "a"
}

--COALSLURRY to CM1
local coal_slurry = {
    type = "recipe",
    name = "coalslurry-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "coal-slurry", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 50, temperature = 550},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-coal-slurry.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "a"
}

--SYNGAS to CM1
local syngas = {
    type = "recipe",
    name = "syngas-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 600},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-syngas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "c"
}

--DIBORANE to CM1
local diborane = {
    type = "recipe",
    name = "diborane-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "diborane", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 600},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-diborane.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "d"
}

--METHANOL to CM1
local methanol = {
    type = "recipe",
    name = "methanol-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "methanol", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 650},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-methanol.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "e"
}

--REFSYNGAS to CM1
local refsyngas = {
    type = "recipe",
    name = "refsyngas-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 700},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-refsyngas.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "f"
}

--ACETYLENE to CM1
local acetylene = {
    type = "recipe",
    name = "acetylene-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "acetylene", amount = 100},
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 670},
        {type = "fluid", name = "steam", amount = 500, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-acetylene.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "g"
}

--OLEFIN to CM1
local olefin = {
    type = "recipe",
    name = "olefin-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coke", amount = 30}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 750},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-olefin.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "h"
}

--DIESEL to CM1
local diesel = {
    type = "recipe",
    name = "diesel-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "diesel", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "fuelrod-mk01", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 800},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-diesel.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "i"
}

--GASOLINE to CM1
local gasoline = {
    type = "recipe",
    name = "gasoline-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "gasoline", amount = 100},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coke", amount = 5},
        {type = "item", name = "fuelrod-mk01", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 100, temperature = 850},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-gasoline.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "j"
}

--SUPERCRITICAL COAL
local supercritical = {
    type = "recipe",
    name = "supercritical-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 100},
        {type = "fluid", name = "refsyngas", amount = 50},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coal-briquette", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 250, temperature = 900},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-super-critical.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "k"
}

--ULTRASUPERCRITICAL COAL
local ultrasupercritical = {
    type = "recipe",
    name = "ultrasupercritical-combustion",
    category = "combustion",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "fluid", name = "refsyngas", amount = 50},
        {type = "fluid", name = "water", amount = 1000},
        {type = "item", name = "coal-briquette", amount = 1}
    },
    results = {
        {type = "fluid", name = "combustion-mixture1", amount = 250, temperature = 1000},
        {type = "fluid", name = "steam", amount = 1000, temperature = 60}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-ultra-super-critical.png",
    icon_size = 32,
    --main_product = "combustion-mixture1",
    subgroup = "py-combustion",
    order = "l"
}

data:extend {
    coalgas,
    syngas,
    coal_slurry,
    methanol,
    refsyngas,
    diborane,
    acetylene,
    olefin,
    diesel,
    gasoline,
    supercritical,
    ultrasupercritical
}
