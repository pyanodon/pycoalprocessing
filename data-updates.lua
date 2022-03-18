require("__stdlib__/stdlib/data/data").Util.create_data_globals()
local FUN = require("prototypes/functions/functions")

require("prototypes/updates/recipe-updates")

require("prototypes/recipes/fuel-canister-recipes")

--FLUID('steam'):set('heat_capacity', '0.05KJ')

--[[
for _, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
        for _, recipe in ipairs({"syngas"}) do
            table.insert(v.limitation, recipe)
        end
    end
end
]]--

ITEM("automation-science-pack", "tool"):set("icon", "__pycoalprocessinggraphics__/graphics/icons/science-pack-1.png")
ITEM("automation-science-pack", "tool"):set("icon_size", 64)
ITEM("automation-science-pack", "tool"):set("icon_mipmaps", nil)
ITEM("sulfuric-acid"):subgroup_order("py-fluid-handling", "d")

ITEM("logistic-science-pack", "tool"):set("icon", "__pycoalprocessinggraphics__/graphics/icons/science-pack-2.png")
ITEM("logistic-science-pack", "tool"):set("icon_size", 64)
ITEM("logistic-science-pack", "tool"):set("icon_mipmaps", nil)

ITEM("chemical-science-pack", "tool"):set("icon", "__pycoalprocessinggraphics__/graphics/icons/science-pack-3.png")
ITEM("chemical-science-pack", "tool"):set("icon_size", 64)
ITEM("chemical-science-pack", "tool"):set("icon_mipmaps", nil)

ITEM("lab"):set("icon", "__pycoalprocessinggraphics__/graphics/icons/lab-mk01.png")
ITEM("lab"):set("icon_size", 64)
ITEM("lab"):set("icon_mipmaps", nil)

ITEM('electric-engine-unit'):set("icon", "__pycoalprocessinggraphics__/graphics/icons/electric-engine-unit.png")
ITEM('electric-engine-unit'):set("icon_size", 64)
ITEM('electric-engine-unit'):set("icon_mipmaps", nil)

RECIPE("small-electric-pole"):set_category("handcrafting")

RECIPE("medium-electric-pole"):add_ingredient({type = "item", name = "niobium-plate", amount = 1}):replace_ingredient("copper-plate", {"copper-cable", 5}):replace_ingredient("iron-stick", {"nbfe-alloy", 2}):remove_ingredient('steel-plate')

RECIPE("big-electric-pole"):remove_ingredient("steel-plate"):remove_ingredient("copper-plate"):add_ingredient({type = "item", name = "niobium-plate", amount = 2}):add_ingredient({type = "item", name = "copper-cable", amount = 15}):replace_ingredient('iron-stick', {"steel-plate", 6})

TECHNOLOGY('logistic-science-pack'):add_prereq('ulric'):add_prereq('energy-1')

TECHNOLOGY('circuit-network'):remove_prereq('logistic-science-pack'):remove_pack('logistic-science-pack')

TECHNOLOGY('electric-energy-distribution-1'):remove_prereq('logistic-science-pack'):remove_prereq("steel-processing"):add_prereq('niobium')

TECHNOLOGY('landfill'):remove_prereq('logistic-science-pack'):add_prereq('automation'):remove_pack('logistic-science-pack')

RECIPE("chemical-plant"):remove_unlock('oil-processing'):set_fields{hidden = true}
table.insert(data.raw["assembling-machine"]["chemical-plant"].flags, "hidden")
ITEM("chemical-plant"):add_flag("hidden")

TECHNOLOGY('chemical-science-pack'):add_prereq('fine-electronics'):add_prereq('nexelit'):remove_prereq('sulfur-processing')

TECHNOLOGY("fluid-handling"):remove_prereq("automation-2"):remove_prereq("engine"):add_prereq("steel-processing"):remove_pack('logistic-science-pack')

RECIPE("pump"):remove_unlock("fluid-handling"):add_unlock("engine")

TECHNOLOGY('logistic-robotics'):remove_prereq('advanced-electronics')

--RECIPE("wood"):set_fields {energy_required = 10}

