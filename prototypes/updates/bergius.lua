--bergius.lua: Updates for bergius-process while using pycoalprocessing

--luacheck: globals bobmods

--Remove bobs coal cracking
if bobmods then
  bobmods.lib.tech.remove_recipe_unlock("advanced-oil-processing", "coal-cracking")
end

--Can't switch this until distilator is fixed
local liqcoal = data.raw["recipe"]["coal-liquefaction"]
liqcoal.category = "distilator"
