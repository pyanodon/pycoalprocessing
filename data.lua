require('__stdlib__/stdlib/data/data').Util.create_data_globals()

-- (( Groups ))--
require('prototypes/item-groups')
-- ))

-- (( Categories ))--
require('prototypes/recipe-categories')
-- ))

--placeholder for all the unorganized shit.
require('prototypes/technologies/placeholder')

-- (( Technology ))--
require('prototypes/technologies/coal-processing-1')
require('prototypes/technologies/coal-processing-2')
require('prototypes/technologies/coal-processing-3')

require('prototypes/technologies/energy-1')
require('prototypes/technologies/energy-2')
require('prototypes/technologies/energy-3')

require('prototypes/technologies/methanol-processing-1')
require('prototypes/technologies/methanol-processing-2')

require('prototypes/technologies/cooling-tower-1')
require('prototypes/technologies/cooling-tower-2')

require('prototypes/technologies/excavation-1')
require('prototypes/technologies/excavation-2')

require('prototypes/technologies/filtration')
require('prototypes/technologies/desulfurization')
require('prototypes/technologies/crusher')
require('prototypes/technologies/separation')
require("prototypes/technologies/fluid-separation")
require('prototypes/technologies/fuel-production')
require('prototypes/technologies/fine-electronics')

require('prototypes/technologies/ralesia')
require('prototypes/technologies/ulric')
require('prototypes/technologies/wood-processing')
require('prototypes/technologies/wood-processing-2')

require('prototypes/technologies/niobium')
require('prototypes/technologies/nexelit')
require('prototypes/technologies/chromium')

require("prototypes/technologies/mukmoux")

-- ))

-- (( RESOURCEs ))--
require('prototypes.ores.borax')
require('prototypes.ores.niobium')
-- ))

-- (( RECIPEs ))--
require('prototypes/recipes/recipes')
require('prototypes/recipes/coal-processing-recipes')
require('prototypes/recipes/seperation-recipes')
require('prototypes/recipes/desulfurization-recipes')
require('prototypes/recipes/ground-borer-recipes')
require('prototypes/recipes/crusher-recipes')
require('prototypes/recipes/combustion-recipes')
require('prototypes/recipes/fts-reactor-recipes')
require('prototypes/recipes/olefin-plant-recipes')
require('prototypes/recipes/sand-extractor-recipes')
require('prototypes/recipes/tailings-recipes')
require("prototypes/recipes/filtration-recipes")
require("prototypes/recipes/mukmoux-recipes")


require("prototypes/updates/entity-updates")
require('prototypes/updates/base-updates')

-- ))

-- (( ITEMs ))--
require('prototypes/items/items')
require('prototypes/items/canister')

-- (( TILEs ))--
require('prototypes/tiles/polluted-ground')
-- ))

-- (( FLUIDs ))--
require('prototypes/fluids/acidgas')
require('prototypes/fluids/carbon-dioxide')
require('prototypes/fluids/coal-gas')
require('prototypes/fluids/creosote')
require('prototypes/fluids/methanol')
require('prototypes/fluids/refsyngas')
require('prototypes/fluids/syngas')
require('prototypes/fluids/tar')
require('prototypes/fluids/dirty-water-light')
require('prototypes/fluids/dirty-water-heavy')
require('prototypes/fluids/flue-gas')
require('prototypes/fluids/combustion-mixture1')
-- require("prototypes/fluids/combustion-mixture2")
require('prototypes/fluids/water-saline')
require('prototypes/fluids/aromatics')
require('prototypes/fluids/olefin')
require('prototypes/fluids/hydrogen-peroxide')
require('prototypes/fluids/anthraquinone')
require('prototypes/fluids/slacked-lime')
require('prototypes/fluids/coal-slurry')
require('prototypes/fluids/diborane')
require('prototypes/fluids/boric-acid')
require('prototypes/fluids/oleochemicals')
require('prototypes/fluids/glycerol')
require('prototypes/fluids/organic-solvent')
require('prototypes/fluids/niobium-complex')
require('prototypes/fluids/tpa')
require('prototypes/fluids/molten-glass')
-- ))

