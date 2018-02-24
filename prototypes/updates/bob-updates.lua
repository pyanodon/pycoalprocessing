--[[bob-updates.lua]] -- luacheck: globals bobmods

local add_result = bobmods.lib.recipe.add_result
local remove_result = bobmods.lib.recipe.remove_result

RECIPE("distilator"):rep_ing("pipe", "copper-pipe"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("classifier"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("gasturbinemk02"):rep_ing("pipe", "bronze-pipe"):rep_ing("iron-plate", "invar-alloy")

RECIPE("hpf"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("methanol-reactor"):rep_ing("chemical-plant", "electrolyser"):rep_ing("iron-gear-wheel", "steel-bearing")

RECIPE("power-house"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("iron-plate", "lead-plate")

RECIPE("evaporator"):rep_ing("steel-plate", "lead-plate"):rep_ing("iron-plate", "steel-gear-wheel"):rep_ing("iron-gear-wheel", "steel-bearing")

RECIPE("tailings-pond"):rep_ing("pump", "water-pump")

RECIPE("tar-processing-unit"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("pipe", "stone-pipe")

RECIPE("cooling-tower-mk01"):rep_ing("pipe", "copper-pipe"):rep_ing("iron-plate", "bronze-alloy")

RECIPE("cooling-tower-mk02"):rep_ing("pipe", "copper-pipe"):rep_ing("iron-plate", "brass-alloy")

RECIPE("desulfurizator-unit"):rep_ing("iron-plate", "invar-alloy")

RECIPE("soil-extractormk01"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("olefin-plant"):rep_ing("chemical-plant", "electrolyser"):rep_ing("iron-gear-wheel", "steel-bearing")

RECIPE("ground-borer"):rep_ing("iron-gear-wheel", "titanium-bearing"):rep_ing("iron-plate", "titanium-plate")

RECIPE("fts-reactor"):rep_ing("stone-brick", "glass"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("iron-plate", "invar-alloy"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("washer"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("fawogae-plantation"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("ulric-corral"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("iron-gear-wheel", "steel-bearing")

RECIPE("advanced-foundry"):rep_ing("iron-plate", "titanium-plate"):rep_ing("concrete", "glass"):rep_ing("steel-plate", "invar-alloy")

RECIPE("solid-separator"):rep_ing("iron-gear-wheel", "steel-gear-wheel")
RECIPE("solid-separator"):rep_ing("advanced-circuit", "basic-circuit-board")

RECIPE("classifier"):rep_ing("iron-stick", "brass-gear-wheel")

RECIPE("automated-factory"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("borax-mine"):rep_ing("electronic-circuit", "basic-circuit-board")
RECIPE("borax-mine"):rep_ing("iron-gear-wheel", "steel-bearing")

RECIPE("ralesia-plantation"):rep_ing("electronic-circuit", "basic-circuit-board"):rep_ing("pipe", "steel-pipe"):rep_ing("stone", "glass")

RECIPE("ulric-corral"):rep_ing("iron-gear-wheel", "steel-bearing"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("jaw-crusher"):rep_ing("steel-plate", "invar-alloy"):rep_ing("electronic-circuit", "basic-circuit-board"):add_ing({name = "rubber", amount = 10})

RECIPE("ball-mill"):add_ingredient({name = "steel-bearing-ball", amount = 1000})

RECIPE("sand-extractor"):rep_ing("iron-gear-wheel", "brass-gear-wheel"):rep_ing("electronic-circuit", "basic-circuit-board")

RECIPE("botanical-nursery"):rep_ing("electronic-circuit", "basic-circuit-board"):add_ing({name = "glass", amount = 10})

RECIPE("glycerol-hydrogen"):rep_ing("water", "liquid-air")

remove_result("glycerol-hydrogen", "petroleum-gas")
add_result("glycerol-hydrogen", {type = "fluid", name = "hydrogen", amount = 300})

remove_result("aromatics-to-rubber", "crude-oil")
add_result("aromatics-to-rubber", {type = "item", name = "rubber", amount = 1})

RECIPE("laser-turret"):add_ing({name = "lens", amount = 1})

RECIPE("superior-circuit-board"):rep_ing("gold-plate", "nexelit-plate")

RECIPE("alumina"):rep_ing("bauxite-ore", "crushed-bauxite")

RECIPE("lead-oxide"):rep_ing("lead-ore", "crushed-lead")

RECIPE("zinc-chloride"):rep_ing("iron-plate", "zinc-plate"):rep_ing("water", "hydrogen-chloride"):rem_ing("copper-plate")

add_result("zinc-chloride", {name = "hydrogen", amount = 20})
add_result("ash-separation", {type = "item", name = "cobalt-ore", amount = 3, probability = 0.3})

RECIPE("active-carbon"):rep_ing("water", "nitrogen"):add_ing({name = "sodium-hydroxide", amount = 7})

RECIPE("advanced-circuit"):add_ing({name = "optical-fiber", amount = 2})
RECIPE("fibreglass-board"):add_ing({name = "glass", amount = 2})

remove_result("bob-resin-wood", "resin")
add_result("bob-resin-wood", {type = "item", name = "resin", amount = 3})

remove_result("refsyngas-from-meth", "water")
remove_result("refsyngas-from-meth-canister", "water")
add_result("refsyngas-from-meth", {type = "fluid", name = "hydrogen", amount = 30})
add_result("refsyngas-from-meth-canister", {type = "fluid", name = "hydrogen", amount = 30})

RECIPE("olefin"):rem_ing("water"):add_ing({type = "fluid", name = "hydrogen", amount = 600})

remove_result("aromatics", "water")
add_result("aromatics", {type = "fluid", name = "hydrogen", amount = 100})

RECIPE("gasoline"):rem_ing("gasoline", "water"):add_ing({type = "fluid", name = "hydrogen", amount = 200})

RECIPE("lithium-peroxide"):rem_ing("water"):add_ing({type = "fluid", name = "lithia-water", amount = 300})

RECIPE("anthraquinone"):rep_ing("steam", "liquid-air")
RECIPE("flask"):rep_ing("iron-plate", "glass")

RECIPE("ref-to-light-oil"):add_ing({type = "fluid", name = "hydrogen", amount = 250})

RECIPE("combustion-olefin"):add_ing({type = "fluid", name = "hydrogen", amount = 150})

RECIPE("niobium-oxide"):rep_ing("water", "nitrogen-dioxide")

RECIPE("filtration-media"):add_ing({type = "item", name = "glass", amount = 5})

RECIPE("methanol-from-syngas"):rep_ing("iron-plate", "zinc-plate")
RECIPE("flying-robot-frame"):rep_ing("steel-plate", "niobium-plate")
RECIPE("ralesia"):rep_ing("water", "hydrogen")
RECIPE("equipment-chassi"):rep_ing("copper-plate", "bronze-alloy")
RECIPE("lens"):rep_ing("stone", "glass")
RECIPE("diborane"):rep_ing("water", "hydrogen")
RECIPE("oleochemicals-distilation"):rep_ing("water", "oxygen")
RECIPE("oleo-gasification"):rep_ing("water", "oxygen")
RECIPE("tar-gasification"):rep_ing("water", "liquid-air")
RECIPE("ppd"):rep_ing("water", "hydrogen")
RECIPE("aromatics2"):rep_ing("water", "hydrogen")
RECIPE("niobium-complex"):rep_ing("water", "hydrogen-chloride")
RECIPE("tpa"):rep_ing("steam", "liquid-air")
RECIPE("tpa"):rep_ing("copper-ore", "cobalt-ore")
RECIPE("science-pack-3"):rep_ing("copper-cable", "insulated-cable")
RECIPE("tailings-classification"):rep_ing("copper-ore", "lead-ore")
RECIPE("tailings-classification"):rep_ing("iron-ore", "tin-ore")
RECIPE("niobium-plate"):rep_ing("coal", "salt")
RECIPE("sulfur-crudeoil"):rep_ing("iron-ore", "salt")
RECIPE("glass-core"):rep_ing("sand", "glass")
RECIPE("glass-core"):rep_ing("steel-plate", "silver-plate")
RECIPE("nichrome"):rep_ing("water", "nitrogen")
RECIPE("nichrome"):rep_ing("iron-plate", "nickel-plate")
RECIPE("hydrogen-peroxide"):rep_ing("iron-plate", "nickel-plate")
RECIPE("circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
RECIPE("superior-circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
RECIPE("multi-layer-circuit-board"):rep_ing("ferric-chloride-solution", "boric-acid")
RECIPE("cladding"):rep_ing("sand", "glass")
RECIPE("aromatics-to-rubber"):rep_ing("plastic-bar", "rubber")
RECIPE("nas-battery"):rep_ing("copper-ore", "sodium-hydroxide")

RECIPE("empty-gas-canister"):rep_ing("copper-plate", "brass-alloy")
RECIPE("empty-gas-canister"):rep_ing("steel-plate", "aluminium-plate")

if data.raw["recipe-category"]["water-pump"] then
    RECIPE("fill-methanol-gas-canister").category = "water-pump"
    RECIPE("empty-methanol-gas-canister").category = "water-pump"
end

if data.raw["recipe-category"]["electrolysis"] then
    RECIPE("diborane").category = "electrolysis"
    RECIPE("boric-acid").category = "electrolysis"
    RECIPE("niobium-plate").category = "electrolysis"
    RECIPE("ppd").category = "electrolysis"
    RECIPE("copper-coating").category = "electrolysis"
    RECIPE("glycerol-hydrogen").category = "electrolysis"
end

local foundry = data.raw["assembling-machine"]["advanced-foundry"]
foundry.crafting_categories[#foundry.crafting_categories + 1] = "chemical-furnace"
foundry.crafting_categories[#foundry.crafting_categories + 1] = "mixing-furnace"

TECHNOLOGY("coal-processing-2"):add_prereq("electrolysis-1")

RECIPE("bob-resin-wood").energy_required = 10
RECIPE("bob-resin-wood").category = "wpu"
RECIPE("polishing-wheel").category = "wpu"
RECIPE("wooden-board").energy_required = 10
RECIPE("phenolic-board").category = "wpu"
RECIPE("nbfe-alloy").category ="smelting"
RECIPE("hpf").enabled = true
