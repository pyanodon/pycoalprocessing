local tailings_copper_iron =
    RECIPE {
    type = "recipe",
    name = "tailings-copper-iron",
    localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.copper-ore"}, {"item-name.iron-ore"}, {"fluid-name.tar"}},
    category = "quenching-tower",
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = "fluid", name = "tar", amount = 200},
        {type = "fluid", name = "water", amount = 500}
    },
    results = {
        {type = "fluid", name = "dirty-water", amount = 500},
        {type = "fluid", name = "flue-gas", amount = 150},
        {type = "fluid", name = "water-saline", amount = 200}
    },
    icons = {
        {icon = "__pycoalprocessing__/graphics/icons/dirty-water.png", icon_size = 32}
    },
    icon_size = 32,
    subgroup = "py-quenching-ores",
    order = "tailings-a"
}:add_unlock("coal-processing-2")

local tailings_borax_niobium = tailings_copper_iron:copy("tailings-borax-niobium"):add_unlock("coal-processing-2")
tailings_borax_niobium.icons[#tailings_borax_niobium.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/borax-niobium.png", icon_size = 32}
tailings_borax_niobium.results[#tailings_borax_niobium.results + 1] = {type = "item", name = "raw-borax", amount = 1, probability = 0.4}
tailings_borax_niobium.results[#tailings_borax_niobium.results + 1] = {type = "item", name = "niobium-ore", amount = 1, probability = 0.4}

if bobmods then
    local tailings_nickel_zinc = tailings_copper_iron:copy("tailings-nickel-zinc"):add_unlock("coal-processing-2")
    local tailings_tin_lead = tailings_copper_iron:copy("tailings-tin-lead"):add_unlock("coal-processing-2")
    local tailings_gold_silver = tailings_copper_iron:copy("tailings-gold-silver"):add_unlock("coal-processing-2")
    local tailings_gemstones = tailings_copper_iron:copy("tailings-gem-ore"):add_unlock("coal-processing-2")
    local tailings_bauxite_cobalt = tailings_copper_iron:copy("tailings-bauxite-cobalt"):add_unlock("coal-processing-2")
    local tailings_rutile_tungsten = tailings_copper_iron:copy("tailings-rutile-tungsten"):add_unlock("coal-processing-2")

    tailings_tin_lead.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.tin-ore"}, {"item-name.lead-ore"}, {"fluid-name.tar"}}
    tailings_tin_lead.order = "tailings-b"
    tailings_tin_lead.icons[#tailings_tin_lead.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/tin-lead.png", icon_size = 32}
    tailings_tin_lead.results[#tailings_tin_lead.results + 1] = {type = "item", name = "tin-ore", amount = 1, probability = 0.4}
    tailings_tin_lead.results[#tailings_tin_lead.results + 1] = {type = "item", name = "lead-ore", amount = 1, probability = 0.4}

    tailings_nickel_zinc.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.nickel-ore"}, {"item-name.zinc-ore"}, {"fluid-name.tar"}}
    tailings_nickel_zinc.order = "tailings-c"
    tailings_nickel_zinc.icons[#tailings_nickel_zinc.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/nickel-zinc.png", icon_size = 32}
    tailings_nickel_zinc.results[#tailings_nickel_zinc.results + 1] = {type = "item", name = "nickel-ore", amount = 1, probability = 0.4}
    tailings_nickel_zinc.results[#tailings_nickel_zinc.results + 1] = {type = "item", name = "zinc-ore", amount = 1, probability = 0.4}

    tailings_gold_silver.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.gold-ore"}, {"item-name.silver-ore"}, {"fluid-name.tar"}}
    tailings_gold_silver.order = "tailings-d"
    tailings_gold_silver.icons[#tailings_gold_silver.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/gold-silver.png", icon_size = 32}
    tailings_gold_silver.results[#tailings_gold_silver.results + 1] = {type = "item", name = "gold-ore", amount = 1, probability = 0.4}
    tailings_gold_silver.results[#tailings_gold_silver.results + 1] = {type = "item", name = "silver-ore", amount = 1, probability = 0.4}

    tailings_bauxite_cobalt.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.bauxite-ore"}, {"item-name.cobalt-ore"}, {"fluid-name.tar"}}
    tailings_bauxite_cobalt.order = "tailings-e"
    tailings_bauxite_cobalt.icons[#tailings_bauxite_cobalt.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/bauxite-cobalt.png", icon_size = 32}
    tailings_bauxite_cobalt.results[#tailings_bauxite_cobalt.results + 1] = {type = "item", name = "bauxite-ore", amount = 1, probability = 0.4}
    tailings_bauxite_cobalt.results[#tailings_bauxite_cobalt.results + 1] = {type = "item", name = "cobalt-ore", amount = 1, probability = 0.4}

    tailings_rutile_tungsten.localised_name = {"recipe-name.tailings-ore-extraction", {"item-name.rutile-ore"}, {"item-name.tungsten-ore"}, {"fluid-name.tar"}}
    tailings_rutile_tungsten.order = "tailings-f"
    tailings_rutile_tungsten.icons[#tailings_rutile_tungsten.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/rutile-tungsten.png", icon_size = 32}
    tailings_rutile_tungsten.results[#tailings_rutile_tungsten.results + 1] = {type = "item", name = "rutile-ore", amount = 1, probability = 0.4}
    tailings_rutile_tungsten.results[#tailings_rutile_tungsten.results + 1] = {type = "item", name = "tungsten-ore", amount = 1, probability = 0.4}

    tailings_gemstones.icons[#tailings_gemstones.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/gem-ore.png", icon_size = 32}
    tailings_gemstones.order = "tailings-g"
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "diamond-ore", amount = 1, probability = 0.1}
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "topaz-ore", amount = 1, probability = 0.2}
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "amethyst-ore", amount = 1, probability = 0.25}
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "emerald-ore", amount = 1, probability = 0.3}
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "ruby-ore", amount = 1, probability = 0.5}
    tailings_gemstones.results[#tailings_gemstones.results + 1] = {type = "item", name = "sapphire-ore", amount = 1, probability = 0.4}
end

--Finally add the results to our original table (this would be so much easier when Recipe:Results is finished)
tailings_copper_iron.icons[#tailings_copper_iron.icons + 1] = {icon = "__pycoalprocessing__/graphics/icons/ores/copper-iron.png", icon_size = 32}
tailings_copper_iron.results[#tailings_copper_iron.results + 1] = {type = "item", name = "copper-ore", amount = 1, probability = 0.4}
tailings_copper_iron.results[#tailings_copper_iron.results + 1] = {type = "item", name = "iron-ore", amount = 1, probability = 0.4}
