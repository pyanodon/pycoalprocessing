local overrides={}

function overrides.recipe_add_prod(recipes_list,Cat_list)
	local AllRecipes = table.deepcopy(data.raw.recipe)
for i, Recipe in pairs(AllRecipes) do
	for k, Cat in ipairs(Cat_list) do
		if Recipe.category == Cat then
		local Name = table.deepcopy(Recipe.name)
		table.insert(recipes_list, Name)
		end
	end
end
return recipes_list
end

function overrides.add_buildings(recipes_list)
	local AR = table.deepcopy(data.raw.recipe)
	for _, rec in pairs(AR) do
		if data.raw["assembling-machine"][rec.name] ~= nil then
			if string.find(data.raw["assembling-machine"][rec.name].icon, "__py") ~= nil then
			--or string.find(data.raw["roboport"][rec.name].icon, "__py") ~= nil
				table.insert(recipes_list, rec.name)
			end
		end
	end
return recipes_list
end
	
--add productivity to all recipes
function overrides.productivity(recipes_list)
	for _, r in pairs(data.raw.module) do
		if r.name:find("productivity%-module") and r.limitation then
			for _, recipe in pairs(recipes_list) do
				table.insert(r.limitation, recipe)
				--[[if data.raw.item[recipe] ~= nil then
					data.raw.item[recipe].subgroup = "test-processing"
				end]]
			end
		end
	end
end

return overrides