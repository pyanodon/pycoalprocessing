RECIPE {
    type = "recipe",
    name = "dirty-reaction",
    category = "fts-reactor",
    enabled = false,
    energy_required = 9.3,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 800},
        {type = "fluid", name = "water", amount = 2000},
        {type = "fluid", name = "aromatics", amount = 500}
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 400},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "olefin", amount = 200}
    },
    main_product = "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/dirty-reaction.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h8"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "coalgas-syngas",
    category = "desulfurization",
    enabled = false,
    energy_required = 5.5,
    ingredients = {
        {type = "item", name = "active-carbon", amount = 3},
        {type = "fluid", name = "coal-gas", amount = 300}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 150},
        {type = "item", name = "sulfur", amount = 5},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "b"
}:add_unlock("desulfurization"):add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "sulfur-crudeoil",
    category = "desulfurization",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "crude-oil", amount = 400},
        {type = "item", name = "iron-ore", amount = 20} --bob salt
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 300},
        {type = "item", name = "sulfur", amount = 5},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "b"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "sulfur-heavyoil",
    category = "desulfurization",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "heavy-oil", amount = 300}
    },
    results = {
        {type = "fluid", name = "light-oil", amount = 200},
        {type = "item", name = "sulfur", amount = 3},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "c"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "sulfur-lightoil",
    category = "desulfurization",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 200}
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "item", name = "sulfur", amount = 2},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "d"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "sulfur-petgas",
    category = "desulfurization",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 100}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 90},
        {type = "item", name = "sulfur", amount = 1},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "e"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "aromatics-to-lubricant",
    category = "desulfurization",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 150}
    },
    results = {
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "item", name = "sulfur", amount = 1}
    },
    main_product = "lubricant",
    icon = "__pycoalprocessing__/graphics/icons/aromatics-lubricant.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "n"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "explosive-glycerol",
    category = "chemistry",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "sulfuric-acid", amount = 150}
    },
    results = {
        {type = "item", name = "explosives", amount = 5}
    },
    main_product = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a [coal-gas]"
}:add_unlock("desulfurization")

RECIPE {
    type = "recipe",
    name = "extract-sulfur",
    category = "desulfurization",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "acidgas", amount = 100}
    },
    results = {
        {type = "item", name = "sulfur", amount = 2}
    },
    main_product = "sulfur",
    icon = data.raw.item.sulfur.icon,
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "a"
}:add_unlock("desulfurization")
