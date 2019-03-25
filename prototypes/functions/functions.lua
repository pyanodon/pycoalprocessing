local overrides={}
--add productivity to all recipes
function overrides.productivity(recipes_list)
	for _, r in pairs(data.raw.module) do
		if r.name:find("productivity%-module") and r.limitation then
			for _, recipe in pairs(recipes_list) do
				if data.raw.recipe[recipe] ~= nil then
					table.insert(r.limitation, recipe)
				end
			end
		end
	end
end

return overrides
