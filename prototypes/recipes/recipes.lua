RECIPE {
    type = "recipe",
    name = "making-chromium",
    category = "hpf",
    enabled = false,
    energy_required = 5.5,
    ingredients = {
        {type = "fluid", name = "carbon-dioxide", amount = 150},
        {type = "item", name = "chromite-sand", amount = 15},
        {type = "item", name = "coke", amount = 5},
        {type = "item", name = "limestone", amount = 3}
    },
    results = {
        {type = "item", name = "chromium", amount = 5}
    },
    main_product = "chromium",
    icon = "__pycoalprocessing__/graphics/icons/chromium.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "a"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "raw-wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon, icon_size = 32},
        {icon = data.raw.item["raw-wood"].icon, tint = {a = .5}, icon_size = 32}
    },
    icon_size = 32,
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "b",
    ingredients = {
        {type = "item", name = "raw-wood", amount = 10}
    },
    results = {
        {type = "item", name = "coal", amount = 10}
    },
    energy_required = 3
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon, icon_size = 32},
        {icon = data.raw.item["wood"].icon, tint = {a = .5}, icon_size = 32}
    },
    icon_size = 32,
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "c",
    ingredients = {
        {type = "item", name = "wood", amount = 2}
    },
    results = {
        {type = "item", name = "coal", amount = 1}
    },
    energy_required = 0.5
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "extract-sulfur",
    category = "desulfurization",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "acidgas", amount = 100}
    },
    results = {
        {type = "item", name = "sulfur", amount = 2}
    },
    main_product = "sulfur",
    icon = data.raw.item.sulfur.icon,
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "a"
}

RECIPE {
    type = "recipe",
    name = "cooling-water",
    hidden = true,
    category = "cooling",
    enabled = "false",
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
}:add_unlock('cooling-tower-1')

RECIPE {
    type = "recipe",
    name = "fluegas_to-syngas",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "coarse-classification",
    category = "classifier",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "sand-classification",
    category = "classifier",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "soil-separation",
    category = "solid-separator",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "richdust-separation",
    category = "solid-separator",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "rich-dust", amount = 25}
    },
    results = {
        {type = "item", name = "iron-oxide", amount = 2},
        {type = "item", name = "chromite-sand", amount = 10}
    },
    main_product = "chromite-sand",
    icon = "__pycoalprocessing__/graphics/icons/richdust-separation.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "f"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "tailings-separation",
    category = "solid-separator",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "sand-washing",
    category = "washer",
    enabled = "true",
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
    name = "organics-processing",
    category = "gasifier",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "organics", amount = 10},
        {type = "item", name = "nexelit-plate", amount = 5}
    },
    results = {
        {type = "fluid", name = "methanol", amount = 100},
        {type = "fluid", name = "syngas", amount = 100}
    },
    main_product = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    icon_size = 32,
    subgroup = "py-methanol",
    order = "d"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "sand-casting",
    category = "tar",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "sand", amount = 5},
        {type = "fluid", name = "creosote", amount = 20}
    },
    results = {
        {type = "item", name = "sand-casting", amount = 2}
    },
    main_product = "sand-casting",
    icon = "__pycoalprocessing__/graphics/icons/sand-casting.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "tar-oil",
    category = "tar",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "nexelit-plate", amount = 2},
        {type = "fluid", name = "tar", amount = 500}
    },
    results = {
        {type = "fluid", name = "crude-oil", amount = 300}
    },
    main_product = "crude-oil",
    icon = "__pycoalprocessing__/graphics/icons/tar-oil.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "air-pollution",
    category = "co2",
    enabled = "false",
    energy_required = 40,
    ingredients = {
        {type = "item", name = "nexelit-cartridge", amount = 1}
    },
    results = {
        {type = "item", name = "saturated-nexelit-cartridge", amount = 1}
    },
    main_product = "saturated-nexelit-cartridge",
    icon = "__pycoalprocessing__/graphics/icons/co2-absorber-icon.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "d"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "slacked-lime",
    category = "chemistry",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "lime", amount = 5},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "fluid", name = "slacked-lime", amount = 150}
    },
    main_product = "slacked-lime",
    icon = "__pycoalprocessing__/graphics/icons/slacked-lime.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "e"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "co2",
    category = "hpf",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "saturated-nexelit-cartridge", amount = 1},
        {type = "fluid", name = "slacked-lime", amount = 100},
        {type = "item", name = "active-carbon", amount = 2}
    },
    results = {
        {type = "fluid", name = "carbon-dioxide", amount = 400},
        {type = "item", name = "ash", amount = 10}
    },
    main_product = "carbon-dioxide",
    icon = "__pycoalprocessing__/graphics/icons/co2.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "d"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "fawogae-substrate",
    category = "crafting",
    enabled = "true",
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
    name = "water-mineralized",
    category = "washer",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "coarse", amount = 50},
        {type = "fluid", name = "water", amount = 300}
    },
    results = {
        {type = "item", name = "stone", amount = 4},
        {type = "fluid", name = "water-mineralized", amount = 250}
    },
    main_product = "water-mineralized",
    icon = "__pycoalprocessing__/graphics/icons/coarse-washer.png",
    icon_size = 32,
    subgroup = "py-washer",
    order = "b"
}

