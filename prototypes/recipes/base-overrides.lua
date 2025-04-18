RECIPE {
    type = "recipe",
    name = "concrete",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients = {
        {type = "item",  name = "lime",   amount = 5},
        {type = "item",  name = "sand",   amount = 10},
        {type = "item",  name = "gravel", amount = 10},
        {type = "fluid", name = "water",  amount = 100}
    },
    results = {{type = "item", name = "concrete", amount = 5}}
}:remove_unlock("concrete"):add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "fast-transport-belt",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
        {type = "item",  name = "iron-gear-wheel", amount = 2},
        {type = "item",  name = "transport-belt",  amount = 2},
        {type = "item",  name = "nbfe-alloy",      amount = 1},
        {type = "fluid", name = "lubricant",       amount = 10}
    },
    results = {{type = "item", name = "fast-transport-belt", amount = 2}}
}

RECIPE {
    type = "recipe",
    name = "fast-underground-belt",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {type = "item", name = "underground-belt", amount = 2},
        {type = "item", name = "iron-gear-wheel",  amount = 10},
        {type = "item", name = "nbfe-alloy",       amount = 1},
        {type = "item", name = "chromium",         amount = 1}
    },
    results = {{type = "item", name = "fast-underground-belt", amount = 2}}
}

RECIPE {
    type = "recipe",
    name = "fast-splitter",
    energy_required = 2,
    enabled = false,
    ingredients = {
        {type = "item", name = "splitter",         amount = 1},
        {type = "item", name = "iron-gear-wheel",  amount = 5},
        {type = "item", name = "advanced-circuit", amount = 2},
        {type = "item", name = "nbfe-alloy",       amount = 1},
        {type = "item", name = "chromium",         amount = 1}
    },
    results = {{type = "item", name = "fast-splitter", amount = 1}}
}

RECIPE {
    type = "recipe",
    name = "electric-engine-unit",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item",  name = "iron-stick",         amount = 1},
        {type = "item",  name = "copper-cable",       amount = 100},
        {type = "item",  name = "electronic-circuit", amount = 3},
        {type = "fluid", name = "lubricant",          amount = 50}
    },
    results = {{type = "item", name = "electric-engine-unit", amount = 3}}
}

RECIPE {
    type = "recipe",
    name = "processing-unit",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item",  name = "advanced-circuit", amount = 2},
        {type = "fluid", name = "sulfuric-acid",    amount = 5},
        {type = "item",  name = "optical-fiber",    amount = 2}
    },
    results = {{type = "item", name = "processing-unit", amount = 2}}
}

RECIPE {
    type = "recipe",
    name = "low-density-structure",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 20,
    ingredients = {
        {type = "item", name = "steel-plate",   amount = 2},
        {type = "item", name = "plastic-bar",   amount = 5},
        {type = "item", name = "niobium-plate", amount = 10}
    },
    results = {{type = "item", name = "low-density-structure", amount = 1}}
}

-- Science pack changes
RECIPE {
    type = "recipe",
    name = "production-science-pack",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "saturated-nexelit-cartridge", amount = 2},
        {type = "item", name = "speed-module-2",              amount = 2},
        {type = "item", name = "efficiency-module-2",         amount = 2},
        {type = "item", name = "coal-briquette",              amount = 5},
        {type = "item", name = "uranium-fuel-cell",           amount = 1},
        {type = "item", name = "electric-engine-unit",        amount = 4}
    },
    results = {{type = "item", name = "production-science-pack", amount = 3}}
}

RECIPE {
    type = "recipe",
    name = "utility-science-pack",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item", name = "assembling-machine-3",      amount = 2},
        {type = "item", name = "nuclear-fuel",              amount = 3},
        {type = "item", name = "fission-reactor-equipment", amount = 1},
        {type = "item", name = "destroyer-capsule",         amount = 4}
    },
    results = {{type = "item", name = "utility-science-pack", amount = 8}}
}

RECIPE {
    type = "recipe",
    name = "fission-reactor-equipment",
    enabled = false,
    energy_required = 10,
    ingredients = {{type = "item", name = "processing-unit", amount = 25}, {type = "item", name = "low-density-structure", amount = 10}},
    results = {
        {type = "item", name = "fission-reactor-equipment", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "distractor-capsule",
    enabled = false,
    energy_required = 15,
    ingredients = {{type = "item", name = "defender-capsule", amount = 2}, {type = "item", name = "advanced-circuit", amount = 2}},
    results = {
        {type = "item", name = "distractor-capsule", amount = 2}
    }
}

RECIPE {
    type = "recipe",
    name = "destroyer-capsule",
    enabled = false,
    energy_required = 15,
    ingredients = {{type = "item", name = "distractor-capsule", amount = 2}, {type = "item", name = "speed-module", amount = 1}},
    results = {
        {type = "item", name = "destroyer-capsule", amount = 2}
    }
}

RECIPE {
    type = "recipe",
    name = "assembling-machine-3",
    enabled = false,
    ingredients = {{type = "item", name = "bulk-inserter", amount = 2}, {type = "item", name = "assembling-machine-2", amount = 2}},
    results = {
        {type = "item", name = "assembling-machine-3", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "rocket-fuel",
    enabled = false,
    category = "crafting-with-fluid",
    ingredients = {
        {type = "fluid", name = "hydrogen-peroxide", amount = 80},
        {type = "fluid", name = "methanol",          amount = 20}
    },
    results = {
        {type = "item", name = "rocket-fuel", amount = 1}
    }
}

RECIPE {
    type = "recipe",
    name = "lubricant",
    category = "chemistry",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "heavy-oil",     amount = 150},
        {type = "item",  name = "nexelit-plate", amount = 2}
    },
    results = {{type = "fluid", name = "lubricant", amount = 100}},
    subgroup = "fluid-recipes",
    crafting_machine_tint = {
        primary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000},   -- #44b838ff
        secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}, -- #6eca62ff
        tertiary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000},  -- #a57865ff
        quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000} -- #ff6420ff
    }
}:add_unlock("advanced-oil-processing")

RECIPE("hazard-concrete"):remove_unlock("concrete"):add_unlock("separation")

RECIPE {
    type = "recipe",
    name = "shotgun-shell",
    category = "crafting",
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = "item", name = "iron-plate",   amount = 1},
        {type = "item", name = "copper-plate", amount = 1},
        {type = "item", name = "gunpowder",    amount = 2},
    },
    results = {{type = "item", name = "shotgun-shell", amount = 3}}
}
