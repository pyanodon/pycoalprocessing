-------------------------------------------------------------------------------
--[[Recipes without new item results]]--
-------------------------------------------------------------------------------
local raw_wood_to_coal = {
    type = "recipe",
    name = "wood-to-coal",
    category = "hpf",
    subgroup = "py-items",
    order = "hpf-[raw-wood-to-coal]",
    ingredients = {
        {type="item", name="raw-wood", count=1}
    },
    results = {
        {type="item", name="coal", count=1}
    },
    energy_required=5
}

local wood_to_coal = {
    type = "recipe",
    name = "wood-to-coal",
    category = "hpf",
    subgroup = "py-items",
    order = "hpf-[wood-to-coal]",
    ingredients = {
        {type="item", name="wood", count=2}
    },
    results = {
        {type="item", name="coal", count=1}
    },
    energy_required=5
}