RECIPE {
    type = "recipe",
    name = "flask",
    enabled = "true",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 8},
        --{type="item", name="glass", amount=8}, --updated bob add glass
        {type = "item", name = "raw-wood", amount = 5}
    },
    results = {
      {"flask", 1}
    },
    icon = "__pycoalprocessing__/graphics/icons/flask.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "science-pack-1",
    enabled = "true",
    energy_required = 4,
    ingredients = {
        {type = "item", name = "fawogae-substrate", amount = 10},
        {type = "item", name = "flask", amount = 2}
    },
    results = {
        {type = "item", name = "science-pack-1", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/science-pack-1.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a1"
}

RECIPE {
    type = "recipe",
    name = "science-pack-2",
    enabled = "false",
    energy_required = 4,
    ingredients = {
        {type = "item", name = "lab-instrument", amount = 1},
        {type = "item", name = "alien-sample01", amount = 2}
    },
    results = {
        {type = "item", name = "science-pack-2", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/science-pack-2.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a2"
}

RECIPE {
    type = "recipe",
    name = "science-pack-3",
    enabled = "false",
    energy_required = 4.5,
    ingredients = {
        {type = "item", name = "optical-fiber", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 1},
        {type = "item", name = "copper-cable", amount = 8}, --bob insulated-cable
        {type = "item", name = "iron-plate", amount = 10}
    },
    results = {
        {type = "item", name = "science-pack-3", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/science-pack-3.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a3"
}

RECIPE {
    type = "recipe",
    name = "soil-washing",
    category = "washer",
    enabled = "true",
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
    name = "bonemeal",
    category = "ulric",
    enabled = "false",
    energy_required = 45,
    ingredients = {
        {type = "item", name = "ralesia", amount = 10}
    },
    results = {
        {type = "item", name = "bonemeal", amount = 5}
    },
    main_product = "bonemeal",
    icon = "__pycoalprocessing__/graphics/icons/bonemeal.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "g"
}

RECIPE {
    type = "recipe",
    name = "raw-borax",
    category = "borax",
    enabled = "false",
    energy_required = 4.5,
    ingredients = {
        {type = "fluid", name = "syngas", amount = 150}
    },
    results = {
        {type = "item", name = "raw-borax", amount = 5}
    },
    main_product = "raw-borax",
    icon = "__pycoalprocessing__/graphics/icons/raw-borax.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "h"
}

RECIPE {
    type = "recipe",
    name = "borax-washing",
    category = "washer",
    enabled = "false",
    energy_required = 7.0,
    ingredients = {
        {type = "fluid", name = "water", amount = 150},
        {type = "item", name = "raw-borax", amount = 10}
    },
    results = {
        {type = "item", name = "borax", amount = 4},
        {type = "fluid", name = "dirty-water", amount = 100}
    },
    main_product = "borax",
    icon = "__pycoalprocessing__/graphics/icons/borax-washer.png",
    icon_size = 32,
    subgroup = "py-washer",
    order = "d"
}

RECIPE {
    type = "recipe",
    name = "ralesia",
    category = "ralesia",
    enabled = "false",
    energy_required = 7.7,
    ingredients = {
        {type = "fluid", name = "water", amount = 300}, --bob hydrogen
        {type = "item", name = "soil", amount = 35}
    },
    results = {
        {type = "item", name = "ralesia", amount = 10}
    },
    main_product = "ralesia",
    icon = "__pycoalprocessing__/graphics/icons/ralesia.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "h"
}

RECIPE {
    type = "recipe",
    name = "ralesia-seeds",
    category = "crafting",
    enabled = "false",
    energy_required = 5.5,
    ingredients = {
        {type = "item", name = "ralesia", amount = 5}
    },
    results = {
        {type = "item", name = "ralesia-seeds", amount = 8}
    },
    main_product = "ralesia-seeds",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-seeds.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "i"
}

RECIPE {
    type = "recipe",
    name = "rich-clay",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 6,
    ingredients = {
        {type = "item", name = "ash", amount = 25},
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "rich-clay", amount = 10}
    },
    main_product = "rich-clay",
    icon = "__pycoalprocessing__/graphics/icons/rich-clay.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "j"
}

RECIPE {
    type = "recipe",
    name = "ground-sample01",
    category = "crafting",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        {type = "item", name = "rich-clay", amount = 5},
        {type = "item", name = "soil", amount = 10}
    },
    results = {
        {type = "item", name = "ground-sample01", amount = 10}
    },
    main_product = "ground-sample01",
    icon = "__pycoalprocessing__/graphics/icons/ground-sample01.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "k"
}

RECIPE {
    type = "recipe",
    name = "bio-sample01",
    category = "crafting",
    enabled = "false",
    energy_required = 6,
    ingredients = {
        {type = "item", name = "ralesia-seeds", amount = 18},
        {type = "item", name = "bonemeal", amount = 10}
    },
    results = {
        {type = "item", name = "bio-sample01", amount = 4}
    },
    main_product = "bio-sample01",
    icon = "__pycoalprocessing__/graphics/icons/bio-sample01.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "l"
}

RECIPE {
    type = "recipe",
    name = "alien-sample01",
    category = "crafting",
    enabled = "false",
    energy_required = 10,
    ingredients = {
        {type = "item", name = "bio-sample01", amount = 4},
        {type = "item", name = "ground-sample01", amount = 15}
    },
    results = {
        {type = "item", name = "alien-sample01", amount = 4}
    },
    main_product = "alien-sample01",
    icon = "__pycoalprocessing__/graphics/icons/alien-sample01.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "m"
}

RECIPE {
    type = "recipe",
    name = "equipment-chassi",
    category = "crafting",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "iron-plate", amount = 4},
        {type = "item", name = "copper-plate", amount = 10} --bob bronze-alloy
    },
    results = {
        {type = "item", name = "equipment-chassi", amount = 2}
    },
    main_product = "equipment-chassi",
    icon = "__pycoalprocessing__/graphics/icons/equipment-chassi.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "n"
}

RECIPE {
    type = "recipe",
    name = "lab-instrument",
    category = "crafting",
    enabled = "false",
    energy_required = 7,
    ingredients = {
        {type = "item", name = "lens", amount = 3},
        {type = "item", name = "equipment-chassi", amount = 2}
    },
    results = {
        {type = "item", name = "lab-instrument", amount = 2}
    },
    main_product = "lab-instrument",
    icon = "__pycoalprocessing__/graphics/icons/lab-instrument.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "o"
}

RECIPE {
    type = "recipe",
    name = "boron-trioxide",
    category = "hpf",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "boric-acid", amount = 200},
        {type = "item", name = "coke", amount = 1}
    },
    results = {
        {type = "item", name = "boron-trioxide", amount = 1}
    },
    main_product = "boron-trioxide",
    icon = "__pycoalprocessing__/graphics/icons/boron-trioxide.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "e"
}

