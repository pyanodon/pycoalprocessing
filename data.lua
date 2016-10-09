if not _G.pysmods then _G.pysmods = {} end
if not _G.pysmods.coalpro then _G.pysmods.coalpro = {} end

--Settings and Helpers
require("config") --Config variables
require("stdlib.utils.utils") --Usefull script helper functions
require("stdlib.utils.protohelpers") --Prototype helper functions

--Groups
require("prototypes.item-groups")

--Categories
require("prototypes.recipe-categories")

--Technolgies
require("prototypes.technologies.coal-processing1")
require("prototypes.technologies.coal-processing2")
require("prototypes.technologies.methanol-processing1")
require("prototypes.technologies.methanol-processing2")
require("prototypes.technologies.py-asphalt")
require("prototypes.technologies.coolingmk01")

--Items without entities
require("prototypes.items.items")
require("prototypes.items.recipes")

--Tiles and Terrain
require ("prototypes.tiles.py-asphalt")
require ("prototypes.tiles.polluted-ground")

--Fluids
require("prototypes.fluids.acidgas")
require("prototypes.fluids.carbon-dioxide")
require("prototypes.fluids.coal-gas")
require("prototypes.fluids.creosote")
require("prototypes.fluids.methanol")
require("prototypes.fluids.refsyngas")
require("prototypes.fluids.syngas")
require("prototypes.fluids.tar")
require("prototypes.fluids.dirty-water")
require("prototypes.fluids.flue-gas")
require("prototypes.fluids.combustion-mixture1")

--Buildings
require("prototypes.buildings.distilator")
require("prototypes.buildings.gasturbinemk01")
require("prototypes.buildings.gasturbinemk02")
require("prototypes.buildings.gasifier")
require("prototypes.buildings.carbon-filter")
require("prototypes.buildings.tar-processing-unit")
require("prototypes.buildings.rectisol")
require("prototypes.buildings.methanol-reactor")
require("prototypes.buildings.tailings-pond")
require("prototypes.buildings.quenching-tower")
require("prototypes.buildings.hpf")
require("prototypes.buildings.power-house")
require("prototypes.buildings.cooling_tower_mk01")



--Some of this stuff should be moved to data-updates?
	-- if bobmods and bobmods.plates then
	-- 		require("prototypes.recipes.recipes-bob")
	-- 		require("prototypes.technology.technology-bob")
	-- 	else
	-- 		require("prototypes.recipes.recipes")
	-- 		require("prototypes.technology.technology")
	-- end

--move to syngas recipe stuff in data-updates?
for _, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    for _, recipe in ipairs({"syngas"}) do
      table.insert(v.limitation, recipe)
    end
  end
end
