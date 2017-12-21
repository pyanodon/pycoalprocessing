local Data = require("stdlib/data/data")
--NOT A GOOD NAME

Data {
    type = "item",
    name = "ash",
    icon = "__pycoalprocessing__/graphics/icons/ash.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "ash",
    stack_size = 1000
}

--CHROMIUM
Data {
    type = "item",
    name = "chromium",
    icon = "__pycoalprocessing__/graphics/icons/chromium.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "chromium",
    stack_size = 100
}

--GRAVEL
Data {
    type = "item",
    name = "gravel",
    icon = "__pycoalprocessing__/graphics/icons/gravel.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "gravel",
    stack_size = 300
}

--NOT A GOOD NAME
Data {
    type = "item",
    name = "coke",
    fuel_value = "10MJ",
    fuel_category = "chemical",
    icon = "__pycoalprocessing__/graphics/icons/coke.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "coke",
    stack_size = 500
}

--NICHROME
Data {
    type = "recipe",
    name = "nichrome",
    category = "hpf",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "fluid", name = "water", amount = 100}, --bob nitrogen
        {type = "item", name = "iron-plate", amount = 10}, --bob nickel-plate
        {type = "item", name = "chromium", amount = 5}
    },
    result = "nichrome"
}
Data {
    type = "item",
    name = "nichrome",
    icon = "__pycoalprocessing__/graphics/icons/nichrome.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "nichrome",
    stack_size = 200
}

--IRON OXIDE
--Iron ore is typically hidden as a product, smelt directly to iron plate instead
--2x iron-oxide = 1x iron-plate in the same time it takes 1x iron-ore -> 1x plate
Data {
    type = "recipe",
    name = "iron-oxide",
    category = "smelting",
    energy_required = 3.5,
    ingredients = {{"iron-oxide", 2}},
    result = "iron-plate"
}

Data {
    type = "item",
    name = "iron-oxide",
    icon = "__pycoalprocessing__/graphics/icons/iron-oxide.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "iron-oxide",
    stack_size = 200
}

--ACTIVE CARBON
Data {
    type = "recipe",
    name = "active-carbon",
    category = "hpf",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "water", amount = 100}, --bob nitrogen
        {type = "item", name = "zinc-chloride", amount = 2},
        {type = "item", name = "coke", amount = 20}
        --{type="item", name="sodium-hydroxide", amount=5},
    },
    results = {
        {type = "item", name = "active-carbon", amount = 5}
    }
}
Data {
    type = "item",
    name = "active-carbon",
    fuel_value = "25MJ",
    fuel_category = "chemical",
    icon = "__pycoalprocessing__/graphics/icons/active-carbon.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "hpf-[active-carbon]",
    stack_size = 100
}

--ZINC CHLORIDE
Data {
    type = "recipe",
    name = "zinc-chloride",
    category = "chemistry",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "water", amount = 20}, --bob hydrogen-chloride
        {type = "item", name = "iron-plate", amount = 1}, --bob zinc-plate
        {type = "item", name = "copper-plate", amount = 1} --bob --remove
    },
    results = {
        {type = "item", name = "zinc-chloride", amount = 1}
        --{type="fluid", name="hydrogen", amount=2}, --bob hydrogen
    },
    main_product = "zinc-chloride",
    icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
    icon_size = 32,
    order = "d [syn-gas]"
}

Data {
    type = "item",
    name = "zinc-chloride",
    icon = "__pycoalprocessing__/graphics/icons/zinc-chloride.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "zinc-chloride",
    stack_size = 100
}

--TAILINGS DUST
Data {
    type = "recipe",
    name = "tailings-dust",
    category = "evaporator",
    enabled = "false",
    energy_required = 6,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 100}
    },
    results = {
        {type = "item", name = "tailings-dust", amount = 6},
        {type = "fluid", name = "acidgas", amount = 30, probability = 0.5}
    },
    main_product = "tailings-dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_dust.png",
    icon_size = 32,
}
Data {
    type = "item",
    name = "tailings-dust",
    icon = "__pycoalprocessing__/graphics/icons/tailings_dust.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "tailings-dust",
    stack_size = 1000
}