RECIPE {
    type = "recipe",
    name = "lens",
    category = "hpf",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "item", name = "stone", amount = 10}, --bob glass
        {type = "item", name = "boron-trioxide", amount = 1}
    },
    results = {
        {type = "item", name = "lens", amount = 3}
    },
    main_product = "lens",
    icon = "__pycoalprocessing__/graphics/icons/lens.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "oleochemicals",
    category = "fts-reactor",
    enabled = "false",
    energy_required = 10,
    ingredients = {
        {type = "item", name = "mukmoux-fat", amount = 20},
        {type = "item", name = "nichrome", amount = 2},
        {type = "fluid", name = "water", amount = 2000}
    },
    results = {
        {type = "fluid", name = "oleochemicals", amount = 150},
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "steam", amount = 2000, temperature = 60}
    },
    main_product = "oleochemicals",
    icon = "__pycoalprocessing__/graphics/icons/oleochemicals.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "c"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "organic-solvent",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "active-carbon", amount = 5},
        {type = "item", name = "bonemeal", amount = 15},
        {type = "fluid", name = "aromatics", amount = 200}
    },
    results = {
        {type = "fluid", name = "organic-solvent", amount = 400}
    },
    main_product = "organic-solvent",
    icon = "__pycoalprocessing__/graphics/icons/organic-solvent.png",
    icon_size = 32,
    subgroup = "py-fluids",
    order = "c"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "co2-organics",
    category = "hpf",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "organics", amount = 10}
    },
    results = {
        {type = "fluid", name = "carbon-dioxide", amount = 400}
    },
    main_product = "carbon-dioxide",
    icon = "__pycoalprocessing__/graphics/icons/carbon-dioxide.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "f"
}

