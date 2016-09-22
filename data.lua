if not pysmods then pysmods = {} end
if not pysmods.coalpro then pysmods.coalpro = {} end
if not bobmods then bobmods = {false} end
require("config")
require("stdlib.utils.utils")
pysmods.coalpro = true

if pysmods.coalpro then
require("prototypes.coal-processing-category")

require("prototypes.items.items")

require("prototypes.buildings.distilator")
require("prototypes.buildings.gasturbinemk01")
require("prototypes.buildings.gasifier")
require("prototypes.buildings.carbon-filter")
require("prototypes.buildings.tar-processing-unit")
require("prototypes.buildings.rectisol")
require("prototypes.buildings.methanol-reactor")



require ("prototypes.terrain.terrain")

require ("prototypes.tailings-pond.entity")
require ("prototypes.tailings-pond.recipe")
require ("prototypes.tailings-pond.item")
require ("prototypes.objects.tiles")

require("prototypes.recipes.recipes-entity")


--require("prototypes.recipes.recipes_updates") -- The recipes we want to update.

	if bobmods.plates then
			require("prototypes.recipes.recipes-bob")
			require("prototypes.technology.technology-bob")
		else
			require("prototypes.recipes.recipes")

			require("prototypes.technology.technology")
	end
end

for k, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    for _, recipe in ipairs({"syngas"}) do
      table.insert(v.limitation, recipe)
    end
  end
end
