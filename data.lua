--luacheck: no global
if not pysmods then pysmods = {} end
if not pysmods.coalpro then pysmods.coalpro = {} end

--Settings and Helpers
require("config") --Config variables
require("stdlib.colors.colors")
require("stdlib.utils.protohelpers") --Prototype helper functions

--Groups
require("prototypes.item-groups")

--Categories
require("prototypes.recipe-categories")

--Technolgies
require("prototypes.technologies.coal-processing-1")
require("prototypes.technologies.coal-processing-2")
require("prototypes.technologies.coal-processing-3")
require("prototypes.technologies.methanol-processing-1")
require("prototypes.technologies.methanol-processing-2")
require("prototypes.technologies.py-asphalt")
require("prototypes.technologies.cooling-tower")
require("prototypes.technologies.desulfurization")
require("prototypes.technologies.excavation-1")
require("prototypes.technologies.excavation-2")

--Recipes without items
require("prototypes.recipes.recipes")
require("prototypes.recipes.ground-borer-recipes")

--Items without entities
require("prototypes.items.treated-wood")
require("prototypes.items.items")
require("prototypes.items.canister")
require("prototypes.items.tailings")

--Tiles and Terrain
require ("prototypes.tiles.py-asphalt")
require ("prototypes.tiles.py-coal-tile")
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
require("prototypes.fluids.aromatics")
require("prototypes.fluids.diesel")
require("prototypes.fluids.olefin")

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
require("prototypes.buildings.desulfurizator-unit")
require("prototypes.buildings.olefin-plant")
require("prototypes.buildings.soil-extractormk01")
require("prototypes.buildings.ground-borer")
require("prototypes.buildings.fts-reactor")

--move to syngas recipe stuff in data-updates?
for _, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    for _, recipe in ipairs({"syngas"}) do
      table.insert(v.limitation, recipe)
    end
  end
end
