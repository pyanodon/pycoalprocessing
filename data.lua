--luacheck: no global
if not pysmods then pysmods = {} end
if not pysmods.coalpro then pysmods.coalpro = {} end

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
require("prototypes.technologies.dessulfurization")

--Items without entities
require("prototypes.items.treated-lumber")
require("prototypes.items.items")
require("prototypes.items.canister")
require("prototypes.items.tailings")

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
require("prototypes.fluids.water-saline")

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
require("prototypes.buildings.cooling-tower-mk01")
require("prototypes.buildings.evaporator")
require("prototypes.buildings.dessulfurizator-unit")

--move to syngas recipe stuff in data-updates?
for _, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    for _, recipe in ipairs({"syngas"}) do
      table.insert(v.limitation, recipe)
    end
  end
end
