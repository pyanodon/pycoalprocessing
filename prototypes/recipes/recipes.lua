-------------------------------------------------------------------------------
--[[Recipes without new item results]]--
-------------------------------------------------------------------------------
--Create coal from wood
local raw_wood_to_coal = {
    type = "recipe",
    name = "raw-wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.raw-wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["raw-wood"].icon, tint={a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[raw-wood-to-coal]",
    ingredients = {
        {type="item", name="raw-wood", amount=1}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

local wood_to_coal = {
    type = "recipe",
    name = "wood-to-coal",
    localised_name = {"recipe-name.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    localised_description = {"recipe-description.wood-to-coal", {"item-name.wood"}, {"item-name.coal"}},
    icons = {
        {icon = data.raw.item["coal"].icon},
        {icon = data.raw.item["wood"].icon, tint = {a=.5}}
    },
    enabled = false,
    category = "hpf",
    subgroup = "py-items-hpf",
    order = "hpf-[wood-to-coal]",
    ingredients = {
        {type="item", name="wood", amount=2}
    },
    results = {
        {type="item", name="coal", amount=1}
    },
    energy_required=5
}

-------------------------------------------------------------------------------
--Extract sulfur from acidgas
local extract_sulfur ={
    type = "recipe",
    name = "extract-sulfur",
    category = "desulfurization",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="acidgas", amount=10,},
    },
    results={
        {type="item", name="sulfur", amount=2,},
    },
    main_product= "sulfur",
    icon = data.raw.item.sulfur.icon,
    subgroup = "py-items",
    order = "sulfur",
}

-------------------------------------------------------------------------------
--Turn warm water into cooled water
local cooling_water ={
    type = "recipe",
    name = "cooling-water",
    category = "cooling",
    enabled = "false",
    energy_required = 1,
    ingredients ={
        {type="fluid", name="water", amount=5, temperature=100},
    },
    results={
        {type="fluid", name="water", amount=5, temperature=15},
    },
    main_product= "water",
    subgroup = "py-fluids",
    order = "water",
    icon = "__pycoalprocessing__/graphics/icons/cooling-water.png",
}

-------------------------------------------------------------------------------
local fluegas_to_syngas ={
    type = "recipe",
    name = "fluegas_to_syngas",
    category = "carbonfilter",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="flue-gas", amount=300},
        {type="item", name="active-carbon", amount=5},

    },
    results={
        {type="fluid", name="syngas", amount=30},
    },
    subgroup = "py-syngas",
    order = "fluegas_to_syngas",
    icon = "__pycoalprocessing__/graphics/icons/fluegas_to_syngas.png",
}

data:extend({raw_wood_to_coal, wood_to_coal, extract_sulfur, cooling_water, fluegas_to_syngas})
