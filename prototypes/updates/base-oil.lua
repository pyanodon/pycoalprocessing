

local remove_old_oil_stuff =
{
--['pumpjack'] = true,
['oil-refinery'] = true,
['basic-oil-processing'] = true,
['advanced-oil-processing'] = true,
['heavy-oil-cracking'] = true,
['light-oil-cracking'] = true,
['coal-liquefaction'] = true
}

local recipes_to_keep = {}

--log(serpent.block(remove_old_oil_stuff))

for _, recipe in pairs(data.raw.technology['oil-processing'].effects) do
--log('hit')
if recipe.type == 'unlock-recipe' then
    --log('hit')
    --log(recipe.recipe)
    if remove_old_oil_stuff[recipe.recipe] == nil then
        --log('hit')
        table.insert(recipes_to_keep, recipe)
    end
end
end

data.raw.technology['oil-processing'].effects = recipes_to_keep
recipes_to_keep = {}

for _, recipe in pairs(data.raw.technology['advanced-oil-processing'].effects) do
--log('hit')
if recipe.type == 'unlock-recipe' then
    --log('hit')
    --log(recipe.recipe)
    if remove_old_oil_stuff[recipe.recipe] == nil then
        --log('hit')
        table.insert(recipes_to_keep, recipe)
    end
end
end

data.raw.technology['advanced-oil-processing'].effects = recipes_to_keep
recipes_to_keep = {}

for _, recipe in pairs(data.raw.technology['coal-liquefaction'].effects) do
--log('hit')
if recipe.type == 'unlock-recipe' then
    --log('hit')
    if remove_old_oil_stuff[recipe.recipe] == nil then
        --log('hit')
        table.insert(recipes_to_keep, recipe)
    end
end
end

data.raw.technology['coal-liquefaction'].effects = recipes_to_keep
