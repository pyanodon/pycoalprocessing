--EXTRACT SAND
local extract_sand = {
    type = "recipe",
    name = "extract-sand",
    category = "sand-extractor",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 1}
    },
    results = {
        {type = "item", name = "sand", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-sand.png",
    icon_size = 32,
    main_product = "sand",
    subgroup = "py-extractor",
    order = "a"
}

--EXTRACT GRAVEL
local extract_gravel = {
    type = "recipe",
    name = "extract-gravel",
    category = "sand-extractor",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 2}
    },
    results = {
        {type = "item", name = "gravel", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-gravel.png",
    icon_size = 32,
    main_product = "gravel",
    subgroup = "py-extractor",
    order = "b"
}

--EXTRACT STONE
local extract_stone = {
    type = "recipe",
    name = "extract-stone",
    category = "sand-extractor",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 2}
    },
    results = {
        {type = "item", name = "stone", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-stone.png",
    icon_size = 32,
    main_product = "stone",
    subgroup = "py-extractor",
    order = "c"
}

--EXTRACT RICH DUST
local extract_richdust = {
    type = "recipe",
    name = "extract-richdust",
    category = "sand-extractor",
    enabled = "false",
    energy_required = 10,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 2}
    },
    results = {
        {type = "item", name = "rich-dust", amount = 15}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-richdust.png",
    icon_size = 32,
    main_product = "rich-dust",
    subgroup = "py-extractor",
    order = "d"
}

--EXTRACT COARSE
local extract_coarse = {
    type = "recipe",
    name = "extract-coarse",
    category = "sand-extractor",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "iron-stick", amount = 2}
    },
    results = {
        {type = "item", name = "coarse", amount = 10}
    },
    icon = "__pycoalprocessing__/graphics/icons/extraction-coarse.png",
    icon_size = 32,
    main_product = "coarse",
    subgroup = "py-extractor",
    order = "c"
}

data:extend {extract_sand, extract_gravel, extract_stone, extract_richdust, extract_coarse}
