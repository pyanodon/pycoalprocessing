---Make empty canister in assembly machine.
RECIPE {
    type = "recipe",
    name = "empty-gas-canister",
    category = "crafting",
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = "item", name = "steel-plate",  amount = 2}, --bob aluminium-plate
        {type = "item", name = "copper-plate", amount = 1}  --bob brass-plate
    },
    results = {
        {type = "item", name = "empty-gas-canister", amount = 1}
    },
    icons = {{
        icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
        icon_size = 32,
        tint = {r = 0.5, g = 0.5, b = 0.5}
    }},
    subgroup = "py-items",
    order = "c [methanol]"
}:add_unlock("methanol-processing-1")

if mods.pyrawores then
    RECIPE("empty-gas-canister"):replace_ingredient_unsafe("steel-plate", "aluminium-plate")
end

ITEM {
    type = "item",
    name = "empty-gas-canister",
    icons = {{
        icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
        icon_size = 32,
        tint = {r = 0.5, g = 0.5, b = 0.5}
    }},
    flags = {},
    subgroup = "py-items",
    order = "canister-a-[empty-gas-canister]",
    stack_size = 20
}

RECIPE {
    type = "recipe",
    name = "fill-methanol-gas-canister",
    localised_name = {"recipe-name.fill-methanol-gas-canister"},
    category = "crafting-with-fluid", --bob bob-pump
    enabled = false,
    energy_required = 0.2,
    ingredients = {
        {type = "fluid", name = "methanol",           amount = 100},
        {type = "item",  name = "empty-gas-canister", amount = 1}
    },
    results = {
        {type = "item", name = "methanol-gas-canister", amount = 1}
    },
    icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
    icon_size = 32
}:add_unlock("methanol-processing-1")

-- empty canister
--duplicate recipe for use directly in rectisol
RECIPE {
    type = "recipe",
    name = "empty-methanol-gas-canister",
    category = "crafting-with-fluid",
    enabled = false,
    energy_required = 0.2,
    ingredients = {
        {type = "item", name = "methanol-gas-canister", amount = 1}
    },
    results = {
        {type = "item",  name = "empty-gas-canister", amount = 1},
        {type = "fluid", name = "methanol",           amount = 100}
    },
    icons = {{
        icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
        icon_size = 32,
        tint = {r = 0.5, g = 0.5, b = 0.5}
    }},
    subgroup = "py-items",
    order = "canister-b-[empty-methanol-gas-canister]"
}:add_unlock("methanol-processing-1")

ITEM {
    type = "item",
    name = "methanol-gas-canister",
    icon = "__pycoalprocessinggraphics__/graphics/icons/canister.png",
    icon_size = 32,
    flags = {},
    subgroup = "py-items",
    order = "canister-b-[fill-methanol-gas-canister]",
    stack_size = 20
}
