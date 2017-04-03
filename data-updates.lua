--luacheck: no global
--update recipes for creosote
require("prototypes.updates.recipe-updates")

--update data for other mods.
require("prototypes.updates.other-updates")

--update recipes to use bobmods
if bobmods and bobmods.lib then
    require("prototypes.updates.bob-updates")
    require("prototypes.updates.bob-additions")
end

--angel-updates
if angelsmods then
    require("prototypes.updates.angel-updates")
end

--science pack 1 override
data.raw.tool["science-pack-1"].icon = "__pycoalprocessing__/graphics/icons/science-pack-1.png"