RECIPE {
    type = "recipe",
    name = "aromatic-organic",
    category = "gasifier",
    enabled = "false",
    energy_required = 2.8,
    ingredients = {
        {type = "item", name = "fawogae", amount = 20},
        {type = "item", name = "ralesia", amount = 5}
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 200}
    },
    main_product = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/aromatics.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "r"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "petgas-methanol",
    category = "fluid-separator",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "organic-solvent", amount = 100},
        {type = "fluid", name = "olefin", amount = 100}
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "fluid", name = "methanol", amount = 100}
    },
    main_product = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/petgas-methanol.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "c"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "oleo-heavy",
    category = "fluid-separator",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 100},
        {type = "fluid", name = "sulfuric-acid", amount = 200}
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 150},
        {type = "fluid", name = "flue-gas", amount = 500},
        {type = "item", name = "sulfur", amount = 5}
    },
    main_product = "heavy-oil",
    icon = "__pycoalprocessing__/graphics/icons/oleo-heavy.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "d"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "bone-solvent",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "dirty-acid",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "filtration-dirty-water",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "olefin-filtration",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "coalgas-syngas",
    category = "desulfurization",
    enabled = "false",
    energy_required = 5.5,
    ingredients = {
        {type = "item", name = "active-carbon", amount = 3},
        {type = "fluid", name = "coal-gas", amount = 300}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 150},
        {type = "item", name = "sulfur", amount = 5},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/syngas.png",
    icon_size = 32,
    subgroup = "py-syngas",
    order = "b"
}

RECIPE {
    type = "recipe",
    name = "oleochemicals-crude-oil",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "coal-dust",
    category = "ball-mill",
    enabled = "false",
    energy_required = 4.0,
    ingredients = {
        {type = "item", name = "coal", amount = 5}
    },
    results = {
        {type = "item", name = "coal-dust", amount = 10}
    },
    main_product = "coal-dust",
    icon = "__pycoalprocessing__/graphics/icons/coal_dust.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "r"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "sand-brick",
    category = "crafting",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "sand", amount = 30},
        {type = "item", name = "rich-clay", amount = 35}
    },
    results = {
        {type = "item", name = "stone-brick", amount = 3}
    },
    main_product = "stone-brick",
    icon = "__base__/graphics/icons/stone-brick.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "s"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "tailings-classification",
    category = "classifier",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "item", name = "tailings-dust", amount = 15}
    },
    results = {
        {type = "item", name = "coal-dust", amount = 5},
        {type = "item", name = "copper-ore", amount = 5}, --bob lead-ore
        {type = "item", name = "iron-ore", amount = 3} --bob tin-ore
    },
    main_product = "coal-dust",
    icon = "__pycoalprocessing__/graphics/icons/class-tailings.png",
    icon_size = 32,
    subgroup = "py-items-class",
    order = "c"
}

