RECIPE {
    type = "recipe",
    name = "diesel",
    category = "olefin",
    enabled = false,
    energy_required = 1.5,
    ingredients = {
        {type = "item", name = "nexelit-plate", amount = 2},
        {type = "fluid", name = "methanol", amount = 100},
        {type = "fluid", name = "carbon-dioxide", amount = 200}
    },
    results = {
        {type = "fluid", name = "diesel", amount = 150},
        {type = "fluid", name = "olefin", amount = 100}
    },
    main_product = "diesel",
    icon = "__pycoalprocessing__/graphics/icons/diesel.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d1"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "diesel2",
    category = "olefin",
    enabled = false,
    energy_required = 1.5,
    ingredients = {
        {type = "item", name = "nexelit-plate", amount = 2},
        {type = "fluid", name = "olefin", amount = 200}
    },
    results = {
        {type = "fluid", name = "diesel", amount = 200}
    },
    main_product = "diesel",
    icon = "__pycoalprocessing__/graphics/icons/diesel.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d2"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "aromatics",
    category = "olefin",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "nexelit-plate", amount = 2},
        {type = "fluid", name = "olefin", amount = 200},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 150},
        {type = "fluid", name = "water", amount = 100}
        --{type="fluid", name="hydrogen", amount=10},
    },
    main_product = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d3"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "olefin",
    category = "olefin",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "nexelit-plate", amount = 2},
        {type = "fluid", name = "water", amount = 400}, --bob hydrogen
        {type = "fluid", name = "carbon-dioxide", amount = 200}
    },
    results = {
        {type = "fluid", name = "olefin", amount = 200}
    },
    main_product = "olefin",
    icon = "__pycoalprocessing__/graphics/icons/olefin.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d4"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "olefin-petgas",
    category = "fluid-separator",
    enabled = false,
    energy_required = 2.8,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 300},
        {type = "fluid", name = "carbon-dioxide", amount = 200}
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 150},
        {type = "fluid", name = "light-oil", amount = 150}
    },
    main_product = "petroleum-gas",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d5"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "gasoline",
    category = "fluid-separator",
    enabled = false,
    energy_required = 2.8,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 300},
        {type = "item", name = "nexelit-plate", amount = 2},
        --{type="fluid", name="hydrogen", amount=20},
        {type = "fluid", name = "light-oil", amount = 200}
    },
    results = {
        {type = "fluid", name = "gasoline", amount = 150}
    },
    main_product = "gasoline",
    icon = "__pycoalprocessing__/graphics/icons/gasoline.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d6"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "refolefin",
    category = "olefin",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 250},
        {type = "item", name = "nexelit-plate", amount = 3}
    },
    results = {
        {type = "fluid", name = "olefin", amount = 250}
    },
    main_product = "olefin",
    icon = "__pycoalprocessing__/graphics/icons/olefin.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d7"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "aromaticsolefin",
    category = "olefin",
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 300}
    },
    results = {
        {type = "fluid", name = "olefin", amount = 250}
    },
    main_product = "olefin",
    icon = "__pycoalprocessing__/graphics/icons/olefin.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "d8	"
}:add_unlock("fuel-production")
