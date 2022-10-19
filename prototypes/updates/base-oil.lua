
if data.raw.resource['crude-oil'] then
    data.raw.resource['crude-oil'].infinite = false
end

local remove_old_oil_stuff =
{
--['pumpjack'] = true,
--["oil-refinery"] = true,
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

TECHNOLOGY("oil-processing"):add_pack('chemical-science-pack')

TECHNOLOGY("flammables"):set_fields{enabled = false}:set_fields{hidden = true}

TECHNOLOGY("coal-liquefaction"):set_fields{enabled = false}:set_fields{hidden = true}

TECHNOLOGY('lubricant'):remove_pack('chemical-science-pack'):remove_prereq('advanced-oil-processing')

TECHNOLOGY('advanced-oil-processing'):add_pack('production-science-pack')

RECIPE("oil-refinery"):remove_unlock('oil-processing'):add_unlock('plastics')

RECIPE('plastic-bar'):remove_unlock('plastics'):set_fields{hidden = true}

--moving solid fuels
RECIPE("solid-fuel-from-petroleum-gas"):remove_unlock("oil-processing"):set_fields{ hidden = true }

RECIPE('solid-fuel-from-heavy-oil'):remove_unlock('advanced-oil-processing'):set_fields{ hidden = true }

RECIPE('solid-fuel-from-light-oil'):remove_unlock('advanced-oil-processing'):set_fields{ hidden = true }

RECIPE("sulfur"):remove_unlock('sulfur-processing'):set_fields{ hidden = true }

ITEM("solid-fuel"):add_flag("hidden")