-- SOIL
Data {
    type = "recipe",
    name = "soil",
    category = "soil-extraction",
    enabled = "true",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "soil", amount = 12}
    },
}
Data {
    type = "item",
    name = "soil",
    icon = "__pycoalprocessing__/graphics/icons/soil.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "soil",
    stack_size = 1000
}

-- NEXELIT-ORE
Data {
    type = "item",
    name = "nexelit-ore",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-ore.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 300
}

-- DRILL-HEAD
Data {
    type = "recipe",
    name = "drill-head",
    category = "crafting",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "steel-plate", amount = 8},
        {type = "item", name = "chromium", amount = 3},
        {type = "item", name = "iron-plate", amount = 5} --bob titanium-plate
    },
    results = {
        {type = "item", name = "drill-head", amount = 4}
    }
}
Data {
    type = "item",
    name = "drill-head",
    icon = "__pycoalprocessing__/graphics/icons/drill-head.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}

--SAND
Data {
    type = "item",
    name = "sand",
    icon = "__pycoalprocessing__/graphics/icons/sand.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "sand",
    stack_size = 500
}

--PURE SAND
Data {
    type = "item",
    name = "pure-sand",
    icon = "__pycoalprocessing__/graphics/icons/pure-sand.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "pure-sand",
    stack_size = 500
}

--LIMESTONE
Data {
    type = "item",
    name = "limestone",
    icon = "__pycoalprocessing__/graphics/icons/limestone.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "limestone",
    stack_size = 300
}

--ORGANICS
Data {
    type = "item",
    name = "organics",
    icon = "__pycoalprocessing__/graphics/icons/organics.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "organics",
    stack_size = 300
}

--COARSE FRACTION
Data {
    type = "item",
    name = "coarse",
    icon = "__pycoalprocessing__/graphics/icons/coarse.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "coarse",
    stack_size = 500
}

--RICH DUST
Data {
    type = "item",
    name = "rich-dust",
    icon = "__pycoalprocessing__/graphics/icons/richdust.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "rich-dust",
    stack_size = 500
}

--COAL DUST
Data {
    type = "item",
    name = "coal-dust",
    icon = "__pycoalprocessing__/graphics/icons/coal_dust.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    fuel_value = "7MJ",
    fuel_category = "chemical",
    subgroup = "py-items",
    order = "coal-dust",
    stack_size = 500
}

--CHROMITE SAND
Data {
    type = "item",
    name = "chromite-sand",
    icon = "__pycoalprocessing__/graphics/icons/chromite_sand.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "chromite-sand",
    stack_size = 500
}

--NEXELIT-PLATE
Data {
    type = "item",
    name = "nexelit-plate",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "nexelit-plate",
    stack_size = 300
}

--SAND-CASTING
Data {
    type = "item",
    name = "sand-casting",
    icon = "__pycoalprocessing__/graphics/icons/sand-casting.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "sand-casting",
    stack_size = 200
}

-- LITHIUM PEROXIDE
Data {
    type = "recipe",
    name = "lithium-peroxide",
    category = "chemistry",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        --{type="fluid", name="lithia-water", amount=30},
        {type = "fluid", name = "water", amount = 300},
        {type = "fluid", name = "hydrogen-peroxide", amount = 100}
    },
    results = {
        {type = "item", name = "lithium-peroxide", amount = 5}
    }
}
Data {
    type = "item",
    name = "lithium-peroxide",
    icon = "__pycoalprocessing__/graphics/icons/lithium-peroxide.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}

-- NEXELIT CARTRIDGE
Data {
    type = "recipe",
    name = "nexelit-cartridge",
    category = "crafting",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "item", name = "lithium-peroxide", amount = 25},
        {type = "item", name = "nexelit-plate", amount = 10}
    },
    results = {
        {type = "item", name = "nexelit-cartridge", amount = 1}
    }
}
Data {
    type = "item",
    name = "nexelit-cartridge",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-cartridge.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- SATURATED NEXELIT CARTRIDGE
Data {
    type = "item",
    name = "saturated-nexelit-cartridge",
    icon = "__pycoalprocessing__/graphics/icons/saturated-nexelit-cartridge.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- LIME
Data {
    type = "recipe",
    name = "lime",
    category = "hpf",
    enabled = "false",
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
}
Data {
    type = "item",
    name = "lime",
    icon = "__pycoalprocessing__/graphics/icons/lime.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

--FUEL ROD MK01
Data {
    type = "recipe",
    name = "fuelrod-mk01",
    category = "hpf",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "niobium-plate", amount = 2},
        {type = "item", name = "nexelit-ore", amount = 10},
        {type = "item", name = "coke", amount = 10}
    },
    results = {
        {type = "item", name = "fuelrod-mk01", amount = 3}
    }
}
Data {
    type = "item",
    name = "fuelrod-mk01",
    fuel_value = "150MJ",
    fuel_category = "chemical",
    icon = "__pycoalprocessing__/graphics/icons/fuelrod-mk01.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "hpf-[active-carbon]",
    stack_size = 200
}

--FAWOGAE PRODUCTION
Data {
    type = "recipe",
    name = "fawogae",
    category = "fawogae",
    enabled = "true",
    energy_required = 5.0,
    ingredients = {
        {type = "fluid", name = "water", amount = 900}
    },
    results = {
        {type = "item", name = "fawogae", amount = 8}
    }
}
Data {
    type = "item",
    name = "fawogae",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-icon.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
    stack_size = 300
}

-- FAWOGAE SUBSTRATE
Data {
    type = "item",
    name = "fawogae-substrate",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-substrate.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- FLASK
Data {
    type = "item",
    name = "flask",
    icon = "__pycoalprocessing__/graphics/icons/flask.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 50
}

--BONEMEAL
Data {
    type = "item",
    name = "bonemeal",
    icon = "__pycoalprocessing__/graphics/icons/bonemeal.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
    stack_size = 300
}

-- RAW BORAX
Data {
    type = "item",
    name = "raw-borax",
    icon = "__pycoalprocessing__/graphics/icons/raw-borax.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- BORAX
Data {
    type = "item",
    name = "borax",
    icon = "__pycoalprocessing__/graphics/icons/borax.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- RALESIA
Data {
    type = "item",
    name = "ralesia",
    icon = "__pycoalprocessing__/graphics/icons/ralesia.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 200
}

-- RICH CLAY
Data {
    type = "item",
    name = "rich-clay",
    icon = "__pycoalprocessing__/graphics/icons/rich-clay.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- GROUND SAMPLE 01
Data {
    type = "item",
    name = "ground-sample01",
    icon = "__pycoalprocessing__/graphics/icons/ground-sample01.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- BIO SAMPLE 01
Data {
    type = "item",
    name = "bio-sample01",
    icon = "__pycoalprocessing__/graphics/icons/bio-sample01.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- ALIEN SAMPLE 01
Data {
    type = "item",
    name = "alien-sample01",
    icon = "__pycoalprocessing__/graphics/icons/alien-sample01.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- EQUIPMENT CHASSI
Data {
    type = "item",
    name = "equipment-chassi",
    icon = "__pycoalprocessing__/graphics/icons/equipment-chassi.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- LAB INSTRUMENT
Data {
    type = "item",
    name = "lab-instrument",
    icon = "__pycoalprocessing__/graphics/icons/lab-instrument.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- LENS
Data {
    type = "item",
    name = "lens",
    icon = "__pycoalprocessing__/graphics/icons/lens.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- BORON TRIOXIDE
Data {
    type = "item",
    name = "boron-trioxide",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/boron-trioxide.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- RALESIA SEEDS
Data {
    type = "item",
    name = "ralesia-seeds",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-seeds.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

--NIOBIUM ORE
Data {
    type = "recipe",
    name = "niobium-ore",
    category = "niobium",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "drill-head", amount = 1},
        {type = "fluid", name = "refsyngas", amount = 70}
    },
    results = {
        {type = "item", name = "niobium-ore", amount = 12}
    }
}
Data {
    type = "item",
    name = "niobium-ore",
    icon = "__pycoalprocessing__/graphics/icons/niobium-ore.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    order = "g",
    stack_size = 100
}

--NIOBIUM POWDER
Data {
    type = "item",
    name = "niobium-powder",
    icon = "__pycoalprocessing__/graphics/icons/niobium-powder.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    stack_size = 100
}

--NIOBIUM DUST
Data {
    type = "recipe",
    name = "niobium-dust",
    category = "ball-mill",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        {type = "item", name = "niobium-powder", amount = 5}
    },
    results = {
        {type = "item", name = "niobium-dust", amount = 10},
        {type = "item", name = "gravel", amount = 2}
    },
    main_product = "niobium-dust"
}
Data {
    type = "item",
    name = "niobium-dust",
    icon = "__pycoalprocessing__/graphics/icons/niobium-dust.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-mill",
    --order = "g",
    stack_size = 100
}

--NIOBIUM CONCENTRATE
Data {
    type = "recipe",
    name = "niobium-concentrate",
    category = "classifier",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "item", name = "niobium-dust", amount = 15}
    },
    results = {
        {type = "item", name = "niobium-concentrate", amount = 10},
        {type = "item", name = "sand", amount = 2}
    },
    main_product = "niobium-concentrate",
}
Data {
    type = "item",
    name = "niobium-concentrate",
    icon = "__pycoalprocessing__/graphics/icons/niobium-concentrate.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-class",
    order = "d",
    stack_size = 100
}

--MUKMOUX FAT
Data {
    type = "recipe",
    name = "mukmoux-fat",
    category = "mukmoux",
    enabled = "false",
    energy_required = 7.2,
    ingredients = {
        {type = "item", name = "fawogae", amount = 5},
        {type = "item", name = "ralesia-seeds", amount = 30}
    },
    results = {
        {type = "item", name = "mukmoux-fat", amount = 15}
    },
    main_product = "mukmoux-fat"
}
Data {
    type = "item",
    name = "mukmoux-fat",
    icon = "__pycoalprocessing__/graphics/icons/mukmoux-fat.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}

--NIOBIUM OXIDE
Data {
    type = "recipe",
    name = "niobium-oxide",
    category = "chemistry",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {
        {type = "fluid", name = "water", amount = 250}, --Added Bob nitrogen-dioxide
        {type = "fluid", name = "niobium-complex", amount = 50}
    },
    results = {
        {type = "item", name = "niobium-oxide", amount = 10}
    },
    main_product = "niobium-oxide"
}
Data {
    type = "item",
    name = "niobium-oxide",
    icon = "__pycoalprocessing__/graphics/icons/niobium-oxide.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}

--NIOBIUM PLATE
Data {
    type = "recipe",
    name = "niobium-plate",
    category = "chemistry", --bob electrolysis
    enabled = "false",
    energy_required = 3.5,
    ingredients = {
        {type = "item", name = "coal", amount = 20}, --bob salt
        {type = "item", name = "niobium-oxide", amount = 6}
    },
    results = {
        {type = "item", name = "niobium-plate", amount = 2}
    },
    main_product = "niobium-plate"
}
Data {
    type = "item",
    name = "niobium-plate",
    icon = "__pycoalprocessing__/graphics/icons/niobium-plate.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 50
}

-- RARE-EARTH ORE
Data {
    type = "item",
    name = "rare-earth-ore",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-ore.png",
    icon_size = 32,
    enabled = "false",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 500
}

--RARE-EARTH-POWDER
Data {
    type = "recipe",
    name = "rare-earth-powder",
    category = "crusher",
    enabled = "false",
    energy_required = 4.0,
    ingredients = {
        {type = "item", name = "rare-earth-ore", amount = 10}
    },
    results = {
        {type = "item", name = "rare-earth-powder", amount = 8},
        {type = "item", name = "stone", amount = 2}
    },
    main_product = "rare-earth-powder"
}
Data {
    type = "item",
    name = "rare-earth-powder",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-powder.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    --order = "g",
    stack_size = 200
}

--RARE-EARTH-DUST
Data {
    type = "recipe",
    name = "rare-earth-dust",
    category = "ball-mill",
    enabled = "false",
    energy_required = 5.0,
    ingredients = {
        {type = "item", name = "rare-earth-powder", amount = 8}
    },
    results = {
        {type = "item", name = "rare-earth-dust", amount = 5},
        {type = "item", name = "gravel", amount = 2}
    },
    main_product = "rare-earth-dust"
}
Data {
    type = "item",
    name = "rare-earth-dust",
    icon = "__pycoalprocessing__/graphics/icons/rare-earth-dust.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-crusher",
    --order = "g",
    stack_size = 200
}

--GLASS CORE
Data {
    type = "recipe",
    name = "glass-core",
    category = "hpf",
    enabled = "false",
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
}
Data {
    type = "item",
    enabled = "false",
    name = "glass-core",
    icon = "__pycoalprocessing__/graphics/icons/glass-core.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items-hpf",
    --order = "g",
    stack_size = 200
}

--CLADDING
Data {
    type = "recipe",
    name = "cladding",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "sand", amount = 5}, --bob glass
        {type = "fluid", name = "niobium-complex", amount = 60}
    },
    results = {
        {type = "item", name = "cladding", amount = 1}
    },
    main_product = "cladding"
}
Data {
    type = "item",
    enabled = "false",
    name = "cladding",
    icon = "__pycoalprocessing__/graphics/icons/cladding.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--PPD
Data {
    type = "recipe",
    name = "ppd",
    category = "chemistry", --bob electrolysis
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "fluid", name = "water", amount = 500}, --Added Bob hydrogen
        {type = "fluid", name = "aromatics", amount = 50}
    },
    results = {
        {type = "item", name = "ppd", amount = 10}
    },
    main_product = "ppd"
}
Data {
    type = "item",
    enabled = "false",
    name = "ppd",
    icon = "__pycoalprocessing__/graphics/icons/ppd.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 500
}

--KEVLAR
Data {
    type = "recipe",
    name = "kevlar",
    category = "chemistry",
    enabled = "false",
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
}
Data {
    type = "item",
    enabled = "false",
    name = "kevlar",
    icon = "__pycoalprocessing__/graphics/icons/kevlar.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--KEVLAR COATING
Data {
    type = "recipe",
    name = "kevlar-coating",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "copper-coating", amount = 1},
        {type = "item", name = "kevlar", amount = 1}
    },
    results = {
        {type = "item", name = "kevlar-coating", amount = 1}
    },
    main_product = "kevlar-coating",
}
Data {
    type = "item",
    enabled = "false",
    name = "kevlar-coating",
    icon = "__pycoalprocessing__/graphics/icons/kevlar-coating.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--NbFe ALLOY
Data {
    type = "recipe",
    name = "nbfe-alloy",
    category = "hpf", --bobs smelting
    enabled = "false",
    energy_required = 4.0,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 15},
        {type = "item", name = "niobium-plate", amount = 3}
    },
    results = {
        {type = "item", name = "nbfe-alloy", amount = 1}
    },
    main_product = "nbfe-alloy"
}
Data {
    type = "item",
    enabled = "false",
    name = "nbfe-alloy",
    icon = "__pycoalprocessing__/graphics/icons/nbfe-alloy.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--NbFe COATING
Data {
    type = "recipe",
    name = "nbfe-coating",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "kevlar-coating", amount = 1},
        {type = "item", name = "nbfe-alloy", amount = 1}
    },
    results = {
        {type = "item", name = "nbfe-coating", amount = 1}
    },
    main_product = "nbfe-coating",
}
Data {
    type = "item",
    enabled = "false",
    name = "nbfe-coating",
    icon = "__pycoalprocessing__/graphics/icons/nbfe-coating.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--ATTACH CLADDING TO GLASS CORE
Data {
    type = "recipe",
    name = "cladded-core",
    category = "advanced-crafting",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "cladding", amount = 1},
        {type = "item", name = "glass-core", amount = 1}
    },
    results = {
        {type = "item", name = "cladded-core", amount = 1}
    },
    main_product = "cladded-core",
}
Data {
    type = "item",
    enabled = "false",
    name = "cladded-core",
    icon = "__pycoalprocessing__/graphics/icons/cladded-core.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--COPPER COATING
Data {
    type = "recipe",
    name = "copper-coating",
    category = "chemistry", --bob electrolysis
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "copper-plate", amount = 10},
        {type = "item", name = "cladded-core", amount = 1},
        {type = "fluid", name = "water-mineralized", amount = 50}
    },
    results = {
        {type = "item", name = "copper-coating", amount = 2}
    },
    main_product = "copper-coating",
}
Data {
    type = "item",
    enabled = "false",
    name = "copper-coating",
    icon = "__pycoalprocessing__/graphics/icons/copper-coating.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--OPTICAL FIBER
Data {
    type = "recipe",
    name = "optical-fiber",
    category = "advanced-crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "plastic-bar", amount = 2},
        {type = "item", name = "nbfe-coating", amount = 1}
    },
    results = {
        {type = "item", name = "optical-fiber", amount = 3}
    },
    main_product = "optical-fiber",
}
Data {
    type = "item",
    enabled = "false",
    name = "optical-fiber",
    icon = "__pycoalprocessing__/graphics/icons/optical-fiber.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--BIOFILM
Data {
    type = "recipe",
    name = "biofilm",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "fawogae-substrate", amount = 20},
        {type = "item", name = "lime", amount = 5},
        {type = "item", name = "organics", amount = 5}
    },
    results = {
        {type = "item", name = "biofilm", amount = 2}
    },
    main_product = "biofilm",
}
Data {
    type = "item",
    enabled = "false",
    name = "biofilm",
    icon = "__pycoalprocessing__/graphics/icons/biofilm.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

--MEDIA FILTER
Data {
    type = "recipe",
    name = "filtration-media",
    category = "crafting",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "item", name = "pure-sand", amount = 30},
        {type = "item", name = "active-carbon", amount = 3},
        {type = "item", name = "gravel", amount = 25}
        --bob add glass
    },
    results = {
        {type = "item", name = "filtration-media", amount = 3}
    },
    main_product = "filtration-media",
}
Data {
    type = "item",
    enabled = "false",
    name = "filtration-media",
    icon = "__pycoalprocessing__/graphics/icons/filtration-media.png",
    flags = {"goes-to-main-inventory"},
    icon_size = 32,
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

-- COAL BRIQUETTE
Data {
    type = "item",
    enabled = "false",
    name = "coal-briquette",
    fuel_value = "180MJ",
    fuel_category = "chemical",
    icon = "__pycoalprocessing__/graphics/icons/coal-briquette.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    --order = "g",
    stack_size = 200
}

-- CALCIUM CARBIDE
Data {
    type = "recipe",
    name = "calcium-carbide",
    category = "hpf",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "item", name = "coke", amount = 10},
        {type = "item", name = "lime", amount = 2}
    },
    results = {
        {type = "item", name = "calcium-carbide", amount = 10}
    },
}
Data {
    type = "item",
    name = "calcium-carbide",
    icon = "__pycoalprocessing__/graphics/icons/calcium-carbide.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 100
}

-- CRUSHED IRON
Data {
    type = "item",
    name = "crushed-iron",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-iron.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- CRUSHED COPPER
Data {
    type = "item",
    name = "crushed-copper",
    enabled = "false",
    icon = "__pycoalprocessing__/graphics/icons/crusher/crushed-copper.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "g",
    stack_size = 1000
}

-- LOG
Data {
    type = "item",
    name = "log",
    enabled = "false",
    fuel_value = "10MJ",
    fuel_category = "chemical",
    icon = "__pycoalprocessing__/graphics/icons/log.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "a2",
    stack_size = 100
}