RECIPE {
    type = "recipe",
    name = "tar-distilation",
    category = "distilator",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "fluid", name = "tar", amount = 350}
    },
    results = {
        {type = "fluid", name = "flue-gas", amount = 500},
        {type = "fluid", name = "carbon-dioxide", amount = 100},
        {type = "fluid", name = "aromatics", amount = 100},
        {type = "item", name = "rich-clay", amount = 10}
    },
    main_product = "carbon-dioxide",
    icon = "__pycoalprocessing__/graphics/icons/tar-distilation.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "t"
}

RECIPE {
    type = "recipe",
    name = "oleochemicals-distilation",
    category = "distilator",
    enabled = "false",
    energy_required = 2.5,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 250},
        {type = "fluid", name = "water", amount = 400} --bob oxygen
    },
    results = {
        {type = "fluid", name = "syngas", amount = 500},
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "fluid", name = "acidgas", amount = 100},
        {type = "item", name = "coal", amount = 10}
    },
    main_product = "syngas",
    icon = "__pycoalprocessing__/graphics/icons/oleochemicals-distilation.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "i"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "tar-gasification",
    category = "gasifier",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "tar", amount = 250},
        {type = "fluid", name = "water", amount = 600} --bob liquid-air
    },
    results = {
        {type = "fluid", name = "coal-gas", amount = 200},
        {type = "fluid", name = "flue-gas", amount = 400},
        {type = "item", name = "ash", amount = 3}
    },
    main_product = "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/tar-gasification.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "j"
}

RECIPE {
    type = "recipe",
    name = "oleo-gasification",
    category = "gasifier",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 200},
        {type = "fluid", name = "syngas", amount = 200},
        {type = "fluid", name = "water", amount = 250} --bob oxygen
    },
    results = {
        {type = "fluid", name = "aromatics", amount = 200},
        {type = "fluid", name = "tar", amount = 300}
    },
    main_product = "aromatics",
    icon = "__pycoalprocessing__/graphics/icons/oleo-gasification.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "k"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "coal-fawogae",
    category = "hpf",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "item", name = "fawogae", amount = 10}
    },
    results = {
        {type = "item", name = "coal", amount = 10}
    },
    main_product = "coal",
    icon = "__pycoalprocessing__/graphics/icons/coal-fawogae.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "g"
}

RECIPE {
    type = "recipe",
    name = "remud-dirty-water",
    category = "chemistry",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 250},
        {type = "fluid", name = "slacked-lime", amount = 100}
    },
    results = {
        {type = "fluid", name = "rare-earth-mud", amount = 50}
    },
    main_product = "rare-earth-mud",
    icon = "__pycoalprocessing__/graphics/icons/remud-dirty-water.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "l"
}

RECIPE {
    type = "recipe",
    name = "rich-re",
    category = "evaporator",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "rare-earth-mud", amount = 150}
    },
    results = {
        {type = "item", name = "rich-dust", amount = 5},
        {type = "fluid", name = "flue-gas", amount = 100}
    },
    main_product = "rich-dust",
    icon = "__pycoalprocessing__/graphics/icons/rich-re.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "u"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "eva-ree-dust",
    category = "evaporator",
    enabled = "false",
    energy_required = 3.0,
    ingredients = {
        {type = "fluid", name = "rare-earth-mud", amount = 250}
    },
    results = {
        {type = "item", name = "rare-earth-dust", amount = 10},
        {type = "fluid", name = "flue-gas", amount = 200}
    },
    main_product = "rare-earth-dust",
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "crushed-iron",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-iron", 1}},
    results = {
      {"iron-plate", 1}
    },
    result_count = 2
}:add_unlock("crusher")

