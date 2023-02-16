local overrides = {}

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

-- add item/fluid to recipe ingredients
-- ingredient contains name, amount, and type if its a fluid
function overrides.add_ingredient(recipe, ingredient)
    if type(recipe) == 'string' then recipe = data.raw.recipe[recipe] end
    if not recipe.ingredients then
        recipe.ingredients = (recipe.normal or recipe.expensive).ingredients
    end
    table.insert(recipe.ingredients, ingredient)
end

-- remove item/fluid to recipe ingredients. returns amount removed
function overrides.remove_ingredient(recipe, ingredient_name)
    if type(recipe) == 'string' then recipe = data.raw.recipe[recipe] end
    if not recipe.ingredients then
        recipe.ingredients = (recipe.normal or recipe.expensive).ingredients
    end
    local amount = 0
    local new_ingredients = {}
    for _, ingredient in pairs(recipe.ingredients) do
        local name = ingredient[1] or ingredient.name
        if name ~= ingredient_name then
            table.insert(new_ingredients, ingredient)
        else
            amount = amount + (ingredient[2] or ingredient.amount or ((ingredient.amount_min + ingredient.amount_max) / 2))
        end
    end
    recipe.ingredients = new_ingredients
    return amount
end

-- add item/fluid to recipe results
function overrides.add_result(recipe, result)
    if type(recipe) == 'string' then recipe = data.raw.recipe[recipe] end
    if not recipe.results then
        if recipe.result then
            recipe.results = {{type = 'item', name = recipe.result, amount = recipe.result_count or 1}}
            recipe.result = nil
            recipe.result_count = nil
        else
            recipe.results = (recipe.normal or recipe.expensive).results
        end
    end
    table.insert(recipe.results, result)
end

-- remove item/fluid to recipe results. returns amt of removed
function overrides.remove_result(recipe, result_name)
    if type(recipe) == 'string' then recipe = data.raw.recipe[recipe] end
    overrides.standardize_results(recipe)

    local amount = 0
    local new_results = {}
    for _, result in pairs(recipe.results) do
        local name = result[1] or result.name
        if name ~= result_name then
            table.insert(new_results, result)
        else
            amount = result[2] or result.amount
        end
    end
    recipe.results = new_results
    return amount
end

--

