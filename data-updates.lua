require("stdlib/data/data").create_data_globals()

--update recipes for creosote
require("prototypes/updates/recipe-updates")

--update recipes to use bobmods
if mods["boblibrary"] then
    require("prototypes/updates/bob-updates")
    require("prototypes/updates/bob-additions")
end

for _, v in pairs(data.raw.module) do
    if v.name:find("productivity%-module") and v.limitation then
        for _, recipe in ipairs({"syngas"}) do
            table.insert(v.limitation, recipe)
        end
    end
end

ITEM("science-pack-1", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-1.png")
ITEM("science-pack-2", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-2.png")
ITEM("science-pack-3", "tool"):set("icon", "__pycoalprocessing__/graphics/icons/science-pack-3.png")

RECIPE("wood"):set_fields {energy_required = 15}
