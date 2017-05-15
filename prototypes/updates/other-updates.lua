-------------------------------------------------------------------------------
--[[Update other mods]]--
-------------------------------------------------------------------------------
--update recipes for Bergius-Process
if data.raw.technology["Bergius-Process"] then
    --Remove bobs coal cracking
    if bobmods then
        bobmods.lib.tech.remove_recipe_unlock("advanced-oil-processing", "coal-cracking")
    end

    local liqcoal = data.raw["recipe"]["coal-liquefaction"]
    liqcoal.category = "distilator"
end
