RECIPE {
    type = "recipe",
    name = "lithium-peroxide",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients = {
        --{type="fluid", name="lithia-water", amount=30},
        {type = "fluid", name = "water",             amount = 300},
        {type = "fluid", name = "hydrogen-peroxide", amount = 100}
    },
    results = {
        {type = "item", name = "lithium-peroxide", amount = 5}
    }
}:add_unlock("filtration-mk02")

RECIPE {
    type = "recipe",
    name = "nexelit-cartridge",
    category = "crafting",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "lithium-peroxide", amount = 25},
        {type = "item", name = "nexelit-plate",    amount = 10}
    },
    results = {
        {type = "item", name = "nexelit-cartridge", amount = 1}
    }
}:add_unlock("filtration-mk02")

RECIPE {
    type = "recipe",
    name = "air-pollution",
    category = "co2",
    enabled = false,
    energy_required = 40,
    ingredients = {
        {type = "item", name = "nexelit-cartridge", amount = 1}
    },
    results = {
        {type = "item", name = "saturated-nexelit-cartridge", amount = 1}
    },
    main_product = "saturated-nexelit-cartridge",
    icon = "__pycoalprocessinggraphics__/graphics/icons/co2-absorber-icon.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "d"
}:add_unlock("filtration-mk02")

RECIPE {
    type = "recipe",
    name = "co2",
    category = "hpf",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "item",  name = "saturated-nexelit-cartridge", amount = 1},
        {type = "fluid", name = "slacked-lime",                amount = 100},
        {type = "item",  name = "active-carbon",               amount = 2}
    },
    results = {
        {type = "fluid", name = "carbon-dioxide",              amount = 600},
        {type = "item",  name = "saturated-nexelit-cartridge", amount = 1},
        {type = "item",  name = "ash",                         amount = 10}
    },
    main_product = "carbon-dioxide",
    icon = "__pycoalprocessinggraphics__/graphics/icons/co2.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "d"
}:add_unlock("filtration-mk02")

RECIPE {
    type = "recipe",
    name = "saturated-nexelit-cartridge-regen",
    category = "crafting",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "item", name = "saturated-nexelit-cartridge", amount = 1},
        {type = "item", name = "lithium-peroxide",            amount = 25},
    },
    results = {
        {type = "item", name = "nexelit-cartridge", amount = 1}
    },
    main_product = "nexelit-cartridge",
    icon = "__pycoalprocessinggraphics__/graphics/icons/nexelit-cartridge.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "d"
}:add_unlock("filtration-mk02")
