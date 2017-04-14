-------------------------------------------------------------------------------
---Make empty canister in assembly machine.
local recipe_canister = {
    type = "recipe",
    name = "empty-gas-canister",
    category = "crafting",
    enabled=false,
    energy_required = 3,
    ingredients = {
        {type="item", name="steel-plate", amount = 2}, --updated-bob aluminium-plate
        {type="item", name="copper-plate", amount = 1}, --updated-bob brass-plate
    },
    results = {
        {type = "item", name = "empty-gas-canister", amount = 1},
    },
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
    subgroup="py-items",
    order = "c [methanol]",
}

local empty_canister = {
    type = "item",
    name = "empty-gas-canister",
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
    flags = {"goes-to-main-inventory"},
    subgroup="py-items",
    order = "canister-a-[empty-gas-canister]",
    stack_size = 20
}

-------------------------------------------------------------------------------
local recipe_fill_canister = {
    type = "recipe",
    name = "fill-methanol-gas-canister",
    localised_name = {"recipe-name.fill-methanol-gas-canister"},
    category = "crafting-with-fluid", --updated-bob bob-pump
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="fluid", name="methanol", amount=10},
        {type="item", name="empty-gas-canister", amount=1},
    },
    results=
    {
        {type="item", name="filled-methanol-gas-canister", amount=1}
    },
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
}

-- empty canister
--duplicate recipe for use directly in rectisol
local recipe_empty_canister = {
    type = "recipe",
    name = "empty-methanol-gas-canister",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 3,
    ingredients ={
        {type="item", name="filled-methanol-gas-canister", amount=1},
    },
    results=
    {
        {type="item", name="empty-gas-canister", amount=1},
        {type="fluid", name="methanol", amount=10},
    },
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
    subgroup="py-items",
    order = "canister-b-[empty-methanol-gas-canister]"
}
-------------------------------------------------------------------------------
--[[Items]]--

local filled_canister = {
    type = "item",
    name = "filled-methanol-gas-canister",
    icon = "__pycoalprocessing__/graphics/icons/canister.png",
    flags = {"goes-to-main-inventory"},
    subgroup="py-items",
    order = "canister-b-[fill-methanol-gas-canister]",
    stack_size = 20
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({empty_canister, filled_canister, recipe_fill_canister, recipe_empty_canister, recipe_canister})
