
if data.raw.resource['crude-oil'] then
    data.raw.resource['crude-oil'].infinite = false
end

RECIPE("basic-oil-processing"):remove_unlock("oil-processing"):set_fields{hidden = true}

RECIPE("advanced-oil-processing"):remove_unlock("advanced-oil-processing"):set_fields{hidden = true}

RECIPE("heavy-oil-cracking"):remove_unlock("advanced-oil-processing"):set_fields{hidden = true}

RECIPE("light-oil-cracking"):remove_unlock("advanced-oil-processing"):set_fields{hidden = true}

RECIPE("coal-liquefaction"):remove_unlock("coal-liquefaction"):set_fields{hidden = true}

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
