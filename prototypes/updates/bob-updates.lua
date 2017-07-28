-------------------------------------------------------------------------------
--[[bob-updates.lua]]-- luacheck: globals bobmods
-------------------------------------------------------------------------------
local replace_ing = bobmods.lib.recipe.replace_ingredient
local remove_ing = bobmods.lib.recipe.remove_ingredient
local add_ing = bobmods.lib.recipe.add_ingredient
local add_result = bobmods.lib.recipe.add_result
local remove_result = bobmods.lib.recipe.remove_result
local add_prerequisite = bobmods.lib.tech.add_prerequisite

local change_value = function(recipe_str, field, val)
    local recipe = data.raw.recipe[recipe_str]
    if recipe then
        recipe[field] = val
    end
end

-------------------------------------------------------------------------------
--[[Entities]]--
-------------------------------------------------------------------------------
replace_ing("distilator", "pipe", "copper-pipe")
replace_ing("distilator", "electronic-circuit", "basic-circuit-board")

replace_ing("classifier", "electronic-circuit", "basic-electronic-circuit-board")

replace_ing("gasturbinemk02", "pipe", "bronze-pipe")
replace_ing("gasturbinemk02", "iron-plate", "invar-alloy")

--replace_ing("hpf", "stone-brick", "glass")
--replace_ing("hpf", "iron-gear-wheel", "steel-bearing")
--replace_ing("hpf", "iron-plate", "invar-alloy")
replace_ing("hpf", "electronic-circuit", "basic-circuit-board")

replace_ing("methanol-reactor", "chemical-plant", "electrolyser")
replace_ing("methanol-reactor", "iron-gear-wheel", "steel-bearing")

replace_ing("power-house", "iron-gear-wheel", "steel-bearing")
replace_ing("power-house", "iron-plate", "lead-plate")

replace_ing("evaporator", "steel-plate", "lead-plate")
replace_ing("evaporator", "iron-plate", "steel-gear-wheel")
replace_ing("evaporator", "iron-gear-wheel", "steel-bearing")

replace_ing("tailings-pond", "pump", "water-pump")

replace_ing("tar-processing-unit", "electronic-circuit", "basic-circuit-board")
replace_ing("tar-processing-unit", "pipe", "stone-pipe")

replace_ing("cooling-tower-mk01", "pipe", "copper-pipe")
replace_ing("cooling-tower-mk01", "iron-plate", "bronze-alloy")

replace_ing("cooling-tower-mk02", "pipe", "copper-pipe")
replace_ing("cooling-tower-mk02", "iron-plate", "brass-alloy")

replace_ing("desulfurizator-unit", "iron-plate", "invar-alloy")

replace_ing("soil-extractormk01", "electronic-circuit", "basic-circuit-board")

replace_ing("olefin-plant", "chemical-plant", "electrolyser")
replace_ing("olefin-plant", "iron-gear-wheel", "steel-bearing")

replace_ing("ground-borer", "iron-gear-wheel", "titanium-bearing")
replace_ing("ground-borer", "iron-plate", "titanium-plate")

replace_ing("fts-reactor", "stone-brick", "glass")
replace_ing("fts-reactor", "iron-gear-wheel", "steel-bearing")
replace_ing("fts-reactor", "iron-plate", "invar-alloy")
replace_ing("fts-reactor", "electronic-circuit", "basic-electronic-circuit-board")

replace_ing("washer", "electronic-circuit", "basic-circuit-board")

replace_ing("fawogae-plantation", "electronic-circuit", "basic-circuit-board")

replace_ing("ulric-corral", "electronic-circuit", "basic-circuit-board")
replace_ing("ulric-corral", "iron-gear-wheel", "steel-bearing")

replace_ing("advanced-foundry", "iron-plate", "titanium-plate") --updated-bob titanium-plate
replace_ing("advanced-foundry", "concrete", "glass") --updated-bob glass
replace_ing("advanced-foundry", "steel-plate", "invar-alloy") --updated-bob invar-alloy
--replace_ing("advanced-foundry"), "olefin-plant", steel-bearing} --updated-bob steel-bearing

