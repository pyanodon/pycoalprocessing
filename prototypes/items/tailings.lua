local tailings_copper_iron ={
  type = "recipe",
  name = "tailings-copper-iron",
  category = "quenching-tower",
  enabled = "false",
  energy_required = 2,
  ingredients ={
    {type="fluid", name="tar", amount=20},
    {type="fluid", name="water", amount=50},
  },
  results=
  {
    {type="fluid", name="dirty-water", amount=50},
    {type="fluid", name="flue-gas", amount=15},
    {type="fluid", name="water-saline", amount=20},
  },
  --icon = "__pycoalprocessing__/graphics/icons/dirty-water.png",
  icons = {
    {icon = "__pycoalprocessing__/graphics/icons/dirty-water.png"},
  },
  subgroup = "py-quenching-ores",
  order = "tailings-a",
}
local tailings_nickel_zinc = table.deepcopy(tailings_copper_iron)
local tailings_tin_lead = table.deepcopy(tailings_copper_iron)
local tailings_gold_silver = table.deepcopy(tailings_copper_iron)
local tailings_gemstones = table.deepcopy(tailings_copper_iron)
local tailings_bauxite_cobalt = table.deepcopy(tailings_copper_iron)
local tailings_rutile_tungsten = table.deepcopy(tailings_copper_iron)

tailings_copper_iron.icons[#tailings_copper_iron.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/copper-iron.png"}
tailings_copper_iron.results[#tailings_copper_iron.results +1] = {type="item", name="copper-ore", amount=1, probability=0.4}
tailings_copper_iron.results[#tailings_copper_iron.results +1] = {type="item", name="iron-ore", amount=1, probability=0.4}
data:extend({tailings_copper_iron})

--luacheck: globals bobmods
if bobmods then
tailings_tin_lead.name="tailings-tin-lead"
tailings_tin_lead.order="tailings-b"
tailings_tin_lead.icons[#tailings_tin_lead.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/tin-lead.png"}
tailings_tin_lead.results[#tailings_tin_lead.results +1] = {type="item", name="tin-ore", amount=1, probability=0.4}
tailings_tin_lead.results[#tailings_tin_lead.results +1] = {type="item", name="lead-ore", amount=1, probability=0.4}

tailings_nickel_zinc.name="tailings-nickel-zinc"
tailings_nickel_zinc.order="tailings-c"
tailings_nickel_zinc.icons[#tailings_nickel_zinc.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/nickel-zinc.png"}
tailings_nickel_zinc.results[#tailings_nickel_zinc.results +1] = {type="item", name="nickel-ore", amount=1, probability=0.4}
tailings_nickel_zinc.results[#tailings_nickel_zinc.results +1] = {type="item", name="zinc-ore", amount=1, probability=0.4}

tailings_gold_silver.name="tailings-gold-silver"
tailings_gold_silver.order="tailings-d"
tailings_gold_silver.icons[#tailings_gold_silver.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/gold-silver.png"}
tailings_gold_silver.results[#tailings_gold_silver.results +1] = {type="item", name="gold-ore", amount=1, probability=0.4}
tailings_gold_silver.results[#tailings_gold_silver.results +1] = {type="item", name="silver-ore", amount=1, probability=0.4}

tailings_bauxite_cobalt.name="tailings-bauxite-cobalt"
tailings_bauxite_cobalt.order="tailings-e"
tailings_bauxite_cobalt.icons[#tailings_bauxite_cobalt.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/bauxite-cobalt.png"}
tailings_bauxite_cobalt.results[#tailings_bauxite_cobalt.results +1] = {type="item", name="bauxite-ore", amount=1, probability=0.4}
tailings_bauxite_cobalt.results[#tailings_bauxite_cobalt.results +1] = {type="item", name="cobalt-ore", amount=1, probability=0.4}

tailings_rutile_tungsten.name="tailings-rutile-tungsten"
tailings_rutile_tungsten.order="tailings-f"
tailings_rutile_tungsten.icons[#tailings_rutile_tungsten.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/rutile-tungsten.png"}
tailings_rutile_tungsten.results[#tailings_rutile_tungsten.results +1] = {type="item", name="rutile-ore", amount=1, probability=0.4}
tailings_rutile_tungsten.results[#tailings_rutile_tungsten.results +1] = {type="item", name="tungsten-ore", amount=1, probability=0.4}



tailings_gemstones.name="tailings-gem-ore"
tailings_gemstones.icons[#tailings_gemstones.icons +1] = {icon = "__pycoalprocessing__/graphics/icons/ores/gem-ore.png"}
tailings_gemstones.order="tailings-g"
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="diamond-ore", amount=1, probability=0.1}
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="topaz-ore", amount=1, probability=0.2}
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="amethyst-ore", amount=1, probability=0.25}
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="emerald-ore", amount=1, probability=0.3}
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="ruby-ore", amount=1, probability=0.5}
tailings_gemstones.results[#tailings_gemstones.results +1] = {type="item", name="sapphire-ore", amount=1, probability=0.4}


data:extend({tailings_nickel_zinc, tailings_tin_lead, tailings_gold_silver, tailings_gemstones, tailings_rutile_tungsten, tailings_bauxite_cobalt})
end
