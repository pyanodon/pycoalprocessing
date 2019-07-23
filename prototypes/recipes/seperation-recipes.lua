RECIPE {
    type = "recipe",
    name = "sand-classification",
    category = "classifier",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "sand", amount = 12}
    },
    results = {
        {type = "item", name = "rich-dust", amount = 10},
        {type = "item", name = "gravel", amount = 2}
    },
    main_product = "rich-dust",
    icon = "__pycoalprocessing__/graphics/icons/class-pure-sand.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "b"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "coarse-classification",
    category = "classifier",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "coarse", amount = 20}
    },
    results = {
        {type = "item", name = "stone", amount = 5},
        {type = "item", name = "iron-oxide", amount = 2},
        {type = "item", name = "gravel", amount = 4}
    },
    main_product = "gravel",
    icon = "__pycoalprocessing__/graphics/icons/class-coarse.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "a"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "tailings-classification",
    category = "classifier",
    enabled = false,
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "tailings-dust", amount = 15}
    },
    results = {
        {type = "item", name = "coal-dust", amount = 5},
        {type = "item", name = "copper-ore", amount = 1}, --bob lead-ore
        {type = "item", name = "iron-ore", amount = 1} --bob tin-ore
    },
    main_product = "coal-dust",
    icon = "__pycoalprocessing__/graphics/icons/class-tailings.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "c"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "co2-organics",
    category = "hpf",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "organics", amount = 10}
    },
    results = {
        {type = "fluid", name = "carbon-dioxide", amount = 300}
    },
    main_product = "carbon-dioxide",
    icon = "__pycoalprocessing__/graphics/icons/carbon-dioxide.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "f"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "soil-separation",
    category = "solid-separator",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "soil", amount = 20}
    },
    results = {
        {type = "item", name = "sand", amount = 13},
        {type = "item", name = "coarse", amount = 3},
        {type = "item", name = "limestone", amount = 2},
        {type = "item", name = "organics", amount = 3}
    },
    main_product = "sand",
    icon = "__pycoalprocessing__/graphics/icons/soil-separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "e"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "tailings-separation",
    category = "solid-separator",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "tailings-dust", amount = 15}
    },
    results = {
        {type = "item", name = "coal-dust", amount = 8},
        {type = "item", name = "rich-dust", amount = 2}
    },
    main_product = "rich-dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "g"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "creosote-to-aromatics",
    category = "tar",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "creosote", amount = 150}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 100}
    },
    main_product = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/creosote-aromatics.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "m"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "ash-separation",
    category = "solid-separator",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "ash", amount = 100}
    },
    results = {
        {type = "item", name = "coal-dust", amount = 2},
        {type = "item", name = "iron-oxide", amount = 1, probability = 0.5}
    },
    icon = "__pycoalprocessing__/graphics/icons/ash-separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "f"
}:add_unlock("separation")
