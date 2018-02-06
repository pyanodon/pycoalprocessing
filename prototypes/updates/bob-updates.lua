--[[bob-updates.lua]] -- luacheck: globals bobmods

local add_result = bobmods.lib.recipe.add_result
local remove_result = bobmods.lib.recipe.remove_result

Recipe("distilator"):rep_ing("pipe", "copper-pipe"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("classifier"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("gasturbinemk02"):rep_ing("pipe", "bronze-pipe"):rep_ing("iron-plate", "invar-alloy")

Recipe("hpf"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("methanol-reactor"):rep_ing("chemical-plant", "electrolyser"):rep_ing("iron-gear-wheel", "steel-bearing")

Recipe("power-house"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("iron-plate", "lead-plate")

Recipe("evaporator"):rep_ing("steel-plate", "lead-plate"):rep_ing("iron-plate", "steel-gear-wheel"):rep_ing("iron-gear-wheel", "steel-bearing")

Recipe("tailings-pond"):rep_ing("pump", "water-pump")

Recipe("tar-processing-unit"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("pipe", "stone-pipe")

Recipe("cooling-tower-mk01"):rep_ing("pipe", "copper-pipe"):rep_ing("iron-plate", "bronze-alloy")

Recipe("cooling-tower-mk02"):rep_ing("pipe", "copper-pipe"):rep_ing("iron-plate", "brass-alloy")

Recipe("desulfurizator-unit"):rep_ing("iron-plate", "invar-alloy")

Recipe("soil-extractormk01"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("olefin-plant"):rep_ing("chemical-plant", "electrolyser"):rep_ing("iron-gear-wheel", "steel-bearing")

Recipe("ground-borer"):rep_ing("iron-gear-wheel", "titanium-bearing"):rep_ing("iron-plate", "titanium-plate")

Recipe("fts-reactor"):rep_ing("stone-brick", "glass"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("iron-plate", "invar-alloy"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("washer"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("fawogae-plantation"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("ulric-corral"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("iron-gear-wheel", "steel-bearing")

Recipe("advanced-foundry"):rep_ing("iron-plate", "titanium-plate"):rep_ing("concrete", "glass"):rep_ing("steel-plate", "invar-alloy")

Recipe("solid-separator"):rep_ing("iron-gear-wheel", "steel-gear-wheel")
Recipe("solid-separator"):rep_ing("advanced-circuit", "basic-circuit-board")

Recipe("classifier"):rep_ing("iron-stick", "brass-gear-wheel")

Recipe("automated-factory"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("borax-mine"):rep_ing("electronic-circuit", "basic-circuit-board")
Recipe("borax-mine"):rep_ing("iron-gear-wheel", "steel-bearing")

Recipe("ralesia-plantation"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("pipe", "steel-pipe"):rep_ing("stone", "glass")

Recipe("ulric-corral"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("jaw-crusher"):rep_ing("steel-plate", "invar-alloy"):rep_ing("electronic-circuit", "basic-circuit-board"):add_ing({name = "rubber", amount = 10})

Recipe("ball-mill"):add_ingredient({name = "steel-bearing-ball", amount = 1000})

Recipe("sand-extractor"):rep_ing("iron-gear-wheel", "brass-gear-wheel"):rep_ing("electronic-circuit", "basic-circuit-board")

Recipe("botanical-nursery"):rep_ing("electronic-circuit", "basic-circuit-board"):add_ing({name = "glass", amount = 10})

Recipe("glycerol-hydrogen"):rep_ing("water", "liquid-air")

remove_result("glycerol-hydrogen", "petroleum-gas")
add_result("glycerol-hydrogen", {type = "fluid", name = "hydrogen", amount = 300})

remove_result("aromatics-to-rubber", "crude-oil")
add_result("aromatics-to-rubber", {type = "item", name = "rubber", amount = 1})

Recipe("laser-turret"):add_ing({name = "lens", amount = 1})

Recipe("superior-circuit-board"):rep_ing("gold-plate", "nexelit-plate")

Recipe("alumina"):rep_ing("bauxite-ore", "crushed-bauxite")

Recipe("lead-oxide"):rep_ing("lead-ore", "crushed-lead")

Recipe("zinc-chloride"):rep_ing("iron-plate", "zinc-plate"):rep_ing("water", "hydrogen-chloride"):rem_ing("copper-plate")

add_result("zinc-chloride", {name = "hydrogen", amount = 20})
add_result("ash-separation", {type = "item", name = "cobalt-ore", amount = 3, probability = 0.3})

Recipe("active-carbon"):rep_ing("water", "nitrogen"):add_ing({name = "sodium-hydroxide", amount = 7})

Recipe("advanced-circuit"):add_ing({name = "optical-fiber", amount = 2})
Recipe("fibreglass-board"):add_ing({name = "glass", amount = 2})

remove_result("bob-resin-wood", "resin")
add_result("bob-resin-wood", {type = "item", name = "resin", amount = 3})

remove_result("refsyngas-from-meth", "water")
remove_result("refsyngas-from-meth-canister", "water")
add_result("refsyngas-from-meth", {type = "fluid", name = "hydrogen", amount = 30})
add_result("refsyngas-from-meth-canister", {type = "fluid", name = "hydrogen", amount = 30})

Recipe("olefin"):rem_ing("water"):add_ing({type = "fluid", name = "hydrogen", amount = 600})

remove_result("aromatics", "water")
add_result("aromatics", {type = "fluid", name = "hydrogen", amount = 100})

Recipe("gasoline"):rem_ing("gasoline", "water"):add_ing({type = "fluid", name = "hydrogen", amount = 200})

Recipe("lithium-peroxide"):rem_ing("water"):add_ing({type = "fluid", name = "lithia-water", amount = 300})

Recipe("anthraquinone"):rep_ing("steam", "liquid-air")
Recipe("flask"):rep_ing("iron-plate", "glass")

Recipe("ref-to-light-oil"):add_ing({type = "fluid", name = "hydrogen", amount = 250})

Recipe("combustion-olefin"):add_ing({type = "fluid", name = "hydrogen", amount = 150})

Recipe("niobium-oxide"):rep_ing("water", "nitrogen-dioxide")

Recipe("filtration-media"):add_ing({type = "item", name = "glass", amount = 5})

Recipe("methanol-from-syngas"):rep_ing("iron-plate", "zinc-plate")
Recipe("flying-robot-frame"):rep_ing("steel-plate", "niobium-plate")
Recipe("ralesia"):rep_ing("water", "hydrogen")
Recipe("equipment-chassi"):rep_ing("copper-plate", "bronze-alloy")
Recipe("lens"):rep_ing("stone", "glass")
Recipe("diborane"):rep_ing("water", "hydrogen")
Recipe("oleochemicals-distilation"):rep_ing("water", "oxygen")
Recipe("oleo-gasification"):rep_ing("water", "oxygen")
Recipe("tar-gasification"):rep_ing("water", "liquid-air")
Recipe("ppd"):rep_ing("water", "hydrogen")
Recipe("aromatics2"):rep_ing("water", "hydrogen")
Recipe("niobium-complex"):rep_ing("water", "hydrogen-chloride")
Recipe("tpa"):rep_ing("steam", "liquid-air")
Recipe("tpa"):rep_ing("copper-ore", "cobalt-ore")
Recipe("science-pack-3"):rep_ing("copper-cable", "insulated-cable")
Recipe("tailings-classification"):rep_ing("copper-ore", "lead-ore")
Recipe("tailings-classification"):rep_ing("iron-ore", "tin-ore")
Recipe("niobium-plate"):rep_ing("coal", "salt")
Recipe("sulfur-crudeoil"):rep_ing("iron-ore", "salt")
Recipe("glass-core"):rep_ing("sand", "glass")
Recipe("glass-core"):rep_ing("steel-plate", "silver-plate")
Recipe("nichrome"):rep_ing("water", "nitrogen")
Recipe("nichrome"):rep_ing("iron-plate", "nickel-plate")
Recipe("hydrogen-peroxide"):rep_ing("iron-plate", "nickel-plate")
Recipe("circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
Recipe("superior-circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
Recipe("multi-layer-circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
Recipe("cladding"):rep_ing("sand", "glass")
Recipe("aromatics-to-rubber"):rep_ing("plastic-bar", "rubber")
Recipe("nas-battery"):rep_ing("copper-ore", "sodium-hydroxide")

Recipe("empty-gas-canister"):rep_ing("copper-plate", "brass-alloy")
Recipe("empty-gas-canister"):rep_ing("steel-plate", "aluminium-plate")

if data.raw["recipe-category"]["water-pump"] then
    Recipe("fill-methanol-gas-canister").category = "water-pump"
    Recipe("empty-methanol-gas-canister").category = "water-pump"
end

if data.raw["recipe-category"]["electrolysis"] then
    Recipe("diborane").category = "electrolysis"
    Recipe("boric-acid").category = "electrolysis"
    Recipe("niobium-plate").category = "electrolysis"
    Recipe("ppd").category = "electrolysis"
    Recipe("copper-coating").category = "electrolysis"
    Recipe("glycerol-hydrogen").category = "electrolysis"
end

local foundry = data.raw["assembling-machine"]["advanced-foundry"]
foundry.crafting_categories[#foundry.crafting_categories + 1] = "chemical-furnace"
foundry.crafting_categories[#foundry.crafting_categories + 1] = "mixing-furnace"

Technology("coal-processing-2"):add_prereq("electrolysis-1")

Recipe("bob-resin-wood").energy_required = 10
Recipe("bob-resin-wood").category = "wpu"
Recipe("polishing-wheel").category = "wpu"
Recipe("wooden-board").energy_required = 10
Recipe("phenolic-board").category = "wpu"
Recipe("nbfe-alloy").category ="smelting"
Recipe("hpf").enabled = true
