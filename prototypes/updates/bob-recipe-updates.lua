--luacheck: globals bobmods

--Entity recipe ingredients
bobmods.lib.recipe.replace_ingredient("distilator", "pipe", "copper-pipe")

bobmods.lib.recipe.replace_ingredient("gasturbinemk02", "pipe", "bronze-pipe")
bobmods.lib.recipe.replace_ingredient("gasturbinemk02", "iron-plate", "invar-alloy")

bobmods.lib.recipe.replace_ingredient("hpf", "stone-brick", "glass")
bobmods.lib.recipe.replace_ingredient("hpf", "iron-gear-wheel", "steel-bearing")
bobmods.lib.recipe.replace_ingredient("hpf", "iron-plate", "invar-alloy")

bobmods.lib.recipe.replace_ingredient("methanol-reactor", "chemical-plant", "electrolyser")
bobmods.lib.recipe.replace_ingredient("methanol-reactor", "iron-gear-wheel", "steel-bearing")

bobmods.lib.recipe.replace_ingredient("power-house", "iron-gear-wheel", "steel-bearing")
bobmods.lib.recipe.replace_ingredient("power-house", "iron-plate", "lead-plate")

bobmods.lib.recipe.replace_ingredient("quenching-tower", "pipe", "stone-pipe")

bobmods.lib.recipe.replace_ingredient("tailings-pond", "small-pump", "water-pump")

bobmods.lib.recipe.replace_ingredient("tar-processing-unit", "electronic-circuit", "basic-circuit-board")
bobmods.lib.recipe.replace_ingredient("tar-processing-unit", "pipe", "stone-pipe")

bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "pipe", "copper-pipe")
bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "iron-gear-wheel", "brass-gear-wheel")
bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "iron-plate", "brass-plate")

bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "steel-plate", "lead-pipe")
bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "iron-gear-wheel", "steel-gear-wheel")
bobmods.lib.recipe.replace_ingredient("cooling-tower-mk01", "iron-plate", "steel-bearing")

bobmods.lib.recipe.replace_ingredient("dessulfurizator-unit", "steel-plate", "titanium-plate")
bobmods.lib.recipe.replace_ingredient("dessulfurizator-unit", "iron-plate", "invar-alloy")

--items
bobmods.lib.recipe.replace_ingredient("methanol-from-syngas", "iron-ore", "zinc-ore")

bobmods.lib.recipe.replace_ingredient("zinc-chloride", "iron-plate", "zinc-plate")
bobmods.lib.recipe.replace_ingredient("zinc-chloride", "water", "hydrogen-chloride")
bobmods.lib.recipe.remove_ingredient("zinc-chloride", "copper-plate")
bobmods.lib.recipe.add_result("zinc-chloride", {name="hydrogen", amount=2})

bobmods.lib.recipe.replace_ingredient("methanol-canister", "copper-plate", "brass-plate")
bobmods.lib.recipe.replace_ingredient("methanol-canister", "steel-plate", "aluminium-plate")
data.raw.recipe["fill-methanol-canister"].category="water-pump"
data.raw.recipe["empty-methanol-canister"].category="water-pump"

bobmods.lib.recipe.replace_ingredient("active-carbon", "water", "hydrogen")
bobmods.lib.recipe.add_ingredient("active-carbon", {name="sodium-hydroxide", amount=15})

bobmods.lib.recipe.remove_result("refsyngas-from-meth", "water")
bobmods.lib.recipe.remove_result("refsyngas-from-meth-canister", "water")
bobmods.lib.recipe.add_result("refsyngas-from-meth", {type="fluid", name="hydrogen", amount=3})
bobmods.lib.recipe.add_result("refsyngas-from-meth-canister", {type="fluid", name="hydrogen", amount=3})

bobmods.lib.tech.add_prerequisite("coal-processing2", "electrolysis-1")
--techs
