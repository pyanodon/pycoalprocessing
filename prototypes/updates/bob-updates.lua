-------------------------------------------------------------------------------
--[[bob-updates.lua]]-- luacheck: globals bobmods
-------------------------------------------------------------------------------
local replace_ing = bobmods.lib.recipe.replace_ingredient
local remove_ing = bobmods.lib.recipe.remove_ingredient
local add_ing = bobmods.lib.recipe.add_ingredient
local add_result = bobmods.lib.recipe.add_result
local remove_result = bobmods.lib.recipe.remove_result
local add_prerequisite = bobmods.lib.tech.add_prerequisite

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

replace_ing("quenching-tower", "pipe", "stone-pipe")

replace_ing("tailings-pond", "small-pump", "water-pump")

replace_ing("tar-processing-unit", "electronic-circuit", "basic-circuit-board")
replace_ing("tar-processing-unit", "pipe", "stone-pipe")

replace_ing("cooling-tower-mk01", "pipe", "copper-pipe")
replace_ing("cooling-tower-mk01", "iron-gear-wheel", "brass-gear-wheel")
replace_ing("cooling-tower-mk01", "iron-plate", "brass-alloy")

replace_ing("cooling-tower-mk01", "steel-plate", "lead-plate")
replace_ing("cooling-tower-mk01", "iron-gear-wheel", "steel-gear-wheel")
replace_ing("cooling-tower-mk01", "iron-plate", "steel-bearing")

replace_ing("desulfurizator-unit", "steel-plate", "titanium-plate")
replace_ing("desulfurizator-unit", "iron-plate", "invar-alloy")

--replace_ing("soil-extractormk01", "steel-plate", "brass-alloy")
--replace_ing("soil-extractormk01", "iron-gear-wheel", "brass-gear-wheel")
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
replace_ing("washer", "pipe", "steel-pipe")

replace_ing("fawogae-plantation", "electronic-circuit", "basic-circuit-board")

replace_ing("ulric-corral", "electronic-circuit", "basic-circuit-board")
replace_ing("ulric-corral", "iron-gear-wheel", "steel-bearing")

replace_ing("advanced-foundry", "iron-plate", "titanium-plate") --updated-bob titanium-plate
replace_ing("advanced-foundry", "concrete", "glass") --updated-bob glass
--replace_ing("advanced-foundry"), "olefin-plant", steel-bearing} --updated-bob steel-bearing
replace_ing("advanced-foundry", "steel-plate", "invar-alloy") --updated-bob invar-alloy

replace_ing("solid-separator", "iron-gear-wheel", "brass-gear-wheel")
replace_ing("solid-separator", "advanced-circuit", "basic-electronic-circuit-board")

--replace_ing("classifier", "iron-plate", "titanium-plate")
replace_ing("classifier", "iron-stick", "brass-gear-wheel")

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

-------------------------------------------------------------------------------
--[[Items]]--
-------------------------------------------------------------------------------
replace_ing("methanol-from-syngas", "iron-ore", "zinc-ore")

replace_ing("zinc-chloride", "iron-plate", "zinc-plate")
replace_ing("zinc-chloride", "water", "hydrogen-chloride")
remove_ing("zinc-chloride", "copper-plate")
add_result("zinc-chloride", {name="hydrogen", amount=2})

replace_ing("empty-gas-canister", "copper-plate", "brass-alloy")
replace_ing("empty-gas-canister", "steel-plate", "aluminium-plate")
if data.raw["recipe-category"]["water-pump"] then
    data.raw.recipe["fill-methanol-gas-canister"].category = "water-pump"
    data.raw.recipe["empty-methanol-gas-canister"].category = "water-pump"
end

replace_ing("active-carbon", "water", "nitrogen")
add_ing("active-carbon", {name="sodium-hydroxide", amount=7})

add_ing("advanced-circuit", {name="optical-fiber", amount=2})

remove_result("refsyngas-from-meth", "water")
remove_result("refsyngas-from-meth-canister", "water")
add_result("refsyngas-from-meth", {type="fluid", name="hydrogen", amount=3})
add_result("refsyngas-from-meth-canister", {type="fluid", name="hydrogen", amount=3})

remove_ing("olefin", "water")
add_ing("olefin", {type="fluid", name="hydrogen", amount=60})

remove_result("aromatics", "water")
add_result("aromatics", {type="fluid", name="hydrogen", amount=10})

replace_ing("nichrome", "water", "nitrogen")
replace_ing("nichrome", "iron-plate", "nickel-plate")

replace_ing("hydrogen-peroxide", "iron-plate", "nickel-plate")

--replace_ing("drill-head", "iron-plate", "titanium-plate")

remove_ing("gasoline", "water")
add_ing("gasoline", {type="fluid", name="hydrogen", amount=20})

remove_ing("lithium-peroxide", "water")
add_ing("lithium-peroxide", {type="fluid", name="lithia-water", amount=30})

remove_ing("anthraquinone", "water")
add_ing("anthraquinone", {type="fluid", name="liquid-air", amount=60})

replace_ing("flask", "iron-plate", "glass")

add_ing("ref_to_light-oil", {type="fluid", name="hydrogen", amount=25})
--add_ing("ref_to_petroleum-gas", {type="fluid", name="hydrogen", amount=35})
add_ing("combustion-olefin", {type="fluid", name="hydrogen", amount=15})

replace_ing("ralesia", "water", "hydrogen")

replace_ing("equipment-chassi", "copper-plate", "bronze-alloy")

replace_ing("lens", "stone", "glass")

replace_ing("diborane", "water", "hydrogen")

if data.raw["recipe-category"]["electrolysis"] then
    data.raw.recipe["diborane"].category = "electrolysis"
end

-------------------------------------------------------------------------------
--[[Tech]]--
-------------------------------------------------------------------------------
add_prerequisite("coal-processing-2", "electrolysis-1")
