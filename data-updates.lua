--update vanilla recipes to use creostoe
require("prototypes.updates.recipe-updates")

--update recipes to use bobmods
if _G.bobmods and _G.bobmods.lib then
  require("prototypes.updates.bob-recipe-updates")
  require("prototypes.updates.bob-additions")
end
