if not pysmods then pysmods = {} end
if not pysmods.coalpro then pysmods.coalpro = {} end

require("config") --Config variables
require("stdlib.utils.utils") --Usefull helper functions

--Categories
require("prototypes.coal-processing-category")

--Technolgies
require("prototypes.technology.technology")

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

--Buildings
require("prototypes.buildings.distilator")
require("prototypes.buildings.gasturbinemk01")
require("prototypes.buildings.gasifier")
require("prototypes.buildings.carbon-filter")
require("prototypes.buildings.tar-processing-unit")
require("prototypes.buildings.rectisol")
require("prototypes.buildings.methanol-reactor")
require("prototypes.buildings.tailings-pond")
require("prototypes.buildings.quenching-tower")
require("prototypes.buildings.hpf")



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
