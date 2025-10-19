data:extend {{
    type = "container",
    name = "py-logo-15tiles",
    icon = "__pycoalprocessinggraphics__/graphics/icons/py-logo-15tiles.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.5, result = "py-logo-15tiles"},
    max_health = 666,
    inventory_type = "with_filters_and_bar",
    collision_box = {{-7.5 + 0.15, -1.5 + 0.15}, {7.5 - 0.15, 1.5 - 0.15}},
    selection_box = {{-7.5, -1.5}, {7.5, 1.5}},
    inventory_size = 1,
    picture = {
        filename = "__pycoalprocessinggraphics__/graphics/entity/logo/py-logo.png",
        priority = "extra-high",
        width = 1000,
        height = 298,
        shift = util.by_pixel(0, 0),
        scale = 0.5
    }
}}

ITEM {
    name = "py-logo-15tiles",
    type = "item",
    stack_size = 10,
    icon = "__pycoalprocessinggraphics__/graphics/icons/py-logo-15tiles.png",
    icon_size = 64,
    place_result = "py-logo-15tiles",
    flags = {},
    subgroup = "py-walls",
    order = "zz"
}

RECIPE {
    type = "recipe",
    name = "py-logo-15tiles",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {type = "item", name = "py-iron-oxide", amount = 45},
        {type = "item", name = "iron-chest",    amount = 1},
    },
    category = "crafting-with-fluid",
    results = {
        {type = "item", name = "py-logo-15tiles", amount = 1}
    }
}:add_unlock("py-asphalt-mk03"):add_ingredient {type = "fluid", name = "flue-gas", amount = 200}:add_ingredient {type = "item", name = "small-parts-01", amount = 10}