RECIPE {
    type = "recipe",
    name = "crushed-copper",
    category = "smelting",
    enabled = "false",
    energy_required = 3.5,
    ingredients = {{"crushed-copper", 1}},
    results = {
      {"copper-plate", 1}
    },
    result_count = 2
}:add_unlock("crusher")

RECIPE {
    type = "recipe",
    name = "sulfur-crudeoil",
    category = "desulfurization",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "crude-oil", amount = 400},
        {type = "item", name = "iron-ore", amount = 100} --bob salt
    },
    results = {
        {type = "fluid", name = "heavy-oil", amount = 300},
        {type = "item", name = "sulfur", amount = 10},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "b"
}

RECIPE {
    type = "recipe",
    name = "sulfur-heavyoil",
    category = "desulfurization",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "heavy-oil", amount = 300}
    },
    results = {
        {type = "fluid", name = "light-oil", amount = 200},
        {type = "item", name = "sulfur", amount = 5},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "c"
}

RECIPE {
    type = "recipe",
    name = "sulfur-lightoil",
    category = "desulfurization",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "light-oil", amount = 200}
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 100},
        {type = "item", name = "sulfur", amount = 3},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "d"
}

RECIPE {
    type = "recipe",
    name = "sulfur-petgas",
    category = "desulfurization",
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "petroleum-gas", amount = 100}
    },
    results = {
        {type = "fluid", name = "syngas", amount = 50},
        {type = "item", name = "sulfur", amount = 1},
        {type = "item", name = "ash", amount = 1}
    },
    main_product = "sulfur",
    icon = "__base__/graphics/icons/sulfur.png",
    icon_size = 32,
    subgroup = "py-sulfur",
    order = "e"
}

RECIPE {
    type = "recipe",
    name = "organics-from-wood",
    category = "crafting",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "raw-wood", amount = 20}
    },
    results = {
        {type = "item", name = "organics", amount = 20}
    },
    main_product = "organics",
    icon = "__pycoalprocessing__/graphics/icons/organics.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "v"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "creosote-to-aromatics",
    category = "tar",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "aromatics-to-lubricant",
    category = "desulfurization",
    enabled = "false",
    energy_required = 5,
    ingredients = {
        {type = "fluid", name = "aromatics", amount = 150}
    },
    results = {
        {type = "fluid", name = "lubricant", amount = 100},
        {type = "item", name = "sulfur", amount = 1}
    },
    main_product = "lubricant",
    icon = "__pycoalprocessing__/graphics/icons/aromatics-lubricant.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "n"
}

RECIPE {
    type = "recipe",
    name = "aromatics-to-rubber",
    category = "methanol",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "aromatics-to-plastic",
    category = "methanol",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "nas-battery",
    category = "advanced-crafting",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "coke-coal",
    category = "hpf",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "coal", amount = 5}
    },
    results = {
        {type = "item", name = "coke", amount = 5}
    },
    main_product = "coke",
    icon = "__pycoalprocessing__/graphics/icons/coke.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "h"
}

RECIPE {
    type = "recipe",
    name = "stone-distilation",
    category = "distilator",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "stone", amount = 50},
        {type = "fluid", name = "water", amount = 200}
    },
    results = {
        {type = "item", name = "tailings-dust", amount = 30},
        {type = "item", name = "coarse", amount = 15},
        {type = "fluid", name = "tar", amount = 500},
        {type = "fluid", name = "rare-earth-mud", amount = 30},
        {type = "fluid", name = "dirty-water", amount = 100}
    },
    main_product = "tar",
    icon = "__pycoalprocessing__/graphics/icons/tar.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "z"
}

RECIPE {
    type = "recipe",
    name = "oleo-solidfuel",
    category = "methanol",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "oleochemicals", amount = 20}
    },
    results = {
        {type = "item", name = "solid-fuel", amount = 1}
    },
    main_product = "solid-fuel",
    icon = "__pycoalprocessing__/graphics/icons/oleo-solid-fuel.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "c"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "glycerol-hydrogen",
    category = "chemistry", --bob electrolysis
    enabled = "false",
    energy_required = 3,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 20},
        {type = "fluid", name = "water", amount = 200} --bob liquid-air
    },
    results = {
        {type = "fluid", name = "petroleum-gas", amount = 300} --bob hydrogen
    },
    icon = "__pycoalprocessing__/graphics/icons/glycerol-hydrogen.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "o"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "log1",
    category = "nursery",
    enabled = "false",
    energy_required = 80,
    ingredients = {},
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c6"
}