replace_ing("solid-separator", "iron-gear-wheel", "steel-gear-wheel")
replace_ing("solid-separator", "advanced-circuit", "basic-electronic-circuit-board")

replace_ing("classifier", "iron-stick", "brass-gear-wheel")
--replace_ing("classifier", "iron-plate", "titanium-plate")

replace_ing("automated-factory", "electronic-circuit", "basic-electronic-circuit-board")

replace_ing("borax-mine", "electronic-circuit", "basic-circuit-board")
replace_ing("borax-mine", "iron-gear-wheel", "steel-bearing")

replace_ing("ralesia-plantation", "electronic-circuit", "basic-circuit-board")
replace_ing("ralesia-plantation", "pipe", "steel-pipe")
replace_ing("ralesia-plantation", "stone", "glass")

replace_ing("ulric-corral", "iron-gear-wheel", "steel-bearing")
replace_ing("ulric-corral", "electronic-circuit", "basic-circuit-board")

replace_ing("ore-crusher", "steel-plate", "invar-alloy")
replace_ing("ore-chusher", "electronic-circuit", "basic-electronic-circuit-board")
add_ing("ore-crusher", {name="rubber", amount=10})

add_ing("ball-mill", {name="steel-bearing-ball", amount=1000})

replace_ing("mukmoux-pasture", "advanced-circuit", "electronic-logic-board")

replace_ing("sand-extractor", "iron-gear-wheel", "brass-gear-wheel")
replace_ing("sand-extractor", "electronic-circuit", "basic-electronic-circuit-board")

add_ing("botanical-nursery", {name="glass", amount=10})
replace_ing("botanical-nursery", "electronic-circuit", "basic-circuit-board")

-------------------------------------------------------------------------------
--[[Items]]--
-------------------------------------------------------------------------------



replace_ing("glycerol-hydrogen", "water", "liquid-air")
remove_result("glycerol-hydrogen", "petroleum-gas")
add_result("glycerol-hydrogen", {type="fluid", name="hydrogen", amount=100})

remove_result("aromatics-to-rubber", "crude-oil")
add_result("aromatics-to-rubber", {type="item", name="rubber", amount=1})


add_ing("laser-turret", {name="lens", amount=1})

replace_ing("superior-circuit-board", "gold-plate", "nexelit-plate")

replace_ing("alumina", "bauxite-ore", "crushed-bauxite")
replace_ing("lead-oxide", "lead-ore", "crushed-lead")

replace_ing("zinc-chloride", "iron-plate", "zinc-plate")
replace_ing("zinc-chloride", "water", "hydrogen-chloride")
remove_ing("zinc-chloride", "copper-plate")
add_result("zinc-chloride", {name="hydrogen", amount=20})

add_result("ash-separation", {type="item", name="cobalt-ore", amount=3, probability=0.3})


replace_ing("active-carbon", "water", "nitrogen")
add_ing("active-carbon", {name="sodium-hydroxide", amount=7})

add_ing("advanced-circuit", {name="optical-fiber", amount=2})
add_ing("fibreglass-board", {name="glass", amount=2})

remove_result("bob-resin-wood", "resin")
add_result("bob-resin-wood", {type="item", name="resin", amount=3})

remove_result("refsyngas-from-meth", "water")
remove_result("refsyngas-from-meth-canister", "water")
add_result("refsyngas-from-meth", {type="fluid", name="hydrogen", amount=30})
add_result("refsyngas-from-meth-canister", {type="fluid", name="hydrogen", amount=30})

remove_ing("olefin", "water")
add_ing("olefin", {type="fluid", name="hydrogen", amount=600})

remove_result("aromatics", "water")
add_result("aromatics", {type="fluid", name="hydrogen", amount=100})

remove_ing("gasoline", "water")
add_ing("gasoline", {type="fluid", name="hydrogen", amount=200})

remove_ing("lithium-peroxide", "water")
add_ing("lithium-peroxide", {type="fluid", name="lithia-water", amount=300})

replace_ing("anthraquinone", "steam", "liquid-air")
replace_ing("flask", "iron-plate", "glass")

