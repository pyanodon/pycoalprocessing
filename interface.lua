local interface = {}

function interface.resetMod()
  Event.dispatch(Event[MOD.IF].reset_mod)
end

function interface.resetUser()
end

function interface.recoverItems()
end

if _G.PYC.DEBUG then
  interface.console = require("stdlib.utils.console")
end

function interface.printGlob(name) --Dumps the global to player and logfile
  if name then
    game.print(serpent.block(global[name], {comment=false, sparse=true}))
    game.write_file("/logs/"..MOD.name .. "/global.log", serpent.block(global[name], {comment=false, sparse=true}))
  else
    game.print(serpent.block(global, {comment=false, sparse=true}))
    game.write_file("/logs/"..MOD.name .. "/global.log", serpent.block(global, {comment=false, sparse=true}))
  end
end

function interface.config(key, value, silent)
  if key then
    --key=string.upper(key)
    if MOD.config.get(key) ~= nil then
      if value ~= nil then
        MOD.config.set(key, value)
        local val=MOD.config.get(key)
        if not silent then game.print(MOD.IF .. ": New value for '" .. key .. "' is " .. "'" .. tostring(val) .."'") end
        return val-- all is well
      else --value nil
        local val = MOD.config.get(key)
        if not silent then game.print(MOD.IF .. ": Current value for '" .. key .. "' is " .. "'" .. tostring(val) .."'") end
        return val
      end
    else --key is nill
      if not silent then game.print(MOD.IF ..": Config '" .. key .. "' does not exist") end
      return nil
    end
  else
    if not silent then
      game.print(MOD.IF .. ": Config requires a key name")
      game.print(serpent.line(MOD.config))
    end
    return nil
  end
end


return interface