RECIPE {
    type = "recipe",
    name = "log2",
    category = "nursery",
    enabled = "false",
    energy_required = 60,
    ingredients = {
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log2.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c7"
}

RECIPE {
    type = "recipe",
    name = "log3",
    category = "nursery",
    enabled = "false",
    energy_required = 40,
    ingredients = {
        {type = "fluid", name = "water", amount = 500},
        {type = "item", name = "ash", amount = 30}
    },
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log3.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c8"
}

RECIPE {
    type = "recipe",
    name = "log4",
    category = "nursery",
    enabled = "false",
    energy_required = 30,
    ingredients = {
        {type = "fluid", name = "water", amount = 500},
        {type = "fluid", name = "carbon-dioxide", amount = 300}
    },
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log4.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c9"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "log5",
    category = "nursery",
    enabled = "false",
    energy_required = 20,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 500},
        {type = "fluid", name = "carbon-dioxide", amount = 300}
    },
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log5.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c9"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "log6",
    category = "nursery",
    enabled = "false",
    energy_required = 15,
    ingredients = {
        {type = "fluid", name = "dirty-water", amount = 500},
        {type = "item", name = "ash", amount = 30},
        {type = "fluid", name = "carbon-dioxide", amount = 350}
    },
    results = {
        {type = "item", name = "log", amount = 3}
    },
    icon = "__pycoalprocessing__/graphics/icons/log5.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "c9"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "log-wood",
    category = "wpu",
    enabled = "false",
    energy_required = 8,
    ingredients = {
        {type = "item", name = "log", amount = 1}
    },
    results = {
        {type = "item", name = "raw-wood", amount = 5}
    },
    icon = data.raw.item["raw-wood"].icon,
    icon_size = 32,
    subgroup = "py-items",
    order = "a7"
}

RECIPE {
    type = "recipe",
    name = "log-organics",
    category = "wpu",
    enabled = "false",
    energy_required = 10,
    ingredients = {
        {type = "item", name = "log", amount = 1}
    },
    results = {
        {type = "item", name = "organics", amount = 50}
    },
    icon = "__pycoalprocessing__/graphics/icons/organics.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a8"
}:add_unlock("coal-processing-2")

RECIPE {
    type = "recipe",
    name = "raw-to-wood",
    category = "wpu",
    enabled = "true",
    energy_required = 5,
    ingredients = {
        {type = "item", name = "raw-wood", amount = 1}
    },
    results = {
        {type = "item", name = "wood", amount = 2}
    },
    icon = data.raw.item["wood"].icon,
    icon_size = 32,
    subgroup = "py-items",
    order = "a8"
}

RECIPE {
    type = "recipe",
    name = "ash-separation",
    category = "solid-separator",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "fluegas-filtration",
    category = "carbonfilter",
    enabled = "false",
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
}

RECIPE {
    type = "recipe",
    name = "coaldust-ash",
    category = "hpf",
    enabled = "false",
    energy_required = 1,
    ingredients = {
        {type = "item", name = "coal-dust", amount = 50}
    },
    results = {
        {type = "item", name = "ash", amount = 1}
    },
    icon = "__pycoalprocessing__/graphics/icons/ash.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "g"
}:add_unlock("coal-processing-3")

RECIPE {
    type = "recipe",
    name = "explosive-glycerol",
    category = "chemistry",
    enabled = "false",
    energy_required = 2.0,
    ingredients = {
        {type = "fluid", name = "glycerol", amount = 100},
        {type = "fluid", name = "sulfuric-acid", amount = 150}
    },
    results = {
        {type = "item", name = "explosives", amount = 5}
    },
    main_product = "explosives",
    icon = "__base__/graphics/icons/explosives.png",
    icon_size = 32,
    subgroup = "py-items",
    order = "a [coal-gas]"
}
