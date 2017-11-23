--Settings and Helpers
local PYC = require("config") --Config variables

require("stdlib.core")

--Groups
require("prototypes.item-groups")

--Categories
require("prototypes.recipe-categories")

--Technologies
require("prototypes.technologies.coal-processing-1")
require("prototypes.technologies.coal-processing-2")
require("prototypes.technologies.coal-processing-3")

require("prototypes.technologies.energy-1")
require("prototypes.technologies.energy-2")
require("prototypes.technologies.energy-3")

require("prototypes.technologies.methanol-processing-1")
require("prototypes.technologies.methanol-processing-2")

require("prototypes.technologies.cooling-tower-1")
require("prototypes.technologies.cooling-tower-2")

require("prototypes.technologies.excavation-1")
require("prototypes.technologies.excavation-2")

require("prototypes.technologies.filtration")
require("prototypes.technologies.desulfurization")
require("prototypes.technologies.crusher")
require("prototypes.technologies.separation")
require("prototypes.technologies.fuel-production")
require("prototypes.technologies.fine-electronics")

--Recipes without items
require("prototypes.recipes.recipes")
require("prototypes.recipes.ground-borer-recipes")
require("prototypes.recipes.crusher-recipes")
require("prototypes.recipes.combustion-recipes")
require("prototypes.recipes.fts-reactor-recipes")
require("prototypes.recipes.olefin-plant-recipes")
require("prototypes.recipes.advanced-foundry-recipes")
require("prototypes.recipes.sand-extractor-recipes")
require("prototypes.recipes.concrete-richclay")

--Items without entities
require("prototypes.items.treated-wood")
require("prototypes.items.items")
require("prototypes.items.canister")
require("prototypes.items.tailings")

--Tiles and Terrain
require("prototypes.tiles.polluted-ground")

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
require("prototypes.buildings.jaw-crusher")
require("prototypes.buildings.ball-mill")
require("prototypes.buildings.mukmoux-pasture")

require("prototypes.buildings.automated-factory")

require("prototypes.buildings.sand-extractor")
require("prototypes.buildings.botanical-nursery")
require("prototypes.buildings.wpu")

if PYC.DEBUG then
    local developer = require("stdlib/data/developer/developer")
    developer.make_chunk_markers("pycoalprocessing")
end
