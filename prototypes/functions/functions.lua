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

function overrides.next_upgrade(entity_type, base_name)
	if data.raw[entity_type] then
		local mk_str
		
		if data.raw[entity_type][base_name .. '-mk02'] then mk_str = '-mk' else mk_str = 'mk' end
		
		for i = 1, 3 do
			local from_entity = string.format("%s%s%02d", base_name, mk_str, i)
			local to_entity = string.format("%s%s%02d", base_name, mk_str, i+1)
			
			if i == 1 and not data.raw[entity_type][from_entity] then 
				from_entity = base_name 
			end	
		
			if data.raw[entity_type][from_entity] and data.raw[entity_type][to_entity] 
			and not data.raw[entity_type][from_entity].next_upgrade
			and data.raw[entity_type][from_entity].fast_replaceable_group
			and data.raw[entity_type][from_entity].fast_replaceable_group == data.raw[entity_type][to_entity].fast_replaceable_group 
			and data.raw[entity_type][from_entity].collision_box[1][1] == data.raw[entity_type][to_entity].collision_box[1][1] 
			and data.raw[entity_type][from_entity].collision_box[1][2] == data.raw[entity_type][to_entity].collision_box[1][2]
			and data.raw[entity_type][from_entity].collision_box[2][1] == data.raw[entity_type][to_entity].collision_box[2][1]
			and data.raw[entity_type][from_entity].collision_box[2][2] == data.raw[entity_type][to_entity].collision_box[2][2]
			then
				data.raw[entity_type][from_entity].next_upgrade = to_entity
			end
		end
	end
end


return overrides