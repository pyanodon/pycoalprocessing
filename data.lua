--luacheck: no global
if not pysmods then pysmods = {} end
if not pysmods.coalpro then pysmods.coalpro = {} end

--Settings and Helpers
require("config") --Config variables
require("stdlib.table")
require("stdlib.string")
require("stdlib.color.color")
require("stdlib.data.protohelpers") --Prototype helper functions

--Groups
require("prototypes.item-groups")

--Categories
require("prototypes.recipe-categories")

--Technologies
require("prototypes.technologies.coal-processing-1")
require("prototypes.technologies.coal-processing-2")
require("prototypes.technologies.coal-processing-3")
require("prototypes.technologies.methanol-processing-1")
require("prototypes.technologies.methanol-processing-2")
require("prototypes.technologies.py-asphalt")
require("prototypes.technologies.filtration")
require("prototypes.technologies.cooling-tower")
require("prototypes.technologies.desulfurization")
require("prototypes.technologies.excavation-1")
require("prototypes.technologies.excavation-2")
require("prototypes.technologies.crusher")
require("prototypes.technologies.separation")
require("prototypes.technologies.fuel-production")
require("prototypes.technologies.fine-electronics")
--require("prototypes.technologies.rare-earth")

--Recipes without items
require("prototypes.recipes.recipes")
require("prototypes.recipes.ground-borer-recipes")
require("prototypes.recipes.crusher-recipes")
require("prototypes.recipes.fts-reactor-recipes")
require("prototypes.recipes.olefin-plant-recipes")
require("prototypes.recipes.advanced-foundry-recipes")

--Items without entities
require("prototypes.items.treated-wood")
require("prototypes.items.items")
require("prototypes.items.canister")
require("prototypes.items.tailings")

--Tiles and Terrain
require ("prototypes.tiles.py-asphalt")
require ("prototypes.tiles.py-limestone")
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
require("prototypes.fluids.combustion-mixture2")
require("prototypes.fluids.water-saline")
require("prototypes.fluids.water-mineralized")
require("prototypes.fluids.aromatics")
require("prototypes.fluids.diesel")
require("prototypes.fluids.gasoline")
require("prototypes.fluids.olefin")
require("prototypes.fluids.hydrogen-peroxide")
require("prototypes.fluids.anthraquinone")
require("prototypes.fluids.slacked-lime")
require("prototypes.fluids.coal-slurry")
require("prototypes.fluids.diborane")
require("prototypes.fluids.boric-acid")
require("prototypes.fluids.oleochemicals")
require("prototypes.fluids.glycerol")
require("prototypes.fluids.organic-solvent")
require("prototypes.fluids.niobium-complex")
require("prototypes.fluids.rare-earth-mud")
require("prototypes.fluids.tpa")
require("prototypes.fluids.acetylene")

--Buildings
require("prototypes.buildings.distilator")
require("prototypes.buildings.gasturbinemk01")
require("prototypes.buildings.gasturbinemk02")
require("prototypes.buildings.gasturbinemk03")
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
require("prototypes.buildings.cooling-tower-mk02")
require("prototypes.buildings.evaporator")
require("prototypes.buildings.desulfurizator-unit")
require("prototypes.buildings.olefin-plant")
require("prototypes.buildings.soil-extractormk01")
require("prototypes.buildings.ground-borer")
require("prototypes.buildings.fts-reactor")
require("prototypes.buildings.solid-separator")
require("prototypes.buildings.washer")
require("prototypes.buildings.classifier")
require("prototypes.buildings.advanced-foundry")
require("prototypes.buildings.co2-absorber")
require("prototypes.buildings.fluid-separator")
require("prototypes.buildings.fawogae-plantation")
require("prototypes.buildings.ulric-corral")
require("prototypes.buildings.borax-mine")
require("prototypes.buildings.ralesia-plantation")
require("prototypes.buildings.niobium-mine")
require("prototypes.buildings.ore-crusher")
require("prototypes.buildings.ball-mill")
require("prototypes.buildings.mukmoux-pasture")
require("prototypes.buildings.py-tank-1500")
require("prototypes.buildings.py-tank-4000")
require("prototypes.buildings.py-tank-5000")
require("prototypes.buildings.py-tank-6500")
require("prototypes.buildings.py-tank-8000")
require("prototypes.buildings.automated-factory")
--require("prototypes.buildings.rare-earth-extractor")

--move to syngas recipe stuff in data-updates?
for _, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
        for _, recipe in ipairs({"syngas"}) do
            table.insert(v.limitation, recipe)
        end
    end
end
