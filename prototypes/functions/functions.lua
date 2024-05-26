if _G.overrides then return _G.overrides end
_G.overrides = {}

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

function overrides.add_corner_icon_to_recipe(recipe, corner)
    local icon, icon_size, icons
    local result = recipe.main_product or recipe.result or recipe.results[1][1] or recipe.results[1].name

    -- Icon size finder
    if recipe.icon_size ~= nil then
        icon_size = recipe.icon_size
    else
        icon_size = 32 -- Set default to 32
    end

    -- Icon finder
    if recipe.icon ~= nil then -- Found an icon
        icon = recipe.icon
    end

    if icon == nil then -- (i.e. not found above)
        -- Find it from result icon
        icon = table.deepcopy(data.raw.item[result].icon)

        -- Confirm icon_size
        if data.raw.item[result] and data.raw.item[result].icon_size ~= nil then
            icon_size = data.raw.item[result].icon_size
        end
    end

    if recipe.icons then -- If it's already an icons
        icons = recipe.icons
        icons[#icons + 1] = corner
    elseif data.raw.item[result] and data.raw.item[result].icons then
        icons = table.deepcopy(data.raw.item[result].icons)
        icons[#icons + 1] = corner
    else -- No icons table, use icon found above
        if icon == nil then
            icon = '__base__/graphics/icons/blueprint.png'
        end -- Fallback

        icons = {
            {icon = icon, icon_size = icon_size},
            corner
        }
    end

    -- Ensure icon sizes are installed in each icon level
    for i, icon in pairs(icons) do
        if not icon.icon_size then
            if i == 1 then -- Allow first one to inherit, set all others to 32
                icon.icon_size = icon_size or 32
            else
                icon.icon_size = 32
            end
        end
    end

    return icons
end

-- adds recipe to tech for unlock if tech and recipe exists
function overrides.tech_add_recipe(tech, recipe)
    if data.raw.technology[tech] ~= nil then
        if data.raw.recipe[recipe] ~= nil then
            table.insert(data.raw.technology[tech].effects, {type = 'unlock-recipe', recipe = recipe})
        end
    end
end

function overrides.tech_add_prerequisites(tech, prereq)
    if data.raw.technology[tech] ~= nil then
        if data.raw.technology[prereq] ~= nil then table.insert(data.raw.technology[tech].prerequisites, prereq) end
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

function overrides.add_ingredient_amount(recipe, ingredient_name, increase)
    if recipe.normal or recipe.expensive then error('Don\'t use these') end

    for i, ingredient in pairs(recipe.ingredients) do
        local name = ingredient.name or ingredient[1]
        local amount = ingredient.amount or ingredient[2]
        local type = ingredient.type or 'item'

        if name == ingredient_name then
            recipe.ingredients[i] = {type = type, name = name, amount = amount + increase, fluidbox_index = ingredient.fluidbox_index}
        end
    end
end

return overrides