add_ing("ref_to_light-oil", {type="fluid", name="hydrogen", amount=250})

add_ing("combustion-olefin", {type="fluid", name="hydrogen", amount=150})

replace_ing("niobium-oxide", "water", "nitrogen-dioxide")

add_ing("filtration-media", {type="item", name="glass", amount=5})

replace_ing("methanol-from-syngas", "iron-plate", "zinc-plate")
replace_ing("flying-robot-frame", "steel-plate", "niobium-plate")
replace_ing("ralesia", "water", "hydrogen")
replace_ing("equipment-chassi", "copper-plate", "bronze-alloy")
replace_ing("lens", "stone", "glass")
replace_ing("diborane", "water", "hydrogen")
replace_ing("oleochemicals-distilation", "water", "oxygen")
replace_ing("oleo-gasification", "water", "oxygen")
replace_ing("tar-gasification", "water", "liquid-air")
replace_ing("niobium-dioxide", "water", "nitrogen-dioxide")
replace_ing("ppd", "water", "hydrogen")
replace_ing("aromatics2", "water", "hydrogen")
replace_ing("niobium-complex", "water", "hydrogen-chloride")
replace_ing("tpa", "steam", "liquid-air")
replace_ing("tpa", "copper-ore", "cobalt-ore")
replace_ing("science-pack-3", "copper-cable", "insulated-cable")
replace_ing("tailings-classification", "copper-ore", "lead-ore")
replace_ing("tailings-classification", "iron-ore", "tin-ore")
replace_ing("niobium-plate", "coal", "salt")
replace_ing("sulfur-crudeoil", "iron-ore", "salt")
replace_ing("glass-core", "sand", "glass")
replace_ing("glass-core", "steel-plate", "silver-plate")
replace_ing("nichrome", "water", "nitrogen")
replace_ing("nichrome", "iron-plate", "nickel-plate")
replace_ing("hydrogen-peroxide", "iron-plate", "nickel-plate")
replace_ing("circuit-board", "ferric-chloride-solution", "boric-acid")
replace_ing("superior-circuit-board", "ferric-chloride-solution", "boric-acid")
replace_ing("multi-layer-circuit-board", "ferric-chloride-solution", "boric-acid")
replace_ing("cladding", "sand", "glass")
replace_ing("aromatics-to-rubber", "plastic-bar", "rubber")
replace_ing("nas-battery", "copper-ore", "sodium-hydroxide")

--replace_ing("drill-head", "iron-plate", "titanium-plate")

replace_ing("empty-gas-canister", "copper-plate", "brass-alloy")
replace_ing("empty-gas-canister", "steel-plate", "aluminium-plate")
if data.raw["recipe-category"]["water-pump"] then
    data.raw.recipe["fill-methanol-gas-canister"].category = "water-pump"
    data.raw.recipe["empty-methanol-gas-canister"].category = "water-pump"
end

if data.raw["recipe-category"]["electrolysis"] then
    data.raw.recipe["diborane"].category = "electrolysis"
    data.raw.recipe["boric-acid"].category = "electrolysis"
    data.raw.recipe["niobium-plate"].category = "electrolysis"
    data.raw.recipe["ppd"].category = "electrolysis"
    data.raw.recipe["copper-coating"].category = "electrolysis"
	data.raw.recipe["glycerol-hydrogen"].category = "electrolysis"
end

local foundry = data.raw["assembling-machine"]["advanced-foundry"]
foundry.crafting_categories[#foundry.crafting_categories+1] = "chemical-furnace"
foundry.crafting_categories[#foundry.crafting_categories+1] = "mixing-furnace"

-------------------------------------------------------------------------------
--[[Tech]]--
-------------------------------------------------------------------------------
add_prerequisite("coal-processing-2", "electrolysis-1")

-------------------------------------------------------------------------------
--[[Categories]]--
-------------------------------------------------------------------------------
change_value("bob-resin-wood", "energy_required", 10)
change_value("bob-resin-wood", "category", "wpu")
change_value("polishing-wheel", "category", "wpu")
change_value("wooden-board", "energy_required", 10)
change_value("phenolic-board", "category", "wpu")
