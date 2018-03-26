--NIOBIUM POWDER
RECIPE {
    type = "recipe",
    name = "niobium-powder",
    category = "crusher",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "niobium-ore", amount = 10}
    },
    results = {
        {type = "item", name = "niobium-powder", amount = 5},
        {type = "item", name = "stone", amount = 2}
    },
    icon = "__pycoalprocessing__/graphics/icons/crush-niobium.png",
    icon_size = 32,
    main_product = "niobium-powder",
    subgroup = "py-crusher",
    order = "a"
}:add_unlock("crusher"):add_unlock("coal-processing-2")

--IRON
RECIPE {
    type = "recipe",
    name = "crushing-iron",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "iron-ore", amount = 5}
    },
    results = {
        {type = "item", name = "crushed-iron", amount = 5},
        {type = "item", name = "stone", amount = 1}
    },
    main_product = "crushed-iron",
    icon = "__pycoalprocessing__/graphics/icons/crush-iron.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "b"
}:add_unlock("crusher")

--COPPER
RECIPE {
    type = "recipe",
    name = "crushing-copper",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "copper-ore", amount = 5}
    },
    results = {
        {type = "item", name = "crushed-copper", amount = 5},
        {type = "item", name = "stone", amount = 1}
    },
    main_product = "crushed-copper",
    icon = "__pycoalprocessing__/graphics/icons/crush-copper.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "c"
}:add_unlock("crusher")

--STONE to GRAVEL
RECIPE {
    type = "recipe",
    name = "stone-to-gravel",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "stone", amount = 20}
    },
    results = {
        {type = "item", name = "gravel", amount = 15}
    },
    icon = "__pycoalprocessing__/graphics/icons/crush-stone.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "d"
}:add_unlock("crusher")

--GRAVEL to SAND
RECIPE {
    type = "recipe",
    name = "gravel-to-sand",
    category = "crusher",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "gravel", amount = 20}
    },
    results = {
        {type = "item", name = "sand", amount = 15}
    },
    icon = "__pycoalprocessing__/graphics/icons/crush-gravel.png",
    icon_size = 32,
    subgroup = "py-crusher",
    order = "e"
}:add_unlock("crusher")

if bobmods then
    --BAUXITE
    RECIPE {
        type = "recipe",
        name = "crushing-bauxite",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "bauxite-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-bauxite", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-bauxite",
        icon = "__pycoalprocessing__/graphics/icons/crush-bauxite.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "f"
    }:add_unlock("crusher")
    --GOLD
    RECIPE {
        type = "recipe",
        name = "crushing-gold",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "gold-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-gold", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-gold",
        icon = "__pycoalprocessing__/graphics/icons/crush-gold.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "g"
    }:add_unlock("crusher")
    --LEAD
    RECIPE {
        type = "recipe",
        name = "crushing-lead",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "lead-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-lead", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-lead",
        icon = "__pycoalprocessing__/graphics/icons/crush-lead.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "h"
    }:add_unlock("crusher")
    --QUARTZ
    RECIPE {
        type = "recipe",
        name = "crushing-lead",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "quartz", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-quartz", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-quartz",
        icon = "__pycoalprocessing__/graphics/icons/crush-quartz.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "i"
    }:add_unlock("crusher")
    --NICKEL
    RECIPE {
        type = "recipe",
        name = "crushing-nickel",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "nickel-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-nickel", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-nickel",
        icon = "__pycoalprocessing__/graphics/icons/crush-nickel.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "j"
    }:add_unlock("crusher")
    --RUTILE
    RECIPE {
        type = "recipe",
        name = "crushing-rutile",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "rutile-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-rutile", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-rutile",
        icon = "__pycoalprocessing__/graphics/icons/crush-rutile.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "k"
    }:add_unlock("crusher")
    --SILVER
    RECIPE {
        type = "recipe",
        name = "crushing-silver",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "silver-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-silver", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-silver",
        icon = "__pycoalprocessing__/graphics/icons/crush-silver.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "l"
    }:add_unlock("crusher")
    --TIN
    RECIPE {
        type = "recipe",
        name = "crushing-tin",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "tin-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-tin", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-tin",
        icon = "__pycoalprocessing__/graphics/icons/crush-tin.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "m"
    }:add_unlock("crusher")
    --TUNGSTEN
    RECIPE {
        type = "recipe",
        name = "crushing-tungsten",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "tungsten-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-tungsten", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-tungsten",
        icon = "__pycoalprocessing__/graphics/icons/crush-tungsten.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "n"
    }:add_unlock("crusher")
    --ZINC
    RECIPE {
        type = "recipe",
        name = "crushing-zinc",
        category = "crusher",
        enabled = "false",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "zinc-ore", amount = 5}
        },
        results = {
            {type = "item", name = "crushed-zinc", amount = 5},
            {type = "item", name = "stone", amount = 1}
        },
        main_product = "crushed-zinc",
        icon = "__pycoalprocessing__/graphics/icons/crush-zinc.png",
        icon_size = 32,
        subgroup = "py-crusher",
        order = "o"
    }:add_unlock("crusher")
end
