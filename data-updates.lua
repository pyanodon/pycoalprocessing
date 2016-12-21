--update recipes for creosote
require("prototypes.updates.recipe-updates")

--update data for other mods.
require("prototypes.updates.other-updates")

--update recipes to use bobmods
if _G.bobmods and _G.bobmods.lib then
  require("prototypes.updates.bob-updates")
  require("prototypes.updates.bob-additions")
end

--angel-updates
if _G.angelsmods then
  require("prototypes.updates.angel-updates")
end
