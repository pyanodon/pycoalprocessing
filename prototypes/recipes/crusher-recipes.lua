--NIOBIUM POWDER
RECIPE {
    type = "recipe",
    name = "niobium-powder",
    category = "crusher",
    enabled = false,
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "niobium-ore", amount = 10}
    },
    results = {
        {type = "item", name = "niobium-powder", amount = 5},
        {type = "item", name = "stone", amount = 2}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/crush-niobium.png",
    icon_size = 32,
    main_product = "niobium-powder",
    subgroup = "py-crusher",
    order = "a"
}:add_unlock("niobium")

--IRON
RECIPE {
    type = "recipe",
    name = "crushing-iron",
    category = "crusher",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "iron-ore", amount = 5}
    },
    results = {
        {type = "item", name = "crushed-iron", amount = 5},
        {type = "item", name = "stone", amount = 1}
    },
    main_product = "crushed-iron",
    icon = "__pycoalprocessinggraphics__/graphics/icons/crush-iron.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "b"
}:add_unlock("advanced-material-processing")

--COPPER
RECIPE {
    type = "recipe",
    name = "crushing-copper",
    category = "crusher",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "copper-ore", amount = 5}
    },
    results = {
        {type = "item", name = "crushed-copper", amount = 5},
        {type = "item", name = "stone", amount = 1}
    },
    main_product = "crushed-copper",
    icon = "__pycoalprocessinggraphics__/graphics/icons/crush-copper.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "c"
}:add_unlock("advanced-material-processing")

--STONE to GRAVEL
RECIPE {
    type = "recipe",
    name = "stone-to-gravel",
    category = "crusher",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "stone", amount = 20}
    },
    results = {
        {type = "item", name = "gravel", amount = 15}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/crush-stone.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "d"
}:add_unlock("crusher")

--GRAVEL to SAND
RECIPE {
    type = "recipe",
    name = "gravel-to-sand",
    category = "crusher",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "gravel", amount = 20}
    },
    results = {
        {type = "item", name = "sand", amount = 15}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/crush-gravel.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "e"
}:add_unlock("crusher")
