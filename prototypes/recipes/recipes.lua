RECIPE {
    type = "recipe",
    name = "iron-oxide",
    enabled = true,
    category = "smelting",
    energy_required = 3.5,
    ingredients = {{"iron-oxide", 20}},
    results = {
        {"iron-plate", 10}
    }
}

RECIPE {
    type = "recipe",
    name = "soil",
    category = "soil-extraction",
    enabled = true,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "soil", amount = 12}
    }
}

RECIPE {
    type = "recipe",
    name = "fawogae",
    category = "fawogae",
    enabled = true,
    --hidden = true,
    energy_required = 5.0,
    ingredients = {
        {type = "fluid", name = "water", amount = 900}
    },
    results = {
        {type = "item", name = "fawogae", amount = 8}
    }
}

RECIPE {
    type = "recipe",
    name = "soil-washing",
    category = "washer",
    enabled = true,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "soil", amount = 30},
        {type = "fluid", name = "water", amount = 600}
    },
    results = {
        {type = "item", name = "sand", amount = 10},
        {type = "fluid", name = "dirty-water", amount = 100}
    },
    main_product = "sand",
    icon = "__pycoalprocessing__/graphics/icons/soil-washer.png",
    icon_size = 32,
    subgroup = "py-washer",
    order = "c"
}

RECIPE {
    type = "recipe",
    name = "sand-washing",
    category = "washer",
    enabled = true,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "sand", amount = 10},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "item", name = "pure-sand", amount = 8},
        {type = "fluid", name = "dirty-water", amount = 80}
    },
    main_product = "pure-sand",
    icon = "__pycoalprocessing__/graphics/icons/sand-washer.png",
    icon_size = 32,
    subgroup = "py-washer",
    order = "a"
}

RECIPE {
    type = "recipe",
    name = "fawogae-substrate",
    category = "crafting",
    enabled = true,
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "fawogae", amount = 10},
        {type = "item", name = "coke", amount = 5}
    },
    results = {
        {type = "item", name = "fawogae-substrate", amount = 10}
    },
    main_product = "fawogae-substrate",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-substrate.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "flask",
    enabled = true,
    energy_required = 2,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 8},
        --{type="item", name="glass", amount=8}, --updated bob add glass
        {type = "item", name = "wood", amount = 5}
    },
    results = {
        {"flask", 1}
    },
    icon = "__pycoalprocessing__/graphics/icons/mip/glassware-01.png",
    icon_size = 64,
    subgroup = "py-items",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "automation-science-pack",
    enabled = true,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "fawogae-substrate", amount = 10},
        {type = "item", name = "flask", amount = 2}
    },
    results = {
        {type = "item", name = "automation-science-pack", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/science-pack-1.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a1"
}

RECIPE {
    type = "recipe",
    name = "cooling-water",
    hidden = true,
    category = "cooling",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "steam", amount = 400}
    },
    results = {
        {type = "fluid", name = "water", amount = 400}
    },
    main_product = "water",
    subgroup = "py-fluids",
    order = "a",
    icon = "__pycoalprocessing__/graphics/icons/cooling-water.png",
    icon_size = 32
}:add_unlock("cooling-tower-1")