-- (( BUILDINGS ))--
require('prototypes/buildings/distilator')
require('prototypes/buildings/gasturbinemk01')
require('prototypes/buildings/gasturbinemk02')
require('prototypes/buildings/gasturbinemk03')
require('prototypes/buildings/gasifier')
require('prototypes/buildings/carbon-filter')
require('prototypes/buildings/tar-processing-unit')
require('prototypes/buildings/rectisol')
require('prototypes/buildings/methanol-reactor')
require('prototypes/buildings/tailings-pond')
require('prototypes/buildings/quenching-tower')
require('prototypes/buildings/hpf')
require('prototypes/buildings/power-house')
require('prototypes/buildings/cooling-tower-mk01')
require('prototypes/buildings/cooling-tower-mk02')
require('prototypes/buildings/evaporator')
require('prototypes/buildings/desulfurizator-unit')
require('prototypes/buildings/olefin-plant')
require('prototypes/buildings/soil-extractormk01')
require('prototypes/buildings/ground-borer')
require('prototypes/buildings/fts-reactor')
require('prototypes/buildings/solid-separator')
require('prototypes/buildings/washer')
require('prototypes/buildings/classifier')
require('prototypes/buildings/advanced-foundry-mk01')
require('prototypes/buildings/co2-absorber')
require('prototypes/buildings/fluid-separator')
require('prototypes/buildings/fawogae-plantation-mk01')
require('prototypes/buildings/ulric-corral-mk01')
require('prototypes/buildings/borax-mine')
require('prototypes/buildings/ralesia-plantation-mk01')
require('prototypes/buildings/niobium-mine')
require('prototypes/buildings/jaw-crusher')
require('prototypes/buildings/ball-mill-mk01')
require('prototypes/buildings/mukmoux-pasture')
require('prototypes/buildings/automated-factory-mk01')
require('prototypes/buildings/sand-extractor')
require('prototypes/buildings/botanical-nursery')
require('prototypes/buildings/wpu')
require('prototypes/buildings/chemical-plant-mk01')
require('prototypes/buildings/glassworks-mk01')
require('prototypes/buildings/TEST-lab')

