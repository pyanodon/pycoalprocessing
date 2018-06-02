local interface = {}

function interface.write_global(name) --Dumps the global to player and logfile
    if name and type(name) == "string" then
        game.write_file("pycoalprocessing/global-" .. name .. ".lua", serpent.block(global[name], {nocode = true, comment = false, sparse = true}))
    else
        game.write_file("pycoalprocessing/global.lua", serpent.block(global, {nocode = true, comment = false, sparse = true}))
    end
end

--Require the awesome console for quick script debugging
interface.console = require("stdlib/scripts/console")

return interface