RECIPE {
    type = "recipe",
    name = "fluegas-to-syngas",
    category = "carbonfilter",
    enabled = false,
    energy_required = 7,
    ingredients = {
        {type = "fluid", name = "flue-gas", amount = 3000},
        {type = "item", name = "active-carbon", amount = 5}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 300}
    },
    subgroup = "py-syngas",
    order = "a",
    icon = "__pycoalprocessing__/graphics/icons/fluegas_to_syngas.png",
    icon_size = 32
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "chemical-science-pack",
    enabled = false,
    energy_required = 4.5,
    ingredients = {
        {type = "item", name = "optical-fiber", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 1},
        {type = "item", name = "copper-cable", amount = 8}, --bob insulated-cable
        {type = "item", name = "iron-plate", amount = 10}
    },
    results = {
        {type = "item", name = "chemical-science-pack", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/science-pack-3.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a3"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "bone-solvent",
    category = "carbonfilter",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 100},
        {type = "item", name = "bonemeal", amount = 20}
    },
    results = {
        {type = "fluid", name = "organic-solvent", amount = 50}
    },
    main_product = "organic-solvent",
    icon = "__pycoalprocessing__/graphics/icons/bone-solvent.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "e"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "dirty-acid",
    category = "carbonfilter",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "biofilm", amount = 1},
        {type = "fluid", name = "dirty-water", amount = 200}
    },
    results = {
        {type = "fluid", name = "acidgas", amount = 40}
    },
    main_product = "acidgas",
    icon = "__pycoalprocessing__/graphics/icons/acidgas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "f"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "filtration-dirty-water",
    category = "carbonfilter",
    enabled = false,
    energy_required = 5.5,
    ingredients = {
        {type = "item", name = "filtration-media", amount = 1},
        {type = "fluid", name = "dirty-water", amount = 500}
    },
    results = {
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "ash", amount = 2}
    },
    main_product = "water",
    icon = "__pycoalprocessing__/graphics/icons/filtration-dirty-water.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "g"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "olefin-filtration",
    category = "carbonfilter",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "zinc-chloride", amount = 5},
        {type = "fluid", name = "olefin", amount = 400}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 200}
    },
    main_product = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h"
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "oleochemicals-crude-oil",
    category = "carbonfilter",
    enabled = false,
    energy_required = 5.0,
    ingredients = {
        {type = "item", name = "filtration-media", amount = 1},
        {type = "fluid", name = "oleochemicals", amount = 300}
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 400}
    },
    main_product = "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/oleochemicals-crude-oil.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "crushed-iron",
    category = "smelting",
    enabled = false,
    energy_required = 3.5,
    ingredients = {{"crushed-iron", 1}},
    results = {
        {"iron-plate", 2}
    },
}:add_unlock("crusher")

RECIPE {
    type = "recipe",
    name = "crushed-copper",
    category = "smelting",
    enabled = false,
    energy_required = 3.5,
    ingredients = {{"crushed-copper", 1}},
    results = {
        {"copper-plate", 2}
    },
}:add_unlock("crusher")

RECIPE {
    type = "recipe",
    name = "aromatics-to-rubber",
    category = "methanol",
    enabled = false,
    energy_required = 1.5,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 60},
        {type = "fluid", name = "syngas", amount = 40}
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 100} --bobs rubber
    },
    icon = "__pycoalprocessing__/graphics/icons/aromatics-rubber.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "w"
}:add_unlock("methanol-processing-1")

RECIPE {
    type = "recipe",
    name = "aromatics-to-plastic",
    category = "methanol",
    enabled = false,
    energy_required = 1.5,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 40},
        {type = "fluid", name = "syngas", amount = 60}
    },
    results = {
        {type = "item", name = "plastic-bar", amount = 1}
    },
    main_product = "plastic-bar",
    icon = "__pycoalprocessing__/graphics/icons/aromatics-rubber.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "x"
}:add_unlock("methanol-processing-1")

RECIPE {
    type = "recipe",
    name = "nas-battery",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "sulfur", amount = 20},
        {type = "item", name = "copper-ore", amount = 60}, --bobs sodium-hydroxide
        {type = "item", name = "steel-plate", amount = 1},
        {type = "item", name = "chromium", amount = 1}
    },
    results = {
        {type = "item", name = "battery", amount = 6}
    },
    main_product = "battery",
    icon = "__pycoalprocessing__/graphics/icons/nas-battery.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "y"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "fluegas-filtration",
    category = "carbonfilter",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "flue-gas", amount = 100}
    },
    results = {
        {type = "item", name = "ash", amount = 2}
    },
    icon = "__pycoalprocessing__/graphics/icons/ash.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "g"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "lime",
    category = "hpf",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "coke", amount = 15},
        {type = "item", name = "limestone", amount = 10}
    },
    results = {
        {type = "item", name = "lime", amount = 10},
        {type = "fluid", name = "carbon-dioxide", amount = 100}
    },
    main_product = "lime"
}:add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "fuelrod-mk01",
    category = "hpf",
    enabled = false,
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "niobium-plate", amount = 2},
        {type = "item", name = "nexelit-ore", amount = 10},
        {type = "item", name = "coke", amount = 10}
    },
    results = {
        {type = "item", name = "fuelrod-mk01", amount = 3}
    }
}:add_unlock("fuel-production")

