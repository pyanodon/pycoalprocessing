RECIPE {
    type = "recipe",
    name = "sand-classification",
    category = "classifier",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "sand", amount = 15}
    },
    results = {
        {type = "item", name = "rich-dust",      amount = 10},
        {type = "item", name = "gravel",         amount = 2},
        {type = "item", name = "crushed-quartz", amount = 10}
    },
    main_product = "rich-dust",
    icon = "__pycoalprocessinggraphics__/graphics/icons/class-pure-sand.png",
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
        {type = "item", name = "stone",      amount = 5},
        {type = "item", name = "iron-oxide", amount = 2},
        {type = "item", name = "gravel",     amount = 4}
    },
    main_product = "gravel",
    icon = "__pycoalprocessinggraphics__/graphics/icons/class-coarse.png",
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
        {type = "item", name = "coal-dust",  amount = 5},
        {type = "item", name = "copper-ore", amount = 1},
        {type = "item", name = "iron-ore",   amount = 1}
    },
    main_product = "coal-dust",
    icon = "__pycoalprocessinggraphics__/graphics/icons/class-tailings.png",
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
    icon = "__pycoalprocessinggraphics__/graphics/icons/carbon-dioxide.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "f"
}:add_unlock("wood-processing-2")

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
        {type = "item", name = "sand",      amount = 13},
        {type = "item", name = "coarse",    amount = 3},
        {type = "item", name = "limestone", amount = 2},
        {type = "item", name = "organics",  amount = 3}
    },
    main_product = "sand",
    icon = "__pycoalprocessinggraphics__/graphics/icons/soil-separation.png",
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
        {type = "item", name = "coal-dust", amount = 5},
        {type = "item", name = "rich-dust", amount = 2}
    },
    main_product = "coal-dust",
    icon = "__pycoalprocessinggraphics__/graphics/icons/tailings_separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "g"
}:add_unlock("fluid-separation")

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
        {type = "fluid", name = "aromatics", amount = 50}
    },
    crafting_machine_tint =
    {
        primary = {r = 0.74, g = 0.403, b = 0.388},
        secondary = {r = 1, g = 1, b = 1},
        tertiary = {r = 0.360, g = 0.250, b = 0.070},
        quaternary = {r = 0.360, g = 0.250, b = 0.070},
    },
    main_product = "aromatics",
}:add_unlock("creosote")

RECIPE {
    type = "recipe",
    name = "ash-separation",
    category = "solid-separator",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "ash", amount = 10}
    },
    results = {
        {type = "item", name = "coal-dust",  amount = 1, probability = 0.5},
        {type = "item", name = "iron-oxide", amount = 1, probability = 0.05}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/ash-separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "f"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "organics-from-dirty-water",
    category = "evaporator",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "dirty-water-light", amount = 250}
    },
    results = {
        {type = "item", name = "organics", amount = 1}
    },
    subgroup = "py-items-class",
    order = "f"
}:add_unlock("fluid-separation")
