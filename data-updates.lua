--update vanilla recipes to use creostoe
require("prototypes.updates.recipe-updates")

--update recipes to use bobmods
if _G.bobmods and _G.bobmods.lib then
  require("prototypes.updates.bob-recipe-updates")
  require("prototypes.updates.bob-additions")
  require("prototypes.updates.bob-void")
end

--update recipes for Bergius-Process
if data.raw.technology["Bergius-Process"] then
  require("prototypes.updates.bergius")
end
