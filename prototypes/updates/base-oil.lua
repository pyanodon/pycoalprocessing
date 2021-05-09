
if data.raw.resource['crude-oil'] then
    data.raw.resource['crude-oil'].infinite = false
end

local remove_old_oil_stuff =
{
--['pumpjack'] = true,
--['oil-refinery'] = true,
['basic-oil-processing'] = true,
['advanced-oil-processing'] = true,
['heavy-oil-cracking'] = true,
['light-oil-cracking'] = true,
['coal-liquefaction'] = true
}

local recipes_to_keep = {}

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

TECHNOLOGY('lubricant'):remove_prereq("advanced-oil-processing"):remove_prereq('chemical-science-pack'):remove_pack('chemical-science-pack'):add_prereq("coal-processing-2"):add_prereq("advanced-electronics")

TECHNOLOGY('advanced-oil-processing'):remove_pack('chemical-science-pack')

TECHNOLOGY('sulfur-processing'):add_prereq('coal-processing-2'):add_prereq('filtration'):remove_prereq("oil-processing")

RECIPE('solid-fuel-from-heavy-oil'):remove_unlock('advanced-oil-processing'):add_unlock('oil-processing')

TECHNOLOGY('plastics'):remove_prereq('oil-processing'):add_prereq('logistic-science-pack')

RECIPE('oil-refinery'):remove_unlock('oil-processing'):add_unlock('plastics')

RECIPE('plastic-bar'):remove_unlock('plastics'):add_unlock('oil-processing')
