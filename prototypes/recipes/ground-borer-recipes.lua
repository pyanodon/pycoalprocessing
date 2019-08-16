RECIPE {
    type = "recipe",
    name = "mining-nexelit",
    category = "ground-borer",
    enabled = false,
    energy_required = 0.75,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 200},
        {type = "fluid", name = "coal-gas", amount = 300},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "nexelit-ore", amount = 10}
    },
    main_product = "nexelit-ore",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-nexelit.png",
    icon_size = 32,
    subgroup = "py-drilling",
    order = "a"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "mining-stone",
    category = "ground-borer",
    enabled = false,
    energy_required = 1.2,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "stone", amount = 30}
    },
    main_product = "stone",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-stone.png",
    icon_size = 32,
    subgroup = "py-drilling",
    order = "b"
}:add_unlock("excavation-2")

RECIPE {
    type = "recipe",
    name = "mining-borax",
    category = "ground-borer",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 200},
        {type = "fluid", name = "coal-gas", amount = 200},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "raw-borax", amount = 15}
    },
    main_product = "raw-borax",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-borax.png",
    icon_size = 32,
    subgroup = "py-drilling",
    order = "b"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "mining-niobium",
    category = "ground-borer",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 300},
        {type = "fluid", name = "coal-gas", amount = 300},
        {type = "item", name = "drill-head", amount = 3}
    },
    results = {
        {type = "item", name = "niobium-ore", amount = 15}
    },
    main_product = "niobium-ore",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-niobium.png",
    icon_size = 32,
    subgroup = "py-drilling",
    order = "b"
}:add_unlock("excavation-2")

RECIPE {
    type = "recipe",
    name = "mining-limestone",
    category = "ground-borer",
    enabled = false,
    energy_required = 1.2,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "limestone", amount = 20}
    },
    main_product = "limestone",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-limestone.png",
    icon_size = 32,
    subgroup = "py-drilling",
    order = "c"
}:add_unlock("excavation-2")
