--CONCRETE from RICHCLAY

RECIPE {
    type = "recipe",
    name = "concrete-richclay",
    enabled = "false",
    energy_required = 2,
    ingredients = {
        {type = "item", name = "rich-clay", amount = 15},
        {type = "fluid", name = "sulfuric-acid", amount = 50}
    },
    results = {
        {type = "item", name = "concrete", amount = 6}
    },
    main_product = "concrete",
    category = "hpf",
    icon = "__base__/graphics/icons/concrete.png",
    icon_size = 32,
    subgroup = "py-items-hpf",
    order = "i"
}:add_unlock("coal-processing-1")
