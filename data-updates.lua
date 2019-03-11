require("__stdlib__/stdlib/data/data").Util.create_data_globals()

--update recipes for creosote
require("prototypes/updates/recipe-updates")

for _, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
        for _, recipe in ipairs({"syngas"}) do
            table.insert(v.limitation, recipe)
        end
    end
end

ITEM("automation-science-pack", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-1.png")
ITEM("logistic-science-pack", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-2.png")
ITEM("chemical-science-pack", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-3.png")

RECIPE("logistic-science-pack"):remove_unlock('logistic-science-pack')
TECHNOLOGY('military-2'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('automation-2'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('circuit-network'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('logistics-2'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('solar-energy'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('electric-energy-distribution-1'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('landfill'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('engine'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('toolbelt'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')
TECHNOLOGY('advanced-material-processing'):remove_prereq('logistic-science-pack'):add_prereq('coal-processing-1')

RECIPE("chemical-science-pack"):remove_unlock('chemical-science-pack')
TECHNOLOGY('chemical-science-pack'):remove_prereq('advanced-electronics')
TECHNOLOGY('electric-energy-distribution-2'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('advanced-electronics-2'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('auto-character-logistic-trash-slots'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('braking-force-1'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('advanced-material-processing-2'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('personal-roboport-equipment'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('worker-robots-speed-1'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('worker-robots-storage-1'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('advanced-oil-processing'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('low-density-structure'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('military-3'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')
TECHNOLOGY('uranium-processing'):remove_prereq('chemical-science-pack'):add_prereq('fine-electronics')

RECIPE("wood"):set_fields {energy_required = 10}

require("prototypes/recipes/advanced-foundry-recipes")
