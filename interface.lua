require("stdlib/config/config")
local interface = {}

function interface.write_global(name) --Dumps the global to player and logfile
    if name and type(name) == "string" then
        game.write_file("pycoalprocessing/global-"..name..".lua", serpent.block(global[name], {nocode=true, comment=false, sparse=true}))
    else
        game.write_file("pycoalprocessing/global.lua", serpent.block(global, {nocode=true, comment=false, sparse=true}))
    end
end

--Require the awesome console for quick script debugging
interface.console = require("stdlib.debug.console")

--Register with creative-mode for easy testing
if remote.interfaces["creative-mode"] and remote.interfaces["creative-mode"]["register_remote_function_to_modding_ui"] then
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "write_global")
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "console")
end

return interface
