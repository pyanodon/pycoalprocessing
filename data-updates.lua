require("stdlib.data.data").create_data_globals()

--update recipes for creosote
require("prototypes.updates.recipe-updates")

--update data for other mods.
require("prototypes.updates.other-updates")

--update recipes to use bobmods
if mods["boblibrary"] then
    require("prototypes.updates.bob-updates")
    require("prototypes.updates.bob-additions")
end

for _, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
        for _, recipe in ipairs({"syngas"}) do
            table.insert(v.limitation, recipe)
        end
    end
end

--science pack 1 override
data.raw.tool["science-pack-1"].icon = "__pycoalprocessing__/graphics/icons/science-pack-1.png"
--science pack 2 override
data.raw.tool["science-pack-2"].icon = "__pycoalprocessing__/graphics/icons/science-pack-2.png"
--science pack 3 override
data.raw.tool["science-pack-3"].icon = "__pycoalprocessing__/graphics/icons/science-pack-3.png"

Recipe("wood"):set_fields{energy_required = 15}
