require("stdlib/data/data").create_data_globals()

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

RECIPE("chemical-science-pack"):remove_unlock('chemical-science-pack')
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