RECIPE {
    type = "recipe",
    name = "glass-core",
    category = "hpf",
    enabled = false,
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "sand", amount = 10}, --bob glass
        {type = "item", name = "steel-plate", amount = 3}, --bob silver-plate
        {type = "item", name = "sulfur", amount = 4}
    },
    results = {
        {type = "item", name = "glass-core", amount = 1}
    },
    main_product = "glass-core"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "cladding",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "sand", amount = 5}, --bob glass
        {type = "fluid", name = "niobium-complex", amount = 60}
    },
    results = {
        {type = "item", name = "cladding", amount = 1}
    },
    main_product = "cladding"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "ppd",
    category = "chemistry", --bob electrolysis
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "water", amount = 500}, --Added Bob hydrogen
        {type = "fluid", name = "aromatics", amount = 50}
    },
    results = {
        {type = "item", name = "ppd", amount = 10}
    },
    main_product = "ppd"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "kevlar",
    category = "chemistry",
    enabled = false,
    energy_required = 6.0,
    ingredients = {
        {type = "item", name = "ppd", amount = 5},
        {type = "fluid", name = "tpa", amount = 50},
        {type = "fluid", name = "organic-solvent", amount = 100}
    },
    results = {
        {type = "item", name = "kevlar", amount = 5}
    },
    main_product = "kevlar"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "kevlar-coating",
    category = "crafting",
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "copper-coating", amount = 1},
        {type = "item", name = "kevlar", amount = 1}
    },
    results = {
        {type = "item", name = "kevlar-coating", amount = 1}
    },
    main_product = "kevlar-coating"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "nbfe-alloy",
    category = "hpf", --bobs smelting
    enabled = false,
    energy_required = 4.0,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 15},
        {type = "item", name = "niobium-plate", amount = 4}
    },
    results = {
        {type = "item", name = "nbfe-alloy", amount = 2}
    },
    main_product = "nbfe-alloy"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "nbfe-coating",
    category = "crafting",
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "kevlar-coating", amount = 1},
        {type = "item", name = "nbfe-alloy", amount = 1}
    },
    results = {
        {type = "item", name = "nbfe-coating", amount = 1}
    },
    main_product = "nbfe-coating"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "cladded-core",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "cladding", amount = 1},
        {type = "item", name = "glass-core", amount = 1}
    },
    results = {
        {type = "item", name = "cladded-core", amount = 1}
    },
    main_product = "cladded-core"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "copper-coating",
    category = "chemistry", --bob electrolysis
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "copper-plate", amount = 10},
        {type = "item", name = "cladded-core", amount = 1},
        {type = "fluid", name = "organic-solvent", amount = 20}
    },
    results = {
        {type = "item", name = "copper-coating", amount = 2}
    },
    main_product = "copper-coating"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "optical-fiber",
    category = "advanced-crafting",
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "plastic-bar", amount = 2},
        {type = "item", name = "nbfe-coating", amount = 1}
    },
    results = {
        {type = "item", name = "optical-fiber", amount = 3}
    },
    main_product = "optical-fiber"
}:add_unlock("fine-electronics")

RECIPE {
    type = "recipe",
    name = "biofilm",
    category = "crafting",
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "fawogae-substrate", amount = 20},
        {type = "item", name = "lime", amount = 5},
        {type = "item", name = "organics", amount = 5}
    },
    results = {
        {type = "item", name = "biofilm", amount = 2}
    },
    main_product = "biofilm"
}:add_unlock("filtration")

RECIPE {
    type = "recipe",
    name = "filtration-media",
    category = "crafting",
    enabled = false,
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "pure-sand", amount = 30},
        {type = "item", name = "active-carbon", amount = 3},
        {type = "item", name = "gravel", amount = 25}
        --bob add glass
    },
    results = {
        {type = "item", name = "filtration-media", amount = 5}
    },
    main_product = "filtration-media"
}:add_unlock("filtration")
