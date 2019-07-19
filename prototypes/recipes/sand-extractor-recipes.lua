RECIPE {
    type = "recipe",
    name = "extract-sand",
    category = "sand-extractor",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 2}
    },
    results = {
        {type = "item", name = "sand", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-sand.png",
    icon_size = 32,
    main_product = "sand",
    subgroup = "py-extractor",
    order = "a"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "extract-gravel",
    category = "sand-extractor",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 4}
    },
    results = {
        {type = "item", name = "gravel", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-gravel.png",
    icon_size = 32,
    main_product = "gravel",
    subgroup = "py-extractor",
    order = "b"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "extract-stone",
    category = "sand-extractor",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 4}
    },
    results = {
        {type = "item", name = "stone", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-stone.png",
    icon_size = 32,
    main_product = "stone",
    subgroup = "py-extractor",
    order = "c"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "extract-richdust",
    category = "sand-extractor",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 4}
    },
    results = {
        {type = "item", name = "rich-dust", amount = 15}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-richdust.png",
    icon_size = 32,
    main_product = "rich-dust",
    subgroup = "py-extractor",
    order = "d"
}:add_unlock("excavation-1")

RECIPE {
    type = "recipe",
    name = "extract-coarse",
    category = "sand-extractor",
    enabled = false,
    energy_required = 7,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 4}
    },
    results = {
        {type = "item", name = "coarse", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-coarse.png",
    icon_size = 32,
    main_product = "coarse",
    subgroup = "py-extractor",
    order = "c"
}:add_unlock("excavation-1")
