Recipe {
    type = "recipe",
    name = "heavy-oil_from_coal-gas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9,
    ingredients = {
        {type = "fluid", name = "coal-gas", amount = 350},
        {type = "item", name = "nichrome", amount = 2},
        {type = "fluid", name = "water", amount = 2000}
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 250},
        {type = "fluid", name = "tar", amount = 200},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60}
    },
    main_product = "heavy-oil",
    icon = "__base__/graphics/icons/fluid/heavy-oil.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h"
}

Recipe {
    type = "recipe",
    name = "light-oil_from_syngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 300},
        {type = "item", name = "nichrome", amount = 2},
        {type = "fluid", name = "water", amount = 2000}
    },
    results = {
        {type = "fluid", name = "light-oil", amount = 300},
        {type = "fluid", name = "olefin", amount = 150},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60}
    },
    main_product = "light-oil",
    icon = "__base__/graphics/icons/fluid/light-oil.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h1"
}

Recipe {
    type = "recipe",
    name = "petgas_from-refsyngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients = {
        {type = "fluid", name = "refsyngas", amount = 250},
        {type = "item", name = "nichrome", amount = 2},
        {type = "fluid", name = "light-oil", amount = 150}
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 400},
        {type = "fluid", name = "olefin", amount = 150}
    },
    main_product = "petroleum-gas",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h2"
}

Recipe {
    type = "recipe",
    name = "ref-to-light-oil",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 10,
    ingredients = {
        {type = "fluid", name = "water", amount = 2000},
        {type = "fluid", name = "refsyngas", amount = 150}
    },
    results = {
        {type = "fluid", name = "light-oil", amount = 400},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "carbon-dioxide", amount = 200}
    },
    icon = "__pycoalprocessing__/graphics/icons/ref_to_light_oil.png",
    icon_size = 32,
    main_product = "light-oil",
    subgroup = "py-fluid-handling",
    order = "h4"
}

Recipe {
    type = "recipe",
    name = "sulfuric-petgas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 250},
        {type = "fluid", name = "water", amount = 2000},
        {type = "fluid", name = "acidgas", amount = 150},
        {type = "item", name = "chromium", amount = 5}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 100},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "sulfuric-acid", amount = 500}
    },
    icon = "__pycoalprocessing__/graphics/icons/sulfuric-petgas.png",
    icon_size = 32,
    main_product = "sulfuric-acid",
    subgroup = "py-fluid-handling",
    order = "h5"
}

Recipe {
    type = "recipe",
    name = "combustion-olefin",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.5,
    ingredients = {
        {type = "fluid", name = "olefin", amount = 300},
        {type = "fluid", name = "water", amount = 2000},
        {type = "item", name = "nichrome", amount = 5}
    },
    results = {
        {type = "fluid", name = "carbon-dioxide", amount = 100},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "combustion-mixture1", amount = 300}
    },
    icon = "__pycoalprocessing__/graphics/icons/combustion-mixture1.png",
    icon_size = 32,
    main_product = "combustion-mixture1",
    subgroup = "py-fluid-handling",
    order = "h6"
}

Recipe {
    type = "recipe",
    name = "rare-earth-beneficiation",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 8,
    ingredients = {
        {type = "fluid", name = "sulfuric-acid", amount = 200},
        {type = "fluid", name = "water", amount = 2000},
        {type = "item", name = "rare-earth-dust", amount = 10},
    },
    results = {
        {type = "item", name = "rich-dust", amount = 5},
        {type = "fluid", name = "rare-earth-mud", amount = 250},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "item", name = "sand", amount = 10},
    },
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-mud.png",
    icon_size = 32,
    main_product = "rare-earth-mud",
    subgroup = "py-fluid-handling",
    order = "h7"
}

Recipe {
    type = "recipe",
    name = "dirty-reaction",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.3,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 800},
        {type = "fluid", name = "water", amount = 2000},
        {type = "fluid", name = "aromatics", amount = 450}
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 500},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "olefin", amount = 300}
    },
    main_product = "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/dirty-reaction.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h8"
}

Recipe {
    type = "recipe",
    name = "heavyoil-to-coal-gas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.3,
    ingredients = {
        {type = "fluid", name = "heavy-oil", amount = 500},
        {type = "fluid", name = "water", amount = 2000},
        {type = "item", name = "zinc-chloride", amount = 5}
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 350},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "tar", amount = 200}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/heavy-oil-to-coalgas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h9"
}

Recipe {
    type = "recipe",
    name = "lightoil-to-syngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.3,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 500},
        {type = "fluid", name = "water", amount = 2000},
        {type = "item", name = "active-carbon", amount = 5}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 350},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "tar", amount = 200}
    },
    main_product = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/light-oil-to-syngas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h10"
}

Recipe {
    type = "recipe",
    name = "petgas-to-refsyngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 9.3,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 500},
        {type = "fluid", name = "water", amount = 2000},
        {type = "item", name = "chromium", amount = 5}
    },
    results = {
        {type = "fluid", name = "refsyngas", amount = 350},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "fluid", name = "tar", amount = 200}
    },
    main_product = "refsyngas",
    icon = "__pycoalprocessing__/graphics/icons/petgas-to-refsyngas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h11"
}

Recipe {
    type = "recipe",
    name = "glycerol-syngas",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 200},
        {type = "fluid", name = "water", amount = 2000}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 200},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60},
        {type = "item", name = "ash", amount = 5}
    },
    main_product = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/glycerol-syngas.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "h12"
}

Recipe {
    type = "recipe",
    name = "coal-briquette",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "coal-dust", amount = 35},
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "creosote", amount = 150},
        {type = "fluid", name = "tar", amount = 50}
    },
    results = {
        {type = "item", name = "coal-briquette", amount = 1}
    },
    main_product = "coal-briquette",
    icon = "__pycoalprocessing__/graphics/icons/coal-briquette.png",
    icon_size = 32
}
