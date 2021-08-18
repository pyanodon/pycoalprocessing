
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

TECHNOLOGY("oil-processing"):add_pack('chemical-science-pack'):add_prereq('chemical-science-pack'):remove_prereq('fluid-handling')

TECHNOLOGY("flammables"):add_pack('military-science-pack')

TECHNOLOGY("coal-liquefaction"):set_fields{enabled = false}

TECHNOLOGY('lubricant'):remove_prereq("advanced-oil-processing"):remove_prereq('chemical-science-pack'):remove_pack('chemical-science-pack'):add_prereq("mukmoux")

TECHNOLOGY('advanced-oil-processing'):set_fields{enabled = false}

TECHNOLOGY('sulfur-processing'):add_prereq('filtration'):remove_prereq("oil-processing")

TECHNOLOGY('plastics'):remove_prereq('oil-processing'):add_prereq('logistic-science-pack'):add_prereq('coal-processing-1')

RECIPE('oil-refinery'):remove_unlock('oil-processing'):add_unlock('plastics')

RECIPE('plastic-bar'):remove_unlock('plastics')

--moving solid fuels
RECIPE("solid-fuel-from-petroleum-gas"):remove_unlock("oil-processing")

RECIPE('solid-fuel-from-heavy-oil'):remove_unlock('advanced-oil-processing')

RECIPE('solid-fuel-from-light-oil'):remove_unlock('advanced-oil-processing')

RECIPE("sulfur"):remove_unlock('sulfur-processing')
