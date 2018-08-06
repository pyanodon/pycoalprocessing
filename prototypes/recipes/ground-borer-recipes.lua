RECIPE {
    type = "recipe",
    name = "mining-nexelit",
    category = "ground-borer",
    enabled = false,
    energy_required = 0.75,
    ingredients = {
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "nexelit-ore", amount = 15}
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
        {type = "item", name = "stone", amount = 20}
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
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "raw-borax", amount = 20}
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
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "fluid", name = "coal-gas", amount = 100},
        {type = "item", name = "drill-head", amount = 1}
    },
    results = {
        {type = "item", name = "niobium-ore", amount = 20}
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

if bobmods then
    RECIPE {
        type = "recipe",
        name = "mining-bauxite",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "bauxite-ore", amount = 20}
        },
        main_product = "bauxite-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-bauxite.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "d"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-cobalt",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "cobalt-ore", amount = 20}
        },
        main_product = "cobalt-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-cobalt.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "e"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-gold",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "gold-ore", amount = 20}
        },
        main_product = "gold-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-gold.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "f"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-lead",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "lead-ore", amount = 20}
        },
        main_product = "lead-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-lead.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "g"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-nickel",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "nickel-ore", amount = 20}
        },
        main_product = "nickel-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-nickel.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "h"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-quartz",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "quartz", amount = 20}
        },
        main_product = "quartz",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-quartz.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "i"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-rutile",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "rutile-ore", amount = 20}
        },
        main_product = "rutile-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-rutile.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "j"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-silver",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "silver-ore", amount = 20}
        },
        main_product = "silver-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-silver.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "k"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-tin",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "tin-ore", amount = 20}
        },
        main_product = "tin-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-tin.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "l"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-tungsten",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "tungsten-ore", amount = 20}
        },
        main_product = "tungsten-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-tungsten.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "m"
    }:add_unlock("excavation-2")

    RECIPE {
        type = "recipe",
        name = "mining-zinc",
        category = "ground-borer",
        enabled = false,
        energy_required = 1.2,
        ingredients = {
            {type = "fluid", name = "lubricant", amount = 100},
            {type = "fluid", name = "coal-gas", amount = 100},
            {type = "item", name = "drill-head", amount = 1}
        },
        results = {
            {type = "item", name = "zinc-ore", amount = 20}
        },
        main_product = "zinc-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-zinc.png",
        icon_size = 32,
        subgroup = "py-drilling",
        order = "n"
    }:add_unlock("excavation-2")
end
