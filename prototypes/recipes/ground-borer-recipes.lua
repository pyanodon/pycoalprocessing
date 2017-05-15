--NEXELIT
local mining_nexelit ={
    type = "recipe",
    name = "mining-nexelit",
    category = "ground-borer",
    enabled = "false",
    energy_required = 0.75,
    ingredients ={
        {type="fluid", name="lubricant", amount=20,},
        {type="fluid", name="coal-gas", amount=10,},
        {type="item", name="drill-head", amount=3,},
    },
    results={
        {type="item", name="nexelit-ore", amount=15,},
    },
    main_product= "nexelit-ore",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-nexelit.png",
    order = "g [coal-processing]",
}
--STONE
local mining_stone ={
    type = "recipe",
    name = "mining-stone",
    category = "ground-borer",
    enabled = "false",
    energy_required = 1.2,
    ingredients ={
        {type="fluid", name="lubricant", amount=20,},
        {type="fluid", name="coal-gas", amount=10,},
        {type="item", name="drill-head", amount=3,},
    },
    results={
        {type="item", name="stone", amount=15,},
    },
    main_product= "stone",
    icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-stone.png",
    order = "g [coal-processing]",
}
data:extend{mining_nexelit, mining_stone}

if bobmods then

    --BAUXITE
    local mining_bauxite ={
        type = "recipe",
        name = "mining-bauxite",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="bauxite-ore", amount=10,},
        },
        main_product= "bauxite-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-bauxite.png",
        order = "g [coal-processing]",
    }
    --COBALT
    local mining_cobalt ={
        type = "recipe",
        name = "mining-cobalt",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="cobalt-ore", amount=10,},
        },
        main_product= "cobalt-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-cobalt.png",
        order = "g [coal-processing]",
    }
    --GOLD
    local mining_gold ={
        type = "recipe",
        name = "mining-gold",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="gold-ore", amount=10,},
        },
        main_product= "gold-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-gold.png",
        order = "g [coal-processing]",
    }
    --LEAD
    local mining_lead ={
        type = "recipe",
        name = "mining-lead",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="lead-ore", amount=10,},
        },
        main_product= "lead-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-lead.png",
        order = "g [coal-processing]",
    }
    --NICKEL
    local mining_nickel ={
        type = "recipe",
        name = "mining-nickel",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="nickel-ore", amount=10,},
        },
        main_product= "nickel-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-nickel.png",
        order = "g [coal-processing]",
    }
    --QUARTZ
    local mining_quartz ={
        type = "recipe",
        name = "mining-quartz",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="quartz", amount=10,},
        },
        main_product= "quartz",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-quartz.png",
        order = "g [coal-processing]",
    }
    --RUTILE
    local mining_rutile ={
        type = "recipe",
        name = "mining-rutile",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="rutile-ore", amount=10,},
        },
        main_product= "rutile-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-rutile.png",
        order = "g [coal-processing]",
    }
    --SILVER
    local mining_silver ={
        type = "recipe",
        name = "mining-silver",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="silver-ore", amount=10,},
        },
        main_product= "silver-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-silver.png",
        order = "g [coal-processing]",
    }
    --TIN
    local mining_tin ={
        type = "recipe",
        name = "mining-tin",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="tin-ore", amount=10,},
        },
        main_product= "tin-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-tin.png",
        order = "g [coal-processing]",
    }
    --TUNGSTEN
    local mining_tungsten ={
        type = "recipe",
        name = "mining-tungsten",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="tungsten-ore", amount=10,},
        },
        main_product= "tungsten-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-tungsten.png",
        order = "g [coal-processing]",
    }
    --ZINC
    local mining_zinc ={
        type = "recipe",
        name = "mining-zinc",
        category = "ground-borer",
        enabled = "false",
        energy_required = 1.2,
        ingredients ={
            {type="fluid", name="lubricant", amount=20,},
            {type="fluid", name="coal-gas", amount=10,},
            {type="item", name="drill-head", amount=3,},
        },
        results={
            {type="item", name="zinc-ore", amount=10,},
        },
        main_product= "zinc-ore",
        icon = "__pycoalprocessing__/graphics/icons/drilling/drilling-zinc.png",
        order = "g [coal-processing]",
    }

    data:extend{
        mining_bauxite,
        mining_cobalt,
        mining_gold,
        mining_lead,
        mining_nickel,
        mining_quartz,
        mining_rutile,
        mining_silver,
        mining_tin,
        mining_tungsten,
        mining_zinc
    }
end
