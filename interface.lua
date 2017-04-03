require("stdlib/config/config")
local interface = {}

function interface.reset_mod()
    game.raise_event(Event.reset_mod, {})
end

function interface.reset_config()
    interface.config("reset")
end

function interface.resetUser()
end

function interface.recoverItems()
end

function interface.print_global(name) --Dumps the global to player and logfile
    if name and type(name) == "string" then
        game.print(serpent.block(global[name], {comment=false, sparse=true}))
        game.write_file("/logs/"..MOD.name .. "/global.log", serpent.block(global[name], {comment=false, sparse=true}))
    else
        game.print(serpent.block(global, {comment=false, sparse=true}))
        game.write_file("/logs/"..MOD.name .. "/global.log", serpent.block(global, {comment=false, sparse=true}))
    end
end

function interface.config(key, value, silent)
    local config = Config.new(global.config)
    if key then
        if key == "reset" then
            global.config = MOD.config.control
            if not silent then game.print(MOD.name.." Reset config to default.") end
            return true
        end
        --key=string.upper(key)
        if config.get(key) ~= nil then
            if value ~= nil then
                config.set(key, value)
                local val=config.get(key)
                if not silent then game.print(MOD.name .. ": New value for '" .. key .. "' is " .. "'" .. tostring(val) .."'") end
                return val-- all is well
            else --value nil
                local val = config.get(key)
                if not silent then game.print(MOD.name .. ": Current value for '" .. key .. "' is " .. "'" .. tostring(val) .."'") end
                return val
            end
        else --key is nill
            if not silent then game.print(MOD.name ..": Config '" .. key .. "' does not exist") end
            return nil
        end
    else
        if not silent then
            game.print(MOD.name .. ": Config requires a key name")
            game.print(serpent.line(global.config))
        end
        return nil
    end
end

--Require the awesome console for quick script debugging
interface.console = require("stdlib.debug.console")

--Register with creative-mode for easy testing
if remote.interfaces["creative-mode"] and remote.interfaces["creative-mode"]["register_remote_function_to_modding_ui"] then
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "print_global")
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "reset_mod")
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "reset_user")
    remote.call("creative-mode", "register_remote_function_to_modding_ui", "PYC", "console")
end

return interface
