local tailings_copper_iron =
    RECIPE {
    type = "recipe",
    name = "tailings-copper-iron",
    localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.copper-ore"}, {"item-name.iron-ore"}, {"fluid-name.tar"}},
    category = "quenching-tower",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "tar", amount = 500},
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "fluid", name = "dirty-water", amount = 500},
        {type = "fluid", name = "flue-gas", amount = 150},
        {type = "fluid", name = "water-saline", amount = 250}
    },
    icons = {
        {icon = "__pycoalprocessinggraphics__/graphics/icons/dirty-water.png", icon_size = 32}
    },
    icon_size = 32,
    subgroup = "py-quenching-ores",
    order = "tailings-a"
}:add_unlock("coal-processing-2")

local tailings_borax_niobium = tailings_copper_iron:copy("tailings-borax-niobium"):add_unlock("coal-processing-2")
tailings_borax_niobium.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.raw-borax"}, {"item-name.niobium-ore"}, {"fluid-name.tar"}}
tailings_borax_niobium.icons[#tailings_borax_niobium.icons + 1] = {icon = "__pycoalprocessinggraphics__/graphics/icons/ores/borax-niobium.png", icon_size = 32}
tailings_borax_niobium.results[#tailings_borax_niobium.results + 1] = {type = "item", name = "raw-borax", amount = 1, probability = 0.4}
tailings_borax_niobium.results[#tailings_borax_niobium.results + 1] = {type = "item", name = "niobium-ore", amount = 1, probability = 0.4}

--Finally add the results to our original table (this would be so much easier when Recipe:Results is finished)
tailings_copper_iron.icons[#tailings_copper_iron.icons + 1] = {icon = "__pycoalprocessinggraphics__/graphics/icons/ores/copper-iron.png", icon_size = 32}
tailings_copper_iron.results[#tailings_copper_iron.results + 1] = {type = "item", name = "copper-ore", amount = 1, probability = 0.4}
tailings_copper_iron.results[#tailings_copper_iron.results + 1] = {type = "item", name = "iron-ore", amount = 1, probability = 0.4}