-- recipe builder: can take a list of ingredients and a list results and attempt to build a recipe using the first avalible item/fluid
-- Example
--[[
Recipe{
	name="a",
	ingredients =
		{
		--each ingredient can have multiple entries to use if one isnt loaded
		{
			{name="test",amount=5},
			{name="other",amount=3},
			{name="item",amount=1},
		},
		{name="bleh",amount=2},
		{type="fluid",name="stuff", amount=40}
		}
	results =
		{
		{"things",2},
		}


]]
function overrides.Recipe(recipe)
    local name = recipe.name
    local ingredients
    local results = {}
    local icon

    local prep_ingredients = {}
    local prep_results = {}

    local newingredients = false

    if data.raw.recipe[recipe.name] == nil then
        -- if recipe doesnt exist create new one
        ingredients = recipe.ingredients
        results = recipe.results
        icon = recipe.icon

        newingredients = true
    elseif data.raw.recipe[recipe.name] ~= nil then
        -- if recipe exists load missing info from current recipe and add new info from function

        if recipe.ingredients ~= nil then
            ingredients = recipe.ingredients
            newingredients = true
        else
            --log(serpent.block(i))
            --log("final ingredients")
            --log(serpent.block(ingredients))
            ingredients = data.raw.recipe[name].ingredients
        end

        if recipe.results ~= nil then
            results = recipe.results
        else
            --log(serpent.block(recipe.name))
            --log(serpent.block(data.raw.recipe[name]))
            if data.raw.recipe[name].result ~= nil then
                --log(serpent.block(data.raw.recipe[name]))
                --log(serpent.block(r))
                table.insert(results, {
                    {
                        type = 'item',
                        name = data.raw.recipe[name].result,
                        amount = data.raw.recipe[name].result_count or 1
                    }
                })
            else
                --log(serpent.block(data.raw.recipe[name]))
                for _, r in pairs(data.raw.recipe[name].results) do
                    --log(serpent.block(r))
                    table.insert(results, {r})
                end
            end
        end

        if recipe.icon ~= nil then
            icon = recipe.icon
        else
            icon = data.raw.recipe[name].icon
        end

        --log(serpent.block(results))
    end
    --log(serpent.block(data.raw.recipe[name]))
    --log(serpent.block(name))
    --log(serpent.block(ingredients))
    --log(serpent.block(results))

    if results ~= nil then
        -- check results to make sure they exist
        for _, restable in pairs(results) do
            for _, r in pairs(restable) do
                local result = {}
                --log(serpent.block(r))
                if r.type ~= 'fluid' then
                    -- if its not set to fluid its an item. check the items list for the items existance and set the type to item

                    if data.raw.item[r.name] ~= nil then
                        result.type = 'item'

                        -- insert the name and amount if the item is found
                        result.name = r.name
                        if r.amount ~= nil then result.amount = r.amount end
                        if r.amount_min ~= nil then result.amount_min = r.amount_min end
                        if r.amount_max ~= nil then result.amount_max = r.amount_max end
                        if r.probability ~= nil then result.probability = r.probability end
                        -- insert the complete result into the recipe results table
                        table.insert(prep_results, result)

                        break
                    end
                elseif r.type == 'fluid' then
                    -- its a fluid check if it exists and set the type to fluid

                    if data.raw.fluid[r.name] ~= nil then
                        result.type = 'fluid'

                        -- insert the name and amount if the item is found
                        result.name = r.name
                        result.amount = r.amount

                        -- insert the complete result into the recipe results table
                        table.insert(prep_results, result)

                        break
                    end
                end
            end
        end
    end

    if ingredients ~= nil then
        -- check each recipes ingredients table to make sure it exists
        for i, ingtable in pairs(ingredients) do
            -- item and fluid can share name assume its an item unless fluid is setfenv

            if newingredients then
                for _, ing in pairs(ingtable) do
                    local ingredient = {}
                    --log(serpent.block(recipe))
                    --log(serpent.block(ing))
                    --log(serpent.block(ingredients))
                    if ing.type ~= 'fluid' then
                        -- if its not set to fluid its an item. check the items list for the items existance and set the type to item

                        if data.raw.item[ing.name] ~= nil then
                            ingredient.type = 'item'

                            -- insert the name and amount if the item is found
                            ingredient.name = ing.name

                            if tonumber(ing.amount) ~= nil then
                                ingredient.amount = ing.amount
                            else
                                local amount = 0

                                for _, r in pairs(prep_results) do
                                    amount = amount + r.amount
                                end

                                ingredient.amount = amount
                            end

                            -- insert the complete ingredient into the recipe ingredients table
                            table.insert(prep_ingredients, ingredient)

                            break
                        end
                    elseif ing.type == 'fluid' then
                        -- its a fluid check if it exists and set the type to fluid

                        if data.raw.fluid[ing.name] ~= nil then
                            ingredient.type = 'fluid'

                            -- insert the name and amount if the item is found
                            ingredient.name = ing.name
                            ingredient.amount = ing.amount

                            -- insert the complete ingredient into the recipe ingredients table
                            table.insert(prep_ingredients, ingredient)

                            break
                        end
                    end
                end
            else
                prep_ingredients = ingredients
            end
        end
    end

    if next(prep_ingredients) and next(prep_results) then
        -- create the recipe
        data:extend({
            {
                type = 'recipe',
                name = name,
                category = recipe.category or 'crafting',
                subgroup = recipe.subgroup or nil,
                enabled = recipe.enabled or false,
                allow_decomposition = recipe.allow_decomposition or false,
                energy_required = recipe.energy_required or 1,
                ingredients = prep_ingredients,
                results = prep_results,
                icon = icon,
                icon_size = recipe.icon_size or 32,
                order = recipe.order or nil
            }
        })
    end

    --log(serpent.block(data.raw.recipe[name]))
end

-- add or subtract from a recipe ingredients or results
-- is used to edit already existing recipe
function overrides.Patch(recipe)
    --log(serpent.block(recipe))
    --log(serpent.block(data.raw.recipe[name]))
    local name = recipe.name
    local newingredients = recipe.ingredients
    local newresults = recipe.results

    local currentingredients = data.raw.recipe[name].ingredients
    local currentresults = data.raw.recipe[name].results

    if data.raw.recipe[name] ~= nil then
        if newingredients ~= nil then
            for i1, ing1 in pairs(currentingredients) do
                for _, ing2 in pairs(newingredients) do
                    if ing1.name == ing2.name then
                        if string.find(ing2.amount, '[%+]') ~= nil then
                            ing1.amount = ing1.amount + string.sub(string.find(ing2.amount, '%d'))

                            data.raw.recipe[name].ingredients[i1].amount = ing1.amount
                        elseif string.find(ing2.amount, '[%-]') then
                            ing1.amount = ing1.amount - string.sub(string.find(ing2.amount, '%d'))

                            data.raw.recipe[name].ingredients[i1].amount = ing1.amount
                        end
                    end
                end
            end
        end

        if newresults ~= nil then
            for r1, res1 in pairs(currentresults) do
                for _, res2 in pairs(newresults) do
                    if res1.name == res2.name then
                        if string.find(res2.amount, '[%+]') ~= nil then
                            res1.amount = res1.amount + string.sub(string.find(res2.amount, '%d'))

                            data.raw.recipe[name].results[r1].amount = res1.amount
                        elseif string.find(res2.amount, '[%-]') then
                            res1.amount = res1.amount - string.sub(string.find(res2.amount, '%d'))

                            data.raw.recipe[name].results[r1].amount = res1.amount
                        end
                    end
                end
            end
        end
    end

    --log(serpent.block(data.raw.recipe[name]))
end

-- replace item/fluid in recipes ingredients
-- doesnt yet include a way to change ingredient amount will update when needed
function overrides.ingredient_replace(recipe, old, new, new_amount)
    if data.raw.item[old] ~= nil or data.raw.fluid[old] ~= nil then
        if data.raw.item[new] ~= nil or data.raw.fluid[new] ~= nil then
            --log(serpent.block(recipe))
            if data.raw.recipe[recipe] ~= nil then
                if type(recipe) == 'string' then
                    local R = data.raw.recipe[recipe]
                    recipe = R
                end
                local ningredients
                local eingredients
                if recipe.ingredients ~= nil then
                    -- TODO:need to check for ingredients that dont have name declared
                    local ingredients = recipe.ingredients
                    for i, ing in pairs(ingredients) do
                        --log("get past for loop into ingredients")
                        if ing.name ~= nil then
                            if ing.name == old then
                                --log("pasted check for if ingredients = old item")
                                --log(recipe.name)
                                --log(serpent.block(ing))
                                local T = 'item'
                                if data.raw.fluid[new] ~= nil then T = 'fluid' end
                                local A = new_amount or table.deepcopy(ing.amount)
                                data.raw.recipe[recipe.name].ingredients[i] = {type = T, name = new, amount = A}
                                --log(recipe.name)
                                --log(serpent.block(recipe.ingredients))
                                --log("hit count")
                            end
                        else
                            -- end
                            -- for j, v in pairs(ing) do
                            -- TODO:fix duplicated ingredients on some items
                            if ing[1] == old then
                                --log("pasted check for if ingredients = old item")
                                --log(recipe.name)
                                --log(serpent.block(ing))
                                -- local T = table.deepcopy(ing.type)
                                local A = new_amount or table.deepcopy(ing[2])
                                --log(new)
                                --log(A)
                                data.raw.recipe[recipe.name].ingredients[i] = {new, A}
                                --log(recipe.name)
                                --log(serpent.block(data.raw.recipe[recipe.name].ingredients))
                                --log("hit count")
                            end
                        end
                    end
                elseif recipe.normal or recipe.expensive then
                    --log(serpent.block(recipe))
                    if recipe.normal then
                        --log("is check good")
                        ningredients = recipe.normal.ingredients
                    end
                    if recipe.expensive then eingredients = recipe.expensive.ingredients end
                    if recipe.normal then
                        --log(serpent.block(recipe.normal))
                        --log(serpent.block(ningredients))
                        for i, ing in pairs(ningredients) do
                            --log("get past for loop into normal ingredients")
                            --log("ningredients")
                            --log(serpent.block(ningredients))
                            --log(serpent.block(ing))
                            --log("ing name")
                            --log(ing.name)
                            --log("old")
                            --log(old)
                            if ing.name ~= nil then
                                if ing.name == old then
                                    --log("pasted check for if ingredients = old item")
                                    --log(recipe.name)
                                    --log(serpent.block(ing))
                                    local T = 'item'
                                    if data.raw.fluid[new] ~= nil then T = 'fluid' end
                                    local A = new_amount or table.deepcopy(ing.amount)
                                    data.raw.recipe[recipe.name].normal.ingredients[i] =
                                        {type = T, name = new, amount = A}
                                    --log(recipe.name)
                                    --log(serpent.block(recipe.ingredients))
                                    --log("hit count")
                                    --log(serpent.block(data.raw.recipe[recipe.name]))
                                end
                            else
                                -- end
                                -- for j,v in pairs(ing) do
                                if ing[1] == old then
                                    local A = new_amount or table.deepcopy(ing[2])
                                    data.raw.recipe[recipe.name].normal.ingredients[i] = {new, A}
                                end
                            end
                        end
                    end
                    if recipe.expensive then
                        for i, ing in pairs(eingredients) do
                            --log("get past for loop into ingredients")
                            if ing.name ~= nil then
                                if ing.name == old then
                                    --log("pasted check for if ingredients = old item")
                                    --log(recipe.name)
                                    --log(serpent.block(ing))
                                    local T = 'item'
                                    if data.raw.fluid[new] ~= nil then T = 'fluid' end
                                    local A = new_amount or table.deepcopy(ing.amount)
                                    data.raw.recipe[recipe.name].expensive.ingredients[i] =
                                        {type = T, name = new, amount = A}
                                    --log(recipe.name)
                                    --log(serpent.block(recipe.ingredients))
                                    --log("hit count")
                                end
                            else
                                --log(serpent.block(recipe))
                                -- end
                                -- for j,v in pairs(ing) do
                                --log("check this still works")
                                --log(serpent.block(ing))
                                if ing[1] == old then
                                    local A = new_amount or table.deepcopy(ing[2])
                                    data.raw.recipe[recipe.name].expensive.ingredients[i] = {new, A}
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- replace item/fluid in recipes results
function overrides.results_replacer(recipe, old, new, new_amount)
    --log("triggered")
    --log(recipe)
    --log(old)
    --log(new)
    --log(serpent.block(data.raw.recipe[recipe]))
    --log(serpent.block(data.raw.item[old]))
    --log(serpent.block(data.raw.item[new]))
    if data.raw.item[old] ~= nil or data.raw.fluid[old] ~= nil then
        --log("triggered")
        if data.raw.item[new] ~= nil or data.raw.fluid[new] ~= nil then
            --log("triggered")
            --log(recipe)
            if type(recipe) == 'string' then
                local R = data.raw.recipe[recipe]
                recipe = R
            end
            --log(serpent.block(R))
            if recipe ~= nil then
                --log(recipe.name)
                --log(serpent.block(recipe))
                if recipe.result then
                    if recipe.result == old then
                        data.raw.recipe[recipe.name].result = new
                        if recipe.result_count ~= nil and new_amount ~= nil then
                            data.raw.recipe[recipe.name].result_count = new_amount
                        end
                    end
                end
                if recipe.results then
                    for r, result in pairs(recipe.results) do
                        if result.name == old then
                            data.raw.recipe[recipe.name].results[r].name = new
                            if new_amount ~= nil then
                                data.raw.recipe[recipe.name].results[r].amount = new_amount
                            end
                            if data.raw.fluid[new] == nil and data.raw.recipe[recipe.name].results[r].type ~= 'item' then
                                data.raw.recipe[recipe.name].results[r].type = 'item'
                            end
                        end
                    end
                end
                if recipe.main_product ~= nil then
                    --log("should replace main_product")
                    if recipe.main_product == old then
                        --log("getting here for iron plate 1?")
                        data.raw.recipe[recipe.name].main_product = new
                    end
                end
                if recipe.normal or recipe.expensive then
                    if recipe.normal then
                        if recipe.normal.result then
                            if recipe.normal.result == old then
                                data.raw.recipe[recipe.name].normal.result = new
                                if recipe.result_count ~= nil and new_amount ~= nil then
                                    data.raw.recipe[recipe.name].normal.result_count = new_amount
                                end
                            end
                        end
                        if recipe.normal.results then
                            for r, result in pairs(recipe.normal.results) do
                                if result.name == old then
                                    data.raw.recipe[recipe.name].normal.results[r].name = new
                                    if new_amount ~= nil then
                                        data.raw.recipe[recipe.name].normal.results[r].amount = new_amount
                                    end
                                    if data.raw.fluid[new] == nil and
                                        data.raw.recipe[recipe.name].normal.results[r].type ~= 'item' then
                                        data.raw.recipe[recipe.name].normal.results[r].type = 'item'
                                    end
                                end
                            end
                        end
                        if recipe.normal.main_product then
                            if recipe.normal.main_product == old then
                                data.raw.recipe[recipe.name].normal.main_product = new
                            end
                        end
                    end
                    if recipe.expensive then
                        if recipe.expensive.result then
                            if recipe.expensive.result == old then
                                data.raw.recipe[recipe.name].expensive.result = new
                                if recipe.result_count ~= nil and new_amount ~= nil then
                                    data.raw.recipe[recipe.name].result_count = new_amount
                                end
                            end
                        end
                        if recipe.expensive.results then
                            for r, result in pairs(recipe.expensive.results) do
                                if result.name == old then
                                    data.raw.recipe[recipe.name].expensive.results[r].name = new
                                    if new_amount ~= nil then
                                        data.raw.recipe[recipe.name].expensive.results[r].amount = new_amount
                                    end
                                    if data.raw.fluid[new] == nil and
                                        data.raw.recipe[recipe.name].expensive.results[r].type ~= 'item' then
                                        data.raw.recipe[recipe.name].expensive.results[r].type = 'item'
                                    end
                                end
                            end
                        end
                        if recipe.expensive.main_product then
                            if recipe.expensive.main_product == old then
                                data.raw.recipe[recipe.name].expensive.main_product = new
                            end
                        end
                    end
                end
            end
        end
    end
end

-- replace an item/fluid in every recipes ingredients/results
-- best used to merge items that are duplicated in mods that should be the same
function overrides.global_item_replacer(old, new, blackrecipe)
    if data.raw.item[old] ~= nil or data.raw.fluid[old] ~= nil then
        if data.raw.item[new] ~= nil or data.raw.fluid[old] ~= nil then
            local recipes = table.deepcopy(data.raw.recipe)
            if type(blackrecipe) ~= 'table' and blackrecipe ~= nil then blackrecipe = {blackrecipe} end
            local brecipeset = {}
            if blackrecipe ~= nil then for _, brecipe in pairs(blackrecipe) do brecipeset[brecipe] = true end end
            --log(serpent.block(brecipeset))
            for recipe in pairs(recipes) do
                -- for b, brecipe in pairs(blackrecipe) do
                if not brecipeset[recipe] then
                    --log(serpent.block(recipe))
                    --log(serpent.block(recipe.name))
                    --log(serpent.block(brecipeset))
                    overrides.ingredient_replace(recipe, old, new)
                    overrides.results_replacer(recipe, old, new)
                end
                -- end
            end
        end
    end
end

-- used to remove a whole category of recipes
-- use case wipe all recipes from a building
function overrides.recipe_category_remove(category)
    --log("function was used")

    local hiddenrecipes = {}

    for _, recipe in pairs(data.raw.recipe) do
        if recipe.category == category then
            --log(recipe.category)
            --log(category)
            data.raw.recipe[recipe.name].hidden = true

            table.insert(hiddenrecipes, recipe.name)
        end
    end
    --log(serpent.block(hiddenrecipes))
    overrides.remove_recipe_unlock(hiddenrecipes)
end

-- removes recipes from tech
-- main use is removing recipes hidden by recipe_category_remove function
function overrides.remove_recipe_unlock(recipe_list)
    local recipelist = {}

    --log(serpent.block(recipelist))

    if type(recipe_list) ~= 'table' and recipe_list ~= nil then
        recipelist[recipe_list] = true
    elseif recipe_list ~= nil then
        for _, recipe in pairs(recipe_list) do recipelist[recipe] = true end
    end

    --log(serpent.block(recipelist))

    for _, tech in pairs(data.raw.technology) do
        if tech.effects ~= nil then
            for u, unlock in pairs(tech.effects) do
                --log(serpent.block(unlock))
                --log(serpent.block(recipelist[unlock.recipe]))
                --log(serpent.block(tech))

                if recipelist[unlock.recipe] ~= nil then
                    --log(serpent.block(data.raw.technology[tech.name].effects[u]))
                    data.raw.technology[tech.name].effects[u] = nil

                    --log(serpent.block(data.raw.technology[tech.name].effects[u]))
                    --log(serpent.block(data.raw.technology[tech.name].effects))
                end
            end
        end
        --log(serpent.block(data.raw.technology[tech.name]))
        -- clean up tech effects table to not be full of nil values to avoid errors

        local cleanedtable = {}

        if data.raw.technology[tech.name].effects ~= nil then
            for _, rec in pairs(data.raw.technology[tech.name].effects) do
                if rec ~= nil then table.insert(cleanedtable, rec) end
            end
        end

        data.raw.technology[tech.name].effects = cleanedtable

        --log(serpent.block(data.raw.technology[tech.name]))
    end
end

local hab = {}

--blacklist for hot air recipes script to avoid
function overrides.HAB(blist)
	if type(blist) ~= "table" and blist ~= nil then
		blist = {blist}
	end
	if blist ~= nil then
		for _, bl in pairs(blist) do
			if data.raw.recipe[bl] ~= nil then
				hab[bl] = true
			end
		end
	end
end

--add 50 hot-air ingredient, output +25%
function overrides.hotairrecipes(extra_recipes)
    --gather recipes for the casting unit
    local recipes = table.deepcopy(data.raw.recipe)
    local afrecipes = {}
    local afrecipesnames = {}
    local afrcount = 0
    local altrec = 0

	for _, recipe in pairs(recipes) do
		if recipe.category == 'casting' and not hab[recipe.name] then
			table.insert(afrecipes, recipe)
			table.insert(afrecipesnames, recipe.name)
		end
	end

    for _, recipe in pairs(extra_recipes) do
        if data.raw.recipe[recipe] then
            table.insert(afrecipes, table.deepcopy(data.raw.recipe[recipe]))
            table.insert(afrecipesnames,recipe.name)
        end
    end

    --cycle thru afrecipes to make changes
	for _, recipe in pairs(afrecipes) do
        if recipe.normal or recipe.expensive then error('Don\'t use this') end

		afrcount = afrcount + 1
		--add ingredient
		local result = recipe.main_product or recipe.result or recipe.results[1][1] or recipe.results[1].name
        local index = recipe.category == "glassworks" and 3

        if recipe.ingredients[1] ~= nil then
            if recipe.ingredients[1].name == nil then
                local ing = recipe.ingredients
                recipe.ingredients = {}
                table.insert(recipe.ingredients, {type = "item", name = ing[1][1], amount = ing[1][2]})
                if data.raw.item["solid-hot-air"] ~= nil then
                    table.insert(recipe.ingredients,{type="item",name="solid-hot-air",amount=50})
                else
                    table.insert(recipe.ingredients,{type = "fluid", name = "hot-air", amount = 50, fluidbox_index = index})
                end
            elseif recipe.ingredients[1].name then
                if data.raw.item["solid-hot-air"] ~= nil then
                    table.insert(recipe.ingredients,{type="item",name="solid-hot-air",amount=50})
                else
                    table.insert(recipe.ingredients,{type = "fluid", name = "hot-air", amount = 50, fluidbox_index = index})
                end
            end
        elseif recipe.ingredients[2] ~= nil then
            if recipe.ingredients[2].name == nil then
                local ing = recipe.ingredients
                recipe.ingredients = {}
                table.insert(recipe.ingredients, {type = "item", name = ing[2][1], amount = ing[2][2]})
                if data.raw.item["solid-hot-air"] ~= nil then
                    table.insert(recipe.ingredients,{type="item",name="solid-hot-air",amount=50})
                else
                    table.insert(recipe.ingredients,{type = "fluid", name = "hot-air", amount = 50, fluidbox_index = index})
                end
            elseif recipe.ingredients[2].name then
                if data.raw.item["solid-hot-air"] ~= nil then
                    table.insert(recipe.ingredients,{type="item",name="solid-hot-air",amount=50})
                else
                    table.insert(recipe.ingredients,{type = "fluid", name = "hot-air", amount = 50, fluidbox_index = index})
                end
            end
        end
        overrides.multiply_result_amount(recipe, result, 1.25)

		--find tech unlock of og recipe
		local unlock
		for _,t in pairs(data.raw.technology) do
		--log(serpent.block(t))
			if t.effects ~= nil then
				for _,u in pairs(t.effects) do
					if u.recipe == recipe.name then
						unlock = t.name
						--log(unlock)
					end
				end
			end
		end
		--log(serpent.block(recipe))
		local hname = "hotair-" .. recipe.name
		local icon
		local icons
		local icon_size
			--icon size finder
			if recipe.icon_size ~=nil then
				icon_size = recipe.icon_size
			else --set default to 32
				icon_size = 32
			end --may change later if found internal to icons
			--icon finder
			if recipe.icon ~= nil then --found an icon
				icon = recipe.icon
			end
			if icon == nil then --(i.e. not found above)
				--find it from result icon
				icon = table.deepcopy(data.raw.item[result].icon)
				--confirm icon_size
				if data.raw.item[result] and data.raw.item[result].icon_size ~= nil then
					icon_size = data.raw.item[result].icon_size
				end
			end
			local hotair = {icon = "__pypetroleumhandlinggraphics__/graphics/icons/hot-air.png", icon_size = 64, shift = {-7.5,-7.5}, scale = 0.25}
      if recipe.icons then --if its already an icons
        icons = recipe.icons
        icons[#icons+1] = hotair
      elseif data.raw.item[result] and data.raw.item[result].icons then
        icons = table.deepcopy(data.raw.item[result].icons)
        icons[#icons+1] = hotair
      else --no icons table, use icon found above
        if icon == nil then
          icon = '__base__/graphics/icons/blueprint.png'
        end --fallback
          icons =
          {
            {icon = icon, icon_size = icon_size},
            hotair
          }
      end
      --ensure icon sizes are installed in each icon level (would be easier to add it to the whole thing, but meh)
      for _,i in pairs(icons) do
        if not i.icon_size then
          if i==1 then --allow first one to inherit, set all others to 32
            i.icon_size = icon_size or 32
          else
            i.icon_size = 32
          end
        end
      end
		local category
			if recipe.category ~= nil then
				category = recipe.category
			end
		if recipe.results then
			RECIPE {
			type = "recipe",
			name = hname,
			--category = "hot-air-advanced-foundry",
			category = category,
			enabled = false,
			energy_required = recipe.energy_required,
			ingredients = recipe.ingredients,
			results = recipe.results,
			icons = icons,
			--icon_size = 32,
			main_product = recipe.main_product or nil,
			subgroup = recipe.subgroup,
			order = recipe.order and (recipe.order .. "-a") or nil
			}--
			altrec=altrec+1
			if recipe.enabled == false then
				if unlock ~= nil then
					table.insert(data.raw.technology[unlock].effects,{type="unlock-recipe",recipe=hname})
				end
			else
				data.raw.recipe[hname].enabled = true
			end
		end
	end
end

function overrides.Tech_create()
end

-- adds recipe to tech for unlock if tech and recipe exists
function overrides.tech_add_recipe(tech, recipe)
    if data.raw.technology[tech] ~= nil then
        if data.raw.recipe[recipe] ~= nil then
            table.insert(data.raw.technology[tech].effects, {type = 'unlock-recipe', recipe = recipe})
        end
    end
end

-- removes recipe from tech if tech exists and includes recipe in effects
function overrides.tech_remove_recipe()
end

function overrides.tech_add_prerequisites(tech, prereq)
    if data.raw.technology[tech] ~= nil then
        if data.raw.technology[prereq] ~= nil then table.insert(data.raw.technology[tech].prerequisites, prereq) end
    end
end

local function ensure_contiguous(tbl)
    if not tbl or type(tbl) ~= "table" then return tbl end
    local contiguous_table = {}
    for _, v in pairs(tbl) do
        if v ~= nil then
            contiguous_table[#contiguous_table+1] = v
        end
    end
    return contiguous_table
end

function modify_recipe_tables(item, items_table, previous_item_names, result_table)
    --process both result and ingredient tables
    --log(serpent.block(item))
    --log(serpent.block(items_table))
    --log(serpent.block(previous_item_names))
    --log(serpent.block(result_table))

    local barrel
        if string.match(item.name, "%-barrel") ~= nil and string.match(item.name, "empty-barrel") == nil or string.match(item.name, "empty-milk-barrel") then
            barrel = string.gsub(item.name, "%-barrel", "")
        end

        local name
        if data.raw.item[item.name] ~= nil or data.raw.module[item.name] ~= nil or data.raw.fluid[item.name] then
            --log("hit")
            name = item.name
        elseif type(item.fallback) == "string" then
            --log('hit')
            name = item.fallback
            item.name = name
        elseif type(item.fallback) == "table" and item.fallback.name ~= nil then
            --log('hit')
            name = item.fallback.name
            item.name = name
            if item.fallback.amount ~= nil then
                item.amount = item.fallback.amount
            end
        elseif data.raw.fluid[barrel] ~= nil then
            name = item.name
        end
        --log(name)

        --[[
        if item.remove_item ~= nil and item.remove_item == true then
            --log('hit')
            for i, it in pairs(items_table) do
                --it = nil
                items_table[i] = nil
            end
        ]]--
        if previous_item_names[name] ~= true then
            --log('hit')
            --log(serpent.block(name))
            --add new ingredient to table

            --setting ingredient type
            local item_type
            if data.raw.item[name] ~= nil or data.raw.module[name] ~= nil then
                --log('hit')
                item_type = 'item'
            elseif data.raw.fluid[name] ~= nil then
                --log('hit')
                item_type = 'fluid'
            end
            item.type = item_type

           if item.amount ~= nil and type(item.amount) == "number" then
                table.insert(items_table, item)
            elseif item.amount_min ~= nil and item.amount_max ~= nil then
                table.insert(items_table, item)
            end
            --log(serpent.block(items_table))
        elseif previous_item_names[name] == true then
            --alter existing ingredient
            --log("hit")
            if item.remove_item ~= nil and item.remove_item == true then
                --log("hit")
                for p, pre in pairs(items_table) do
                    --log("hit")
                    if pre.name == name then
                        if string.match(item.name, "%-barrel") ~= nil and string.match(item.name, "empty%-barrel") == nil or string.match(item.name, "empty%-milk%-barrel") == nil then
                            --log("hit")
                            local barrel_name
                            if string.match(item.name, "barrel") ~= nil then
                                barrel_name = 'empty-barrel'
                            elseif string.match(item.name, "canister") ~= nil then
                                barrel_name = "empty-fuel-canister"
                            end
                            local amount = items_table[p].amount
                            --log(amount)
                            if result_table ~= nil and next(result_table) ~= nil then
                                if result_table.no_returns == nil or result_table.no_returns ~= nil and result_table.no_returns[item.name] ~= true then
                                    for r, result in pairs(result_table) do
                                        --log("hit")
                                        --log(serpent.block(r))
                                        --log(serpent.block(result))
                                        if result.name == barrel_name then
                                            --log("hit")
                                            result.amount = result.amount - amount
                                            --log(serpent.block(result))
                                        end
                                    end
                                end
                            end
                        end
                        items_table[p] = nil
                        previous_item_names[name] = nil
                    end
                end
            elseif item.amount == nil then
                if item.add_amount ~= nil then
                    --adding ingredient amount
                    --log("hit")
                    for p, pre in pairs(items_table) do
                        if pre.name == name then
                            if pre.amount ~= nil then
                            --log(serpent.block(pre))
                            --log(serpent.block(item))
                            pre.amount = item.add_amount + pre.amount
                            elseif pre.amount_min ~= nil and pre.amount_max ~= nil then
                                pre.amount_min = pre.amount_min + item.add_amount
                                pre.amount_max = pre.amount_max + item.add_amount
                            end
                        end
                    end
                    --replace amount_min and amount_max with new values
                elseif item.amount_min ~= nil and item.amount_max ~= nil then
                    for p,pre in pairs(items_table) do
                        if pre.name == name then
                            pre.amount_min = item.amount_min
                            pre.amount_max = item.amount_max
                        end
                    end
                elseif item.subtract_amount ~= nil then
                    --subtract ingredient amount
                    for p, pre in pairs(items_table) do
                        if pre.name == name then
                            pre.amount = pre.amount - item.subtract_amount
                        end
                    end
                end
            elseif item.amount ~= nil then
                for p, pre in pairs(items_table) do
                    if pre.name == name then
                        pre.amount = item.amount
                    end
                end
            end
        end

        --add return item to results if it exists
        local return_item
        if item.return_item ~= nil then
            local item_type
            local name = item.return_item.name
            local amount = item.return_item.amount or item.amount or item.add_amount
            if data.raw.item[name] ~= nil or data.raw.module[name] ~= nil then
                item_type = 'item'
            elseif data.raw.fluid[name] ~= nil then
                item_type = 'fluid'
            end
            return_item = {type = item_type, name = name, amount = amount}
            table.insert(result_table, return_item)
        end

        --add empty barrels to results
        local return_barrel
        if item.return_barrel ~= nil and item.return_barrel == true then
            --log('hit')
            local item_type = 'item'
            local name
            if string.match(item.name, "barrel") ~= nil then
                name = 'empty-barrel'
            elseif string.match(item.name, "canister") ~= nil then
                name = "empty-fuel-canister"
            end
            local amount = item.amount or item.add_amount
            return_barrel = {type = item_type, name = name, amount = amount}
            if next(result_table) ~= nil then
                local has_barrel = false
                for r, result in pairs(result_table) do
                    --log('hit')
                    if result.name == name then
                        --log('hit')
                        result.amount = result.amount + amount
                        has_barrel = true
                    end
                end
                if has_barrel == false then
                    table.insert(result_table, return_barrel)
                end
            else
                table.insert(result_table, return_barrel)
            end
        end

    --log(serpent.block(result_table))
end

--handles all adjustments for each ingredient and result changes in autorecipe
function recipe_item_builder(ingredients,results,previous_ingredients,previous_results)
    --log(serpent.block(ingredients))
    --log(serpent.block(previous_ingredients))
    --log(serpent.block(results))
    local ing_table = table.deepcopy(previous_ingredients)
    local result_table = table.deepcopy(previous_results)

    --add old ingredient names to table
    local previous_ingredient_names = {}
    for p, pre in pairs(previous_ingredients) do
        --log(pre.name)
        --log(serpent.block(previous_ingredient_names))
        if previous_ingredient_names[pre.name] ~= true then
            previous_ingredient_names[pre.name] = true
        end
    end

    --add old result names to table
    local previous_result_names = {}
    for p, pre in pairs(previous_results) do
        if previous_result_names[pre.name] ~= true then
            previous_result_names[pre.name] = true
        end
    end

    --add return items to results before saving them and adding to the recipe
    for i, ing in pairs(ingredients) do
       modify_recipe_tables(ing, ing_table, previous_ingredient_names, result_table)
    end

    for r, result in pairs(results) do
       modify_recipe_tables(result, result_table,previous_result_names)
    end
    --log(serpent.block(ing_table))

    return ensure_contiguous(ing_table), ensure_contiguous(result_table)
end

function overrides.autorecipes(recipe)
    --log('hit')
    --main details for all recipes
    local name = recipe.name
    --log(name)
        --default name for recipes if recipe doesnt provide an override
    local numbered_name
    local category = recipe.category
    local subgroup = recipe.subgroup
    local order = recipe.order
    local upgrades = {}
    if recipe.upgrades ~= nil then
        upgrades = recipe.upgrades
    end
    local mats = recipe.mats

    --variables for individual recipes
        --new ingredients
    local ingredients
        --old ingredients from last recipe carried over
    local previous_ingredients = {}
        --new results
    local results
        --old results from last recipe carried over
    local previous_results = {}

    --recipe building
    for r, rec in pairs(mats) do
        ingredients = rec.ingredients
        results = rec.results
        --variable to set if recipe is enabled
        local enabled
        --tech name
        local tech

        if rec.tech == nil then
            enabled = true
        else
            enabled = false
            tech = rec.tech
        end

        --log(serpent.block(ingredients))
        --log(serpent.block(results))
        --process ingredients and results get return version with changes
        local fixed_ingredients, fixed_results = recipe_item_builder(ingredients, results, previous_ingredients, previous_results)

        --log(serpent.block(fixed_ingredients))
        --log(serpent.block(fixed_results))

        --save ingredients and results for next recipe
        previous_ingredients = fixed_ingredients
        --log(serpent.block(previous_ingredients))
        previous_results = fixed_results

        local int = 0
        repeat
            int = int + 1
            numbered_name = name .. '-' .. int
        until not data.raw.recipe[numbered_name]

        local recipe_name = rec.name or numbered_name

        --build recipe with stdlib recipe builder
        RECIPE{
            type = 'recipe',
            name = recipe_name,
            category = category,
            enabled = enabled,
            energy_required = rec.crafting_speed or recipe.crafting_speed,
            ingredients = fixed_ingredients,
            results = fixed_results,
            subgroup = subgroup,
            order = order,
            allowed_module_categories = recipe.allowed_module_categories
            -- main_product = results[1].name,
            -- icon = mat.icon
            --localised_name = rec.name
        }

        if rec.tech ~= nil then
            RECIPE(recipe_name):add_unlock(rec.tech)
        end
        if rec.icon ~= nil then
            data.raw.recipe[recipe_name].icon = rec.icon
            if rec.icon_size ~= nil then
                data.raw.recipe[recipe_name].icon_size = rec.icon_size
            else
                data.raw.recipe[recipe_name].icon_size = 32
            end
        end
        if rec.icons ~= nil then
            RECIPE(recipe_name):set_fields { icons = rec.icons }
        end
        if rec.main_product ~= nil then
            data.raw.recipe[recipe_name].main_product = rec.main_product
        elseif recipe.main_product ~= nil then
            RECIPE(recipe_name):set_fields{main_product = recipe.main_product}
        end
        --[[
        for m, module in pairs(data.raw.module) do
            --log(module.name)
            if string.match(module.name, "speed%-module") ~= nil or string.match(module.name, "effectivity%-module") ~= nil or string.match(module.name, "productivity%-module") ~= nil then
              --log('hit')
                if module.limitation_blacklist == nil then
                    module.limitation_blacklist = {}
                end
                table.insert(module.limitation_blacklist, recipe_name)
            end
        end
        ]]
        --log(serpent.block(data.raw.recipe[recipe_name]))
    end

end

-- The purpose of the farm_speed functions is to remove the farm building itself
-- from the building speed. For example, for xyhiphoe mk1 which has only one animal
-- per farm, we want the speed to be equal to 1 xyhiphoe not 2 (farm + module)
-- Returns the correct farm speed for a mk1 farm based on number of modules and desired speed using mk1 modules
function overrides.farm_speed(num_slots, desired_speed)
    -- mk1 modules are 100% bonus speed. The farm itself then counts as much as one module
    return desired_speed / (num_slots + 1)
end

-- Returns the correct farm speed for a mk2+ farm based on the number of modules and the mk1 speed
function overrides.farm_speed_derived(num_slots, base_entity_name)
    local e = data.raw["assembling-machine"][base_entity_name]
    local mk1_slots = e.module_specification.module_slots
    local desired_mk1_speed = e.crafting_speed * (mk1_slots + 1)
    return (desired_mk1_speed * (num_slots / mk1_slots)) / (num_slots+1)
end

function overrides.tech_upgrade(tech_upgrade)
    local master_tech = tech_upgrade.master_tech
    local effects = master_tech.effects or {}

    for _, tech in pairs(tech_upgrade.sub_techs) do
        data:extend{{
            type = 'sprite',
            name = tech.name,
            filename = tech.icon,
            size = tech.icon_size
        }}

        effects[#effects + 1] = {
            type = 'nothing',
            icon = tech.icon,
            icon_size = tech.icon_size,
            effect_description = {'', '[font=default-semibold][color=255,230,192]', {'technology-name.' .. tech.name}, '[/color][/font]\n', {'technology-description.' .. tech.name}}
        }

        for _, effect in pairs(tech.effects) do
            if effect.type == 'module-effects' then
                if master_tech.name == 'compost-upgrade' then
                    effect.pollution = 0
                elseif effect.pollution == 0 then
                    effect.pollution = 0.1 -- prevent use in mines, composter, ect
                end

                local effective_speed
                if tech_upgrade.module_category and tech_upgrade.affected_entities and effect.speed then
                    local mk1 = tech_upgrade.affected_entities[1]
                    mk1 = data.raw.furnace[mk1] or data.raw['assembling-machine'][mk1]
                    local mk1_slots = mk1.module_specification.module_slots
                    local desired_mk1_speed = mk1.crafting_speed * (mk1_slots + 1)
                    effective_speed = (desired_mk1_speed / mk1.crafting_speed) * effect.speed
                end

                local module = ITEM {
                    type = 'module',
                    name = tech.name .. '-module',
                    icon = tech.icon,
                    icon_size = tech.icon_size,
                    scale = 0.5,
                    category = tech_upgrade.module_category or 'speed',
                    tier = 1,
                    flags = {'not-stackable'},
                    subgroup = 'py-alienlife-modules',
                    order = 't-a',
                    stack_size = 1,
                    effect = {
                        consumption = {bonus = effect.consumption or 0},
                        speed = {bonus = effective_speed or effect.speed or 0},
                        productivity = {bonus = effect.productivity or 0},
                        pollution = {bonus = -1 * (effect.pollution or 0.1)}
                    },
                    localised_name = {'technology-name.' .. tech.name},
                    localised_description = {'turd.font', {'turd.module'}}
                }

                if effective_speed then
                    local adjusted_speed = effect.speed * 100
                    if adjusted_speed >= 0 then adjusted_speed = '+' .. adjusted_speed end
                    overrides.add_to_description('module', module, {'turd.adjusted-speed', adjusted_speed})
                end
            elseif effect.type == 'unlock-recipe' and data.raw.recipe[effect.recipe] then
                overrides.add_to_description('recipe', data.raw.recipe[effect.recipe], {'turd.font', {'turd.recipe'}})
            elseif effect.type == 'recipe-replacement' then
                if not data.raw.recipe[effect.new] then error('Invalid recipe replacement: ' .. effect.new) end
                overrides.add_to_description('recipe', data.raw.recipe[effect.new], {'turd.font', {'turd.recipe-replacement'}})
            end
        end
    end

    TECHNOLOGY {
        type = 'technology',
        name = master_tech.name,
        icon = master_tech.icon,
        icon_size = master_tech.icon_size,
        order = master_tech.order,
        prerequisites = master_tech.prerequisites,
        effects = effects,
        unit = master_tech.unit,
        is_turd = true,
        localised_description = {'', {'turd.font', {'turd.tech'}}, '\n', {'turd.tech-2'}}
    }
end

-- Takes two prototype names (both must use the style of IconSpecification with icon = string_path), returns an IconSpecification with the icons as composites
function overrides.composite_molten_icon(base_prototype, child_prototype, shadow_alpha)
    shadow_alpha = shadow_alpha or 0.6
    base_prototype = data.raw.fluid[base_prototype] or data.raw.item[base_prototype]
    child_prototype = data.raw.fluid[child_prototype] or data.raw.item[child_prototype]
    return {
        {
            icon = base_prototype.icon,
            icon_size = base_prototype.icon_size,
            icon_mipmaps = base_prototype.icon_mipmaps
        },
        {
            icon = child_prototype.icon,
            icon_size = child_prototype.icon_size,
            icon_mipmaps = base_prototype.icon_mipmaps,
            shift = {10, 10},
            scale = 0.65,
            tint = {r = 0, g = 0, b = 0, a = shadow_alpha}
        },
        {
            icon = child_prototype.icon,
            icon_size = child_prototype.icon_size,
            icon_mipmaps = base_prototype.icon_mipmaps,
            shift = {10, 10},
            scale = 0.5,
            tint = {r = 1, g = 1, b = 1, a = 1}
        },
    }
end

-- adds some text to a prototype's localised description
function overrides.add_to_description(type, prototype, localised_string)
	if prototype.localised_description and prototype.localised_description ~= '' then
		prototype.localised_description = {'', prototype.localised_description, '\n', localised_string}
	else
		if type == 'item' and prototype.place_result then
			for _, machine in pairs(data.raw) do
				machine = machine[prototype.place_result]
				if machine and machine.localised_description then
					prototype.localised_description = {
						'?',
						{'', machine.localised_description, '\n', localised_string},
						localised_string
					}
					return
				end
			end

			prototype.localised_description = {
				'?',
				{'', {'entity-description.' .. prototype.place_result}, '\n', localised_string},
				{'', {type .. '-description.' .. prototype.name}, '\n', localised_string},
				localised_string
			}
		else
			prototype.localised_description = {'?', {'', {type .. '-description.' .. prototype.name}, '\n', localised_string}, localised_string}
		end
	end
end

-- formats a number into the amount of energy. Requires 'W' or 'J' as the second parameter
local si_prefixes = {
    [0] = '',
    'si-prefix-symbol-kilo',
    'si-prefix-symbol-mega',
    'si-prefix-symbol-giga',
    'si-prefix-symbol-tera',
    'si-prefix-symbol-peta',
    'si-prefix-symbol-exa',
    'si-prefix-symbol-zetta',
    'si-prefix-symbol-yotta'
}
function overrides.format_energy(energy, watts_or_joules)
	if watts_or_joules == 'W' then
        watts_or_joules = 'si-unit-symbol-watt'
        energy = energy * 60
    elseif watts_or_joules == 'J' then
        watts_or_joules = 'si-unit-symbol-joule'
    else
        error()
    end

    local prefix = 0
	while energy >= 1000 do
        energy = energy / 1000
        prefix = prefix + 1
    end
	return {'' , string.format('%.1f', energy), ' ', si_prefixes[prefix] and {si_prefixes[prefix]} or '* 10^'..(prefix*3)..' ', {watts_or_joules}}
end

-- Like normal pairs(), but randomized
local function shuffle(t)
	local keys = {}
	local n = 0
	for k in pairs(t) do
		n = n + 1
		keys[n] = k
	end

	while n > 1 do
		local k = math.random(n)
		keys[n], keys[k] = keys[k], keys[n]
		n = n - 1
	end

	return keys
end
function overrides.shuffled_pairs(t)
	local shuffled_keys = shuffle(t)
	local i = 0
	return function()
		i = i + 1
		local key = shuffled_keys[i]
		if key then
			return key, t[key]
		end
	end
end

-- Checks if an item has metadata, such as item-with-tags or equipement grids. (control.lua stage ONLY)
local basic_item_types = {['item'] = true, ['capsule'] = true, ['gun'] = true, ['rail-planner'] = true, ['module'] = true}
function overrides.check_for_basic_item(item)
	local items_with_metadata = global.items_with_metadata
	if not items_with_metadata then
		items_with_metadata = {}
		for item_name, prototype in pairs(game.item_prototypes) do
			if not basic_item_types[prototype.type] then
				items_with_metadata[item_name] = true
			end
		end
		global.items_with_metadata = items_with_metadata
	end
	return not items_with_metadata[item]
end

function overrides.standardize_results(recipe)
    if recipe.result and not recipe.results then
        recipe.results = {{type = 'item', name = recipe.result, amount = recipe.result_count or 1}}
        recipe.result = nil
        recipe.result_count = nil
    end
end

function overrides.multiply_result_amount(recipe, result_name, percent)
    if recipe.normal or recipe.expensive then error('Don\'t use these') end
    overrides.standardize_results(recipe)

    for i, result in pairs(recipe.results) do
        local name = result.name or result[1]
        local amount = result.amount or result[2]
        local type = result.type or 'item'

        if name == result_name then
            recipe.results[i] = {type = type, name = name, amount = math.ceil(amount * percent), fluidbox_index = result.fluidbox_index}
        end
    end
end

function overrides.multiply_ingredient_amount(recipe, ingredient_name, percent)
    if recipe.normal or recipe.expensive then error('Don\'t use these') end

    for i, ingredient in pairs(recipe.ingredients) do
        local name = ingredient.name or ingredient[1]
        local amount = ingredient.amount or ingredient[2]
        local type = ingredient.type or 'item'

        if name == ingredient_name then
            recipe.ingredients[i] = {type = type, name = name, amount = math.ceil(amount * percent), fluidbox_index = ingredient.fluidbox_index}
        end
    end
end

function overrides.add_result_amount(recipe, result_name, increase)
    if recipe.normal or recipe.expensive then error('Don\'t use these') end
    overrides.standardize_results(recipe)

    for i, result in pairs(recipe.results) do
        local name = result.name or result[1]
        local amount = result.amount or result[2]
        local type = result.type or 'item'

        if name == result_name then
            if amount then
                recipe.results[i] = {type = type, name = name, amount = amount + increase, probability = result.probability}
            else
                recipe.results[i] = {type = type, name = name, amount_min = result.amount_min + increase, amount_max = result.amount_max + increase, probability = result.probability}
            end
        end
    end
end

return overrides
