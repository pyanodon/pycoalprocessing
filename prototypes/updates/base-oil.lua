if data.raw.resource["crude-oil"] then
    data.raw.resource["crude-oil"].infinite = false
end

RECIPE("basic-oil-processing"):remove_unlock("oil-processing"):hide()

RECIPE("advanced-oil-processing"):remove_unlock("advanced-oil-processing"):hide()

RECIPE("heavy-oil-cracking"):remove_unlock("advanced-oil-processing"):hide()

RECIPE("light-oil-cracking"):remove_unlock("advanced-oil-processing"):hide()

RECIPE("coal-liquefaction"):remove_unlock("coal-liquefaction"):hide()

TECHNOLOGY("oil-processing"):set("research_trigger", nil)

TECHNOLOGY("flammables"):set_fields {enabled = false}:hide()

TECHNOLOGY("coal-liquefaction"):set_fields {enabled = false}:hide()

TECHNOLOGY("lubricant"):remove_pack("chemical-science-pack"):remove_prereq("advanced-oil-processing")

TECHNOLOGY("advanced-oil-processing"):add_pack("production-science-pack")

RECIPE("oil-refinery"):remove_unlock("oil-processing"):add_unlock("plastics")

RECIPE("plastic-bar"):remove_unlock("plastics"):hide()

--moving solid fuels
RECIPE("solid-fuel-from-petroleum-gas"):remove_unlock("oil-processing"):hide()

RECIPE("solid-fuel-from-heavy-oil"):remove_unlock("advanced-oil-processing"):hide()

RECIPE("solid-fuel-from-light-oil"):remove_unlock("advanced-oil-processing"):hide()

RECIPE("sulfur"):remove_unlock("sulfur-processing"):hide()

ITEM("solid-fuel"):hide()

if not (mods["pyrawores"]) then
    TECHNOLOGY("sulfur-processing"):add_pack("chemical-science-pack")
    TECHNOLOGY("battery"):add_pack("chemical-science-pack")
    TECHNOLOGY("battery-equipment"):add_pack("chemical-science-pack")
    TECHNOLOGY("electric-energy-accumulators"):add_pack("chemical-science-pack")
    TECHNOLOGY("explosives"):add_pack("chemical-science-pack")
    TECHNOLOGY("fluid-separation"):add_pack("chemical-science-pack")
    TECHNOLOGY("cliff-explosives"):add_pack("chemical-science-pack")
    TECHNOLOGY("land-mine"):add_pack("chemical-science-pack")
    TECHNOLOGY("rocketry"):add_pack("chemical-science-pack")
end
