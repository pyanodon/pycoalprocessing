require("__stdlib__/stdlib/data/data").Util.create_data_globals()
local FUN = require("functions/functions")

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
TECHNOLOGY('logistic-robotics'):remove_prereq('advanced-electronics')

RECIPE("wood"):set_fields {energy_required = 10}

require("prototypes/recipes/advanced-foundry-recipes")

--gather recipes for module changes
local recipes_list =
	{
		"biofilm",
		"mukmoux-fat",
		"cladding",
		"copper-coating",
		"filtration-media",
		"kevlar",
		"kevlar-coating",
		"nbfe-alloy",
		"nbfe-coating",
		"rich-clay",
		"ground-sample01",
		"bio-sample01",
		"alien-sample01",
		"equipment-chassi",
		"lab-instrument",
		"zinc-chloride",
		"drill-head",
		"niobium-oxide",
		"niobium-plate",
		"ppd",
		"lithium-peroxide",
		"nexelit-cartridge",
		--"glycerol-hydrogen",
		"explosive-glycerol",
		"zinc-chloride",
		"slacked-lime",
		"fawogae-substrate",
		"ralesia-seeds",
		"sand-brick",
		"treated-wood",
		"organics-from-wood",
		"acetylene",
		"boric-acid",
		"diborane",
		"niobium-complex",
		"organic-solvent",
		--[[
		--building recipes
		"advanced-foundry-mk01",
		"advanced-foundry-mk02",
		"advanced-foundry-mk03",
		"advanced-foundry-mk04",
		"automated-factory-mk01",
		"automated-factory-mk02",
		"automated-factory-mk03",
		"automated-factory-mk04",
		"ball-mill-mk01",
		"ball-mill-mk02",
		"ball-mill-mk03",
		"ball-mill-mk04",
		]]
	}

local Cat_list = {
		"coal-processing",
		"distilator",
		"rectisol",
		"carbonfilter",
		"gasifier",
		"tar",
		"methanol",
		"hpf",
		"quenching-tower",
		"combustion",
		"cooling",
		"evaporator",
		"desulfurization",
		"olefin",
		"soil-extraction",
		"ground-borer",
		"fts-reactor",
		"solid-separator",
		"washer",
		"classifier",
		"advanced-foundry",
		"co2",
		"fluid-separator",
		"fawogae",
		"ralesia",
		"ulric",
		"borax",
		"niobium",
		"crusher",
		"ball-mill",
		"sand-extractor",
		"mukmoux",
		"rare-earth",
		"advanced-crafting",
		"nursery",
		"wpu",
		"borax",
		"niobium",
		"drill"
		}

--adding to module limitation list
FUN.recipe_add_prod(recipes_list,Cat_list)
FUN.add_buildings(recipes_list)
FUN.productivity(recipes_list)
