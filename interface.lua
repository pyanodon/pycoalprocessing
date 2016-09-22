local interface = {}

function interface.resetMod()
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
    game.write_file("/logs/"..MOD.name .. "/debug.log", serpent.block(global[name], {comment=false, sparse=true}))
  else
    game.print(serpent.block(global, {comment=false, sparse=true}))
    game.write_file("/logs/"..MOD.name .. "/debug.log", serpent.block(global, {comment=false, sparse=true}))
  end
end


return interface