--recipe updates
RECIPE("distilator-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("carbon-filter-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("quenching-tower-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("hpf-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("solid-separator-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("fluid-separator-mk04"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("fawogae-plantation-mk03"):replace_ingredient("pipe", "niobium-pipe")
RECIPE("sand-extractor-mk03"):replace_ingredient("pipe", "niobium-pipe")

require("prototypes/recipes/advanced-foundry-recipes")

--remove base game oil processing stuff
require("prototypes/updates/base-oil")

--move barrels below everything else in intermediate tab
data.raw["item-subgroup"]["fill-barrel"].order = "y"
data.raw["item-subgroup"]["empty-barrel"].order = "z"

--add handcrafting to player character
for _, player in DATA:pairs('character') do
    player.crafting_categories = player.String_Array(player.crafting_categories or {}) + 'handcrafting'
end
for _, controller in DATA:pairs('god-controller') do
    controller.crafting_categories = controller.String_Array(controller.crafting_categories or {}) + 'handcrafting'
end

--gather recipes for module changes
local recipes_list =
	{
  "iron-oxide",
  "soil",
  "fawogae",
  "soil-washing",
  "sand-washing",
  "fawogae-substrate",
  "flask",
  "cooling-water",
  "fluegas-to-syngas",
  "bone-solvent",
  "dirty-acid",
  "oleochemicals-crude-oil",
  "crushed-iron",
  "crushed-copper",
  "aromatics-to-rubber",
  "aromatics-to-plastic",
  "nas-battery",
  "lime",
  "fuelrod-mk01",
  "glass-core",
  "cladding",
  "ppd",
  "kevlar",
  "kevlar-coating",
  "nbfe-alloy",
  "nbfe-coating",
  "cladded-core",
  "copper-coating",
  "optical-fiber",
  "bonemeal",
  "raw-borax",
  "ralesia",
  "rich-clay",
  "ground-sample01",
  "bio-sample01",
  "alien-sample01",
  "equipment-chassi",
  "lab-instrument",
  "lens",
  "boron-trioxide",
  "ralesia-seeds",
  "borax-washing",
  --"tar-distilation",
  --"tar-gasification",
  "coal-fawogae",
  "coke-coal",
  "stone-distilation",
  "log1",
  "log2",
  "log3",
  "log-wood",
  "concrete-richclay",
  "treated-wood",
  "nichrome",
  "active-carbon",
  "zinc-chloride",
  "tailings-dust",
  "drill-head",
  "niobium-ore",
  "niobium-dust",
  "niobium-concentrate",
  "mukmoux-fat",
  "niobium-oxide",
  "niobium-plate",
  "log5",
  "rich-re",
  "eva-ree-dust",
  "organics-from-wood",
  "log4",
  "log6",
  "log-organics",
  "oleochemicals",
  "richdust-separation",
  "organic-solvent",
  --"aromatic-organic",
  "petgas-methanol",
  "oleo-heavy",
  "making-chromium",
  "wood-to-coal",
  --"coal-dust",
  "sand-brick",
  "oleochemicals-distilation",
  "oleo-gasification",
  "lithium-peroxide",
  "nexelit-cartridge",
  "organics-processing",
  --"sand-casting",
  --"tar-oil",
  "air-pollution",
  "slacked-lime",
  "co2",
  "saturated-nexelit-cartridge-regen",
  "oleo-solidfuel",
  "coaldust-ash",
  "sand-classification",
  "coarse-classification",
  "tailings-classification",
  "co2-organics",
  "soil-separation",
  "tailings-separation",
  "creosote-to-aromatics",
  "ash-separation",
  "dirty-reaction",
  --"coalgas-syngas",
  "sulfur-crudeoil",
  "sulfur-heavyoil",
  "sulfur-lightoil",
  "sulfur-petgas",
  "aromatics-to-lubricant",
  "explosive-glycerol",
  "extract-sulfur",
  --"mining-nexelit",
  --"mining-stone",
  --"mining-borax",
  --"mining-niobium",
  --"mining-limestone",
  "niobium-powder",
  "crushing-iron",
  "crushing-copper",
  --"stone-to-gravel",
  --"gravel-to-sand",
 -- "coalgas-combustion",
 -- "coalslurry-combustion",
 --"syngas-combustion",
 -- "diborane-combustion",
 -- "heavy-oil-combustion",
 -- "light-oil-combustion",
 -- "petgas-combustion",
 -- "methanol-combustion",
 -- "refsyngas-combustion",
 -- "olefin-combustion",
 -- "supercritical-combustion",
 -- "ultrasupercritical-combustion",
  "heavy-oil_from_coal-gas",
  "light-oil_from_syngas",
  "petgas-from-refsyngas",
  "ref-to-light-oil",
  "sulfuric-petgas",
  "combustion-olefin",
  "heavyoil-to-coal-gas",
  "lightoil-to-syngas",
  "petgas-to-refsyngas",
  "glycerol-syngas",
  "coal-briquette",
  "heavy-oleo",
  "aromatics",
  "olefin",
  "olefin-petgas",
  "refolefin",
  "aromaticsolefin",
  "extract-sand",
  "extract-gravel",
  "extract-stone",
  "extract-richdust",
  "extract-coarse",
  "tailings-copper-iron",
  "tailings-borax-niobium",
  "coal-gas",
  "coal-gas-from-wood",
  "coal-gas-from-coke",
  "creosote",
  --"methanol-from-syngas",
  "oleo-methanol",
  "refsyngas-from-meth",
  "refsyngas-from-meth-canister",
  --"syngas",
  "combustion-mixture2",
  "aromatics2",
  "hydrogen-peroxide",
  "anthraquinone",
  "coal-slurry",
  "diborane",
  --"boric-acid",
  "niobium-complex",
  "tpa",
  --"distilator",
  --"distilator-mk02",
  --"distilator-mk03",
  --"distilator-mk04",
  --"gasturbinemk01",
  --"gasturbinemk02",
  --"gasturbinemk03",
  --"gasifier",
  --"gasifier-mk02",
  --"gasifier-mk03",
  --"gasifier-mk04",
  --"tar-processing-unit",
  --"tar-processing-unit-mk02",
  --"tar-processing-unit-mk03",
  --"tar-processing-unit-mk04",
  --"rectisol",
  --"rectisol-mk02",
  --"rectisol-mk03",
  --"rectisol-mk04",
  --"methanol-reactor",
  --"methanol-reactor-mk02",
  --"methanol-reactor-mk03",
  --"methanol-reactor-mk04",
  --"tailings-pond",
  --"quenching-tower",
  --"quenching-tower-mk02",
  --"quenching-tower-mk03",
  --"quenching-tower-mk04",
  --"hpf",
  --"hpf-mk02",
  --"hpf-mk03",
  --"hpf-mk04",
  --"power-house",
  --"power-house-mk02",
  --"power-house-mk03",
  --"power-house-mk04",
  --"cooling-tower-mk01",
  --"cooling-tower-mk02",
  --"evaporator",
  --"evaporator-mk02",
  --"evaporator-mk03",
  --"evaporator-mk04",
  --"desulfurizator-unit",
  --"desulfurizator-unit-mk02",
  --"desulfurizator-unit-mk03",
  --"desulfurizator-unit-mk04",
  --"olefin-plant",
  --"olefin-plant-mk02",
  --"olefin-plant-mk03",
  --"olefin-plant-mk04",
  --"soil-extractormk01",
  --"soil-extractormk02",
  --"soil-extractormk03",
  --"soil-extractormk04",
  --"ground-borer",
  --"fts-reactor",
  --"fts-reactor-mk02",
  --"fts-reactor-mk03",
  --"fts-reactor-mk04",
  --"solid-separator",
  --"solid-separator-mk02",
  --"solid-separator-mk03",
  --"solid-separator-mk04",
  --"washer",
  --"washer-mk02",
  --"washer-mk03",
  --"washer-mk04",
  --"classifier",
  --"classifier-mk02",
  --"classifier-mk03",
  --"classifier-mk04",
  --"advanced-foundry-mk01",
  --"advanced-foundry-mk02",
  --"advanced-foundry-mk03",
  --"advanced-foundry-mk04",
  --"co2-absorber",
  --"fluid-separator",
  --"fluid-separator-mk02",
  --"fluid-separator-mk03",
  --"fluid-separator-mk04",
  --"fawogae-plantation",
  --"fawogae-plantation-mk02",
  --"fawogae-plantation-mk03",
  --"fawogae-plantation-mk04",
  --"ulric-corral",
  --"borax-mine",
  --"borax-mine-mk02",
  --"borax-mine-mk03",
  --"borax-mine-mk04",
  --"ralesia-plantation",
  --"niobium-mine",
  --"jaw-crusher",
  --"jaw-crusher-mk02",
  --"jaw-crusher-mk03",
  --"jaw-crusher-mk04",
  --"ball-mill-mk01",
  --"ball-mill-mk02",
  --"ball-mill-mk03",
  --"ball-mill-mk04",
  --"mukmoux-pasture",
  --"automated-factory-mk01",
  --"automated-factory-mk02",
  --"automated-factory-mk03",
  --"automated-factory-mk04",
  --"sand-extractor",
  --"sand-extractor-mk02",
  --"sand-extractor-mk03",
  --"sand-extractor-mk04",
  --"botanical-nursery",
  --"botanical-nursery-mk02",
  --"botanical-nursery-mk03",
  --"botanical-nursery-mk04",
  --"wpu",
  --"wpu-mk02",
  --"wpu-mk03",
  --"wpu-mk04",
  --"nexelit-plate",
  --"steel-plate2",
  --"advanced-foundry-copper-plate",
  --"advanced-foundry-iron-plate",
  --"advanced-foundry-stone-brick",
  --"advanced-foundry-iron-gear-wheel",
  --"advanced-foundry-pipe",
  --"advanced-foundry-steel-plate",
  --"advanced-foundry-iron-oxide",
  --"advanced-foundry-crushed-iron",
  --"advanced-foundry-crushed-copper",
	--"assembling-machine-1",
	--"assembling-machine-2",
	--"assembling-machine-3"
}

--adding to module limitation list
FUN.productivity(recipes_list)

-- Updating requester paste setting
if settings.startup['rpm_entity'].value ~= 30 or settings.startup['rpm_items'].value ~= 30 then
    log("Updating recipe requester paste values")
    --These types (data.raw[entity_type]) are placeable entities
    local entity_types = {'accumulator','artillery-turret','beacon','boiler','burner-generator','character','arithmetic-combinator','decider-combinator','constant-combinator','container','logistic-container','infinity-container','assembling-machine','rocket-silo','furnace','electric-energy-interface','electric-pole','unit-spawner','fish','combat-robot','construction-robot','logistic-robot','gate','generator','heat-interface','heat-pipe','inserter','lab','lamp','land-mine','linked-container','market','mining-drill','offshore-pump','pipe','infinity-pipe','pipe-to-ground','player-port','power-switch','programmable-speaker','pump','radar','curved-rail','straight-rail','rail-chain-signal','rail-signal','reactor','roboport','simple-entity','simple-entity-with-owner','simple-entity-with-force','solar-panel','spider-leg','storage-tank','train-stop','linked-belt','loader-1x1','loader','splitter','transport-belt','underground-belt','tree','turret','ammo-turret','electric-turret','fluid-turret','unit','car','artillery-wagon','cargo-wagon','fluid-wagon','locomotive','spider-vehicle','wall'}
    -- We store the result of each lookup so we don't have to do it again
    -- When iterating *the entire recipe table X every individual result* this is worthwhile!
    local valid_entities = {}
    -- This is only hit when we request an index that doesn't exist (name we haven't checked)
    -- We then check if it's an entity and make an entry for that answer, followed by returning that result
    setmetatable(valid_entities, {
        __index = function(self, index)
            local item = data.raw.item[index]
            -- Place result?
            if item and item.place_result then
                rawset(self, index, true)
                return true
            end
            -- Valid entity?
            for _, type_name in pairs(entity_types) do
                if data.raw[type_name][index] then
                    rawset(self, index, true)
                    return true
                end
            end
            -- Otherwise, nope!
            rawset(self, index, false)
            return false
        end
    })

    for _, recipe in pairs(data.raw.recipe) do
        for _, result_table in pairs({
            recipe.result and {recipe.result},
            recipe.results,
            recipe.normal and (recipe.normal.results or {recipe.normal.result}),
            recipe.expensive and (recipe.expensive.results or {recipe.normal.result})
        }) do
            for _, result in pairs(result_table) do -- This looks long, however we skip a lot of the logic with caching
                local result_name = result[1] or result.name
                if result_name and valid_entities[result_name] then
                    --log("Set multiplier for " .. recipe.name .. " (" .. result_name .. ")")
                    recipe.requester_paste_multiplier = settings.startup['rpm_entity'].value
                    goto continue
                end
            end
        end
        recipe.requester_paste_multiplier = settings.startup['rpm_items'].value
        ::continue::
    end
end
