require '__pypostprocessing__.lib'

-- (( GUI Style )) --
require 'prototypes/gui-style'

-- (( Custom Input )) --
require 'prototypes/custom-input'

-- (( Groups )) --
require 'prototypes/item-groups'

-- (( Categories )) --
require 'prototypes/recipe-categories'

--TODO:.create doesnt work anymore
-- (( Circuit Connector Definitions )) --
--require 'prototypes/circuit-connector-definitions'

-- (( Technology )) --
require 'prototypes/technologies/coal-processing-1'
require 'prototypes/technologies/coal-processing-2'
require 'prototypes/technologies/coal-processing-3'
require 'prototypes/technologies/syngas'
require 'prototypes/technologies/tar-processing'

require 'prototypes/technologies/energy-1'
require 'prototypes/technologies/energy-2'
require 'prototypes/technologies/energy-3'

require 'prototypes/technologies/methanol-processing-1'
require 'prototypes/technologies/methanol-processing-2'

require 'prototypes/technologies/cooling-tower-1'
require 'prototypes/technologies/cooling-tower-2'

require 'prototypes/technologies/excavation-1'
require 'prototypes/technologies/excavation-2'

require 'prototypes/technologies/biofilm'
require 'prototypes/technologies/filtration'
require 'prototypes/technologies/desulfurization'
require 'prototypes/technologies/crusher'
require 'prototypes/technologies/separation'
require 'prototypes/technologies/fluid-separation'
require 'prototypes/technologies/fuel-production'
require 'prototypes/technologies/fine-electronics'
require 'prototypes/technologies/fluid-processing-machines'

require 'prototypes/technologies/ralesia'
require 'prototypes/technologies/ulric'
require 'prototypes/technologies/wood-processing'
require 'prototypes/technologies/wood-processing-2'
require 'prototypes/technologies/lab-instrument'

require 'prototypes/technologies/niobium'
require 'prototypes/technologies/nexelit'
require 'prototypes/technologies/chromium'

require 'prototypes/technologies/organic-solvent'
require 'prototypes/technologies/mukmoux'
require 'prototypes/technologies/kevlar'
require 'prototypes/technologies/creosote'

require 'prototypes/technologies/pyrrhic'

require 'prototypes/technologies/artillery-2'
require 'prototypes/technologies/artillery-range'


-- (( RESOURCES )) --
require 'prototypes.ores.borax'
require 'prototypes.ores.niobium'


-- (( RECIPES )) --
require 'prototypes/recipes/recipes'
require 'prototypes/recipes/coal-processing-recipes'
require 'prototypes/recipes/seperation-recipes'
require 'prototypes/recipes/desulfurization-recipes'
require 'prototypes/recipes/ground-borer-recipes'
require 'prototypes/recipes/crusher-recipes'
require 'prototypes/recipes/combustion-recipes'
require 'prototypes/recipes/fts-reactor-recipes'
require 'prototypes/recipes/olefin-plant-recipes'
require 'prototypes/recipes/sand-extractor-recipes'
require 'prototypes/recipes/tailings-recipes'
require 'prototypes/recipes/filtration-recipes'
require 'prototypes/recipes/mukmoux-recipes'
require 'prototypes/recipes/base-overrides'
require 'prototypes/recipes/advanced-foundry-recipes'

-- (( ITEMS )) --
require 'prototypes/items/items'
require 'prototypes/items/canister'

-- (( TILES )) --
require 'prototypes/tiles/polluted-ground'

-- (( FLUIDS )) --
require 'prototypes/fluids/acidgas'
require 'prototypes/fluids/carbon-dioxide'
require 'prototypes/fluids/coal-gas'
require 'prototypes/fluids/creosote'
require 'prototypes/fluids/methanol'
require 'prototypes/fluids/refsyngas'
require 'prototypes/fluids/syngas'
require 'prototypes/fluids/tar'
require 'prototypes/fluids/dirty-water-light'
require 'prototypes/fluids/dirty-water-heavy'
require 'prototypes/fluids/flue-gas'
require 'prototypes/fluids/combustion-mixture1'
-- require 'prototypes/fluids/combustion-mixture2'
require 'prototypes/fluids/water-saline'
require 'prototypes/fluids/aromatics'
require 'prototypes/fluids/olefin'
require 'prototypes/fluids/hydrogen-peroxide'
require 'prototypes/fluids/anthraquinone'
require 'prototypes/fluids/slacked-lime'
require 'prototypes/fluids/coal-slurry'
require 'prototypes/fluids/diborane'
require 'prototypes/fluids/boric-acid'
require 'prototypes/fluids/oleochemicals'
require 'prototypes/fluids/glycerol'
require 'prototypes/fluids/organic-solvent'
require 'prototypes/fluids/niobium-complex'
require 'prototypes/fluids/tpa'
require 'prototypes/fluids/molten-glass'

-- (( BUILDINGS )) --
require 'prototypes/buildings/distilator'
require 'prototypes/buildings/gas-turbine-mk01'
require 'prototypes/buildings/gas-turbine-mk02'
require 'prototypes/buildings/gas-turbine-mk03'
require 'prototypes/buildings/gasifier'
require 'prototypes/buildings/carbon-filter'
require 'prototypes/buildings/tar-processing-unit'
require 'prototypes/buildings/rectisol'
require 'prototypes/buildings/methanol-reactor'
require 'prototypes/buildings/tailings-pond'
require 'prototypes/buildings/quenching-tower'
require 'prototypes/buildings/hpf'
require 'prototypes/buildings/power-house'
require 'prototypes/buildings/cooling-tower-mk01'
require 'prototypes/buildings/cooling-tower-mk02'
require 'prototypes/buildings/evaporator'
require 'prototypes/buildings/desulfurizator-unit'
require 'prototypes/buildings/olefin-plant'
require 'prototypes/buildings/soil-extractor'
require 'prototypes/buildings/ground-borer'
require 'prototypes/buildings/fts-reactor'
require 'prototypes/buildings/solid-separator'
require 'prototypes/buildings/washer'
require 'prototypes/buildings/classifier'
require 'prototypes/buildings/advanced-foundry'
require 'prototypes/buildings/co2-absorber'
require 'prototypes/buildings/fluid-separator'
require 'prototypes/buildings/fawogae-plantation'
if not mods.pyalienlife then require 'prototypes/buildings/ulric-corral' end
require 'prototypes/buildings/borax-mine'
require 'prototypes/buildings/ralesia-plantation'
require 'prototypes/buildings/niobium-mine'
require 'prototypes/buildings/jaw-crusher'
require 'prototypes/buildings/ball-mill'
if not mods.pyalienlife then require 'prototypes/buildings/mukmoux-pasture' end
require 'prototypes/buildings/automated-factory'
require 'prototypes/buildings/sand-extractor'
require 'prototypes/buildings/botanical-nursery'
require 'prototypes/buildings/wpu'
require 'prototypes/buildings/chemical-plant'
require 'prototypes/buildings/glassworks'
require 'prototypes/buildings/beacon'
require 'prototypes/buildings/diet-beacon'
require 'prototypes/buildings/lab'

--require 'prototypes/achievements'
require 'prototypes/logo'
require 'prototypes/menu-simulations'

-- sprites
require 'prototypes/sprites/sprites'

data.raw['utility-constants'].default.main_menu_background_image_location = '__pycoalprocessinggraphics__/graphics/pycp-wall.jpg'

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
--data.raw.fluid['combustion-mixture1'].fuel_value = '0.1MJ'
