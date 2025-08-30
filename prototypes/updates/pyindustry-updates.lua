ITEM({
    name = "py-logo-15tiles",
    type = "item",
    stack_size = 10,
    icon = "__pycoalprocessinggraphics__/graphics/icons/py-logo-15tiles.png",
    icon_size = 64,
    place_result = "py-logo-15tiles",
    flags = {},
    subgroup = "py-walls",
    order = "zz"
})

RECIPE({
    type = "recipe",
    name = "py-logo-15tiles",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        { type = "item", name = "py-iron-oxide", amount = 45 },
        { type = "item", name = "iron-chest",    amount = 1 },
    },
    category = "crafting-with-fluid",
    results = {
        { type = "item", name = "py-logo-15tiles", amount = 1 }
    }
}):add_unlock("py-asphalt-mk03"):add_ingredient({ type = "fluid", name = "flue-gas", amount = 200 }):add_ingredient({ type = "item", name = "small-parts-01", amount = 10 })

data.raw["container"]["py-logo-15tiles"].minable.result = "py-logo-15tiles"
RECIPE("niobium-pipe"):remove_unlock("py-storage-tanks"):add_unlock("niobium")
RECIPE("niobium-pipe-to-ground"):remove_unlock("py-storage-tanks"):add_unlock("niobium")
