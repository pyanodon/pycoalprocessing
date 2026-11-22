RECIPE {
    type = "recipe",
    name = "mukmoux-fat",
    category = "mukmoux",
    enabled = false,
    energy_required = 60,
    ingredients = {
        {type = "item", name = "fawogae",       amount = 5},
        {type = "item", name = "ralesia-seeds", amount = 30}
    },
    results = {
        {type = "item", name = "mukmoux-fat", amount = 15}
    },
    main_product = "mukmoux-fat"
}:add_unlock("mukmoux")

RECIPE {
    type = "recipe",
    name = "oleochemicals",
    category = "fts-reactor",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item",  name = "mukmoux-fat", amount = 20},
        {type = "item",  name = "nichrome",    amount = 1},
        {type = "fluid", name = "water",       amount = 2000}
    },
    results = {
        {type = "fluid", name = "oleochemicals", amount = 300},
        {type = "fluid", name = "glycerol",      amount = 150},
        {type = "fluid", name = "steam",         amount = 2000, temperature = 150, ignored_by_productivity = 2000}
    },
    main_product = "oleochemicals",
    icon = "__pycoalprocessinggraphics__/graphics/icons/oleochemicals.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "c"
}:add_unlock("mukmoux")

RECIPE {
    type = "recipe",
    name = "dedicated-oleochemicals",
    category = "fts-reactor",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "item",  name = "mukmoux-fat", amount = 20},
        {type = "item",  name = "chromium",    amount = 2},
        {type = "fluid", name = "water",       amount = 2000}
    },
    results = {
        {type = "fluid", name = "oleochemicals", amount = 250},
        {type = "fluid", name = "steam",         amount = 2000, temperature = 150, ignored_by_productivity = 2000}
    },
    main_product = "oleochemicals",
    icon = "__pycoalprocessinggraphics__/graphics/icons/oleochemicals.png",
    icon_size = 32,
    subgroup = "py-fluid-handling",
    order = "c"
}:add_unlock("mukmoux")

if mods.pyrawores then
    RECIPE("dedicated-oleochemicals"):replace_ingredient_unsafe("chromium", "titanium-plate")
end
