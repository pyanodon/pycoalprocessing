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

function overrides.ing_adjust(recipe, ingredient, amount)
	if data.raw.recipe[recipe] ~= nil then
		local r = data.raw.recipe[recipe]
		if r.normal ~= nil then
			for _, i in pairs(r.normal.ingredients) do
				if i.name ~= nil then
					if i.name == ingredient then
						i.amount = amount
					end
				elseif type(i[1]) == "string" then
					if i[1] == ingredient then
						i[2] = amount
					end
				end
			end
		end
		if r.expensive ~= nil then
			for _, i in pairs(r.expensive.ingredients) do
				if i.name ~= nil then
					if i.name == ingredient then
						i.amount = i.amount + amount
					end
				elseif type(i[1]) == "string" then
					if i[1] == ingredient then
						i[2] = amount
					end
				end
			end
		end
		if r.ingredients ~= nil then
			for _, i in pairs(r.ingredients) do
				if i.name ~= nil then
					if i.name == ingredient then
						i.amount = amount
					end
				elseif type(i[1]) == "string" then
					if i[1] == ingredient then
						i[2] = amount
					end
				end
			end
		end
	end
end

-- add item/fluid to recipe results
function overrides.add_result(recipe, result)
    -- log(serpent.block(recipe))
    -- log(serpent.block(result))
    -- check that recipe exists before doing anything else
    if data.raw.recipe[recipe] ~= nil then
        -- check if result is item or fluid and that it exists
        if data.raw.item[result.name] ~= nil or data.raw.fluid[result.name] ~= nil then
            -- check if type is set to fluid
            if result.type == 'fluid' then
                table.insert(data.raw.recipe[recipe].results,
                    {type = 'fluid', name = result.name, amount = result.amount})
            else
                table.insert(data.raw.recipe[recipe].results,
                    {type = 'item', name = result.name, amount = result.amount})
            end
        end
    end
end

return overrides