if mods['pyrawores'] then
    require('prototypes/buildings/distilator-mk02')
    require('prototypes/buildings/distilator-mk03')
    require('prototypes/buildings/distilator-mk04')

    require('prototypes/buildings/gasifier-mk02')
    require('prototypes/buildings/gasifier-mk03')
    require('prototypes/buildings/gasifier-mk04')

    require('prototypes/buildings/carbon-filter-mk02')
    require('prototypes/buildings/carbon-filter-mk03')
    require('prototypes/buildings/carbon-filter-mk04')

    require('prototypes/buildings/tar-processing-unit-mk02')
    require('prototypes/buildings/tar-processing-unit-mk03')
    require('prototypes/buildings/tar-processing-unit-mk04')

    require('prototypes/buildings/rectisol-mk02')
    require('prototypes/buildings/rectisol-mk03')
    require('prototypes/buildings/rectisol-mk04')

    require('prototypes/buildings/methanol-reactor-mk02')
    require('prototypes/buildings/methanol-reactor-mk03')
    require('prototypes/buildings/methanol-reactor-mk04')

    require('prototypes/buildings/quenching-tower-mk02')
    require('prototypes/buildings/quenching-tower-mk03')
    require('prototypes/buildings/quenching-tower-mk04')

    require('prototypes/buildings/hpf-mk02')
    require('prototypes/buildings/hpf-mk03')
    require('prototypes/buildings/hpf-mk04')

    require('prototypes/buildings/power-house-mk02')
    require('prototypes/buildings/power-house-mk03')
    require('prototypes/buildings/power-house-mk04')

    require('prototypes/buildings/evaporator-mk02')
    require('prototypes/buildings/evaporator-mk03')
    require('prototypes/buildings/evaporator-mk04')

    require('prototypes/buildings/desulfurizator-unit-mk02')
    require('prototypes/buildings/desulfurizator-unit-mk03')
    require('prototypes/buildings/desulfurizator-unit-mk04')

    require('prototypes/buildings/olefin-plant-mk02')
    require('prototypes/buildings/olefin-plant-mk03')
    require('prototypes/buildings/olefin-plant-mk04')

    require('prototypes/buildings/soil-extractormk02')
    require('prototypes/buildings/soil-extractormk03')
    require('prototypes/buildings/soil-extractormk04')

    require('prototypes/buildings/ground-borer-mk02')
    require('prototypes/buildings/ground-borer-mk03')
    require('prototypes/buildings/ground-borer-mk04')

    require('prototypes/buildings/fts-reactor-mk02')
    require('prototypes/buildings/fts-reactor-mk03')
    require('prototypes/buildings/fts-reactor-mk04')

    require('prototypes/buildings/solid-separator-mk02')
    require('prototypes/buildings/solid-separator-mk03')
    require('prototypes/buildings/solid-separator-mk04')

    require('prototypes/buildings/washer-mk02')
    require('prototypes/buildings/washer-mk03')
    require('prototypes/buildings/washer-mk04')

    require('prototypes/buildings/classifier-mk02')
    require('prototypes/buildings/classifier-mk03')
    require('prototypes/buildings/classifier-mk04')

    require('prototypes/buildings/advanced-foundry-mk02')
    require('prototypes/buildings/advanced-foundry-mk03')
    require('prototypes/buildings/advanced-foundry-mk04')

    require('prototypes/buildings/fluid-separator-mk02')
    require('prototypes/buildings/fluid-separator-mk03')
    require('prototypes/buildings/fluid-separator-mk04')

    require('prototypes/buildings/fawogae-plantation-mk02')
    require('prototypes/buildings/fawogae-plantation-mk03')
    require('prototypes/buildings/fawogae-plantation-mk04')

    require('prototypes/buildings/borax-mine-mk02')
    require('prototypes/buildings/borax-mine-mk03')
    require('prototypes/buildings/borax-mine-mk04')

    require('prototypes/buildings/ralesia-plantation-mk02')
    require('prototypes/buildings/ralesia-plantation-mk03')
    require('prototypes/buildings/ralesia-plantation-mk04')

    require('prototypes/buildings/jaw-crusher-mk02')
    require('prototypes/buildings/jaw-crusher-mk03')
    require('prototypes/buildings/jaw-crusher-mk04')

    require('prototypes/buildings/ball-mill-mk02')
    require('prototypes/buildings/ball-mill-mk03')
    require('prototypes/buildings/ball-mill-mk04')

    require('prototypes/buildings/automated-factory-mk02')
    require('prototypes/buildings/automated-factory-mk03')
    require('prototypes/buildings/automated-factory-mk04')

    require('prototypes/buildings/sand-extractor-mk02')
    require('prototypes/buildings/sand-extractor-mk03')
    require('prototypes/buildings/sand-extractor-mk04')

    require('prototypes/buildings/botanical-nursery-mk02')
    require('prototypes/buildings/botanical-nursery-mk03')
    require('prototypes/buildings/botanical-nursery-mk04')

    require('prototypes/buildings/wpu-mk02')
    require('prototypes/buildings/wpu-mk03')
    require('prototypes/buildings/wpu-mk04')

    require('prototypes/buildings/glassworks-mk02')
    require('prototypes/buildings/glassworks-mk03')
    require('prototypes/buildings/glassworks-mk04')

end
-- ))

-- sprites
require('prototypes/sprites/sprites')

-- Tips & Tricks
require('prototypes/tips')

data.raw['utility-constants'].default.main_menu_background_image_location =
    '__pycoalprocessinggraphics__/graphics/pycp-wall.jpg'

-- adding fuel value to liquids
data.raw.fluid['crude-oil'].fuel_value = '82.5KJ'
data.raw.fluid['heavy-oil'].fuel_value = '0.8MJ'
data.raw.fluid['light-oil'].fuel_value = '0.9MJ'
data.raw.fluid['petroleum-gas'].fuel_value = '1MJ'
-- pycp fluids
data.raw.fluid['coal-gas'].fuel_value = '0.2MJ'
data.raw.fluid['syngas'].fuel_value = '0.4MJ'
data.raw.fluid['aromatics'].fuel_value = '0.35MJ'
data.raw.fluid['refsyngas'].fuel_value = '0.5MJ'
data.raw.fluid['methanol'].fuel_value = '1MJ'
data.raw.fluid['tar'].fuel_value = '0.2MJ'
data.raw.fluid['combustion-mixture1'].fuel_value = '0.1MJ'
