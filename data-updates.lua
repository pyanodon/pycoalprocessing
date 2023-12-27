require("__stdlib__/stdlib/data/data").Util.create_data_globals()
local FUN = require("prototypes/functions/functions")

if mods.pyindustry then
    require('prototypes/updates/pyindustry-updates')
end

require('prototypes/updates/base-updates')
require("prototypes/updates/entity-updates")

ITEM("automation-science-pack", "tool"):set("icon", "__pycoalprocessinggraphics__/graphics/icons/science-pack-1.png")
ITEM("automation-science-pack", "tool"):set("icon_size", 64)
ITEM("automation-science-pack", "tool"):set("icon_mipmaps", nil)

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

RECIPE("small-electric-pole"):replace_result("small-electric-pole", {"small-electric-pole", amount = 1})

RECIPE("medium-electric-pole"):add_ingredient({type = "item", name = "niobium-plate", amount = 1}):replace_ingredient("copper-plate", {"copper-cable", 5}):replace_ingredient("iron-stick", {"nbfe-alloy", 2}):remove_ingredient('steel-plate')

RECIPE("big-electric-pole"):remove_ingredient("steel-plate"):remove_ingredient("copper-plate"):add_ingredient({type = "item", name = "niobium-plate", amount = 2}):add_ingredient({type = "item", name = "copper-cable", amount = 15}):replace_ingredient('iron-stick', {"steel-plate", 6})

RECIPE("chemical-plant"):remove_unlock('oil-processing'):set_fields{hidden = true}
table.insert(data.raw["assembling-machine"]["chemical-plant"].flags, "hidden")
ITEM("chemical-plant"):add_flag("hidden")

RECIPE("pump"):remove_unlock("fluid-handling"):add_unlock("engine")

require("prototypes/recipes/fuel-canister-recipes")

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

data.raw['item-subgroup']['science-pack'].group = 'production'
data.raw['item-subgroup']['science-pack'].order = 'y'

--gather recipes for module changes
local recipes_list =
	{
  "active-carbon",
  "air-pollution",
  "alien-sample01",
  "anthraquinone",
  "aromatics-to-lubricant",
  "aromatics-to-plastic",
  "aromatics-to-rubber",
  "aromatics",
  "aromatics2",
  "aromaticsolefin",
  "ash-separation",
  "bio-sample01",
  "bonemeal",
  "boron-trioxide",
  "cladded-core",
  "cladding",
  "co2-organics",
  "co2",
  "coal-briquette",
  "coal-fawogae",
  "coal-gas-from-coke",
  "coal-gas-from-wood",
  "coal-gas",
  "coaldust-ash",
  "coarse-classification",
  "coke-coal",
  "combustion-mixture2",
  "combustion-olefin",
  "concrete-richclay",
  "copper-coating",
  "creosote-to-aromatics",
  "creosote",
  "crushed-copper",
  "crushed-iron",
  "crushing-copper",
  "crushing-iron",
  "diborane",
  "dirty-reaction",
  "drill-head",
  "equipment-chassi",
  "eva-ree-dust",
  "explosive-glycerol",
  "extract-coarse",
  "extract-gravel",
  "extract-richdust",
  "extract-sand",
  "extract-stone",
  "extract-sulfur",
  "fawogae-substrate",
  "fawogae",
  "fuelrod-mk01",
  "glycerol-syngas",
  "ground-sample01",
  "heavy-oil_from_coal-gas",
  "heavy-oleo",
  "heavyoil-to-coal-gas",
  "iron-oxide",
  "kevlar-coating",
  "kevlar",
  "lab-instrument",
  "light-oil_from_syngas",
  "lightoil-to-syngas",
  "lime",
  "lithium-peroxide",
  "log-organics",
  "log-wood",
  "log1",
  "log2",
  "log3",
  "log4",
  "log5",
  "log6",
  "making-chromium",
  "mukmoux-fat",
  "nas-battery",
  "nbfe-coating",
  "nexelit-cartridge",
  "nichrome",
  "niobium-complex",
  "niobium-concentrate",
  "niobium-dust",
  "niobium-ore",
  "niobium-oxide",
  "niobium-powder",
  "olefin-petgas",
  "olefin",
  "oleo-gasification",
  "oleo-heavy",
  "oleo-methanol",
  "oleo-solidfuel",
  "oleochemicals-crude-oil",
  "oleochemicals-distilation",
  "oleochemicals",
  "optical-fiber",
  "organic-solvent",
  "organics-from-wood",
  "organics-processing",
  "petgas-from-refsyngas",
  "petgas-methanol",
  "petgas-to-refsyngas",
  "ppd",
  "ralesia-seeds",
  "ralesia",
  "raw-borax",
  "ref-to-light-oil",
  "refolefin",
  "refsyngas-from-meth-canister",
  "refsyngas-from-meth",
  "rich-clay",
  "rich-re",
  "richdust-separation",
  "sand-brick",
  "sand-classification",
  "saturated-nexelit-cartridge-regen",
  "slacked-lime",
  "soil-separation",
  "soil",
  "stone-distilation",
  "sulfur-crudeoil",
  "sulfur-heavyoil",
  "sulfur-lightoil",
  "sulfur-petgas",
  "sulfuric-petgas",
  "tailings-borax-niobium",
  "tailings-classification",
  "tailings-copper-iron",
  "tailings-dust",
  "tailings-separation",
  "tpa",
  "wood-to-coal",
  "zinc-chloride",
}

if not mods["pypetroleumhandling"] then
    table.insert(recipes_list, "niobium-plate")
end

--adding to module limitation list
FUN.productivity(recipes_list)

-- Updating requester paste setting
if settings.startup['rpm_entity'].value ~= 30 or settings.startup['rpm_items'].value ~= 30 then
  --log("Updating recipe requester paste values")
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
            recipe.expensive and (recipe.expensive.results or {recipe.expensive.result})
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

RECIPE('beacon')
    :add_ingredient{'sc-engine', 2}
    :add_ingredient{'magnetic-ring', 10}
    :add_ingredient{'intelligent-unit', 1}
    :add_ingredient{'parametric-oscilator', 1}
    :add_ingredient{'biopolymer', 10}
    :add_ingredient{'super-alloy', 10}:remove_ingredient{'steel-plate'}
    :add_ingredient{'tower-mk04', 1}
    :add_ingredient{'processing-unit', 5}:remove_ingredient{'electronic-circuit'}:remove_ingredient{'advanced-circuit'}
    :add_ingredient{'metastable-quasicrystal', 1}
    :add_ingredient{type = 'fluid', name = 'r4', amount = 100}
if mods.pyalternativeenergy then data.raw.recipe.beacon.category = 'crafting-with-fluid' end

RECIPE('beacon-mk01')
    :add_ingredient{'self-assembly-monolayer', 1}
    :add_ingredient{'mechanical-parts-02', 1}
    :add_ingredient{'eva', 10}
    :add_ingredient{'stainless-steel', 10}:remove_ingredient{'steel-plate'}
    :add_ingredient{'tower-mk02', 1}


if register_cache_file ~= nil then
    register_cache_file({"pycoalprocessing"}, "__pycoalprocessing__/cached-configs/pycoalprocessing.lua")
end
