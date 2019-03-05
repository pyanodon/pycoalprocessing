
if not settings.startup["py-show-barrel"].value then

local Allrecipes = table.deepcopy(data.raw.recipe)

	for r, recipe in pairs(Allrecipes) do
	
		local name = recipe.name
		
		if string.find(name, "fill-") then
		
			data.raw.recipe[name].hidden = true
		
		end
		
		if string.find(name, "empty-") then
		
			if name ~= "empty-barrel" then
		
				data.raw.recipe[name].hidden = true
			
			end
			
		end
	
	end

end
