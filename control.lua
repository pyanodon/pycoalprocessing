_G.PYC = require("config")
require("stdlib.log.logger")
require("stdlib.config.config")

MOD = {}
MOD.name = "pycoalprocessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = Config.new({})
MOD.config.set("loglevel", 2)
MOD.logfile = Logger.new(MOD.name, "info", true, {log_ticks = true})

require("stdlib.utils.debug")
require("stdlib.utils.utils")  -- string, table, time, colors
require("stdlib.event.event") --Event system
require("stdlib.gui.gui") --Gui system


--luacheck: globals generator tailings_pond
generator = require("scripts.gasturbinemk01")
tailings_pond = require("scripts.tailings-pond")


if _G.PYC.DEBUG then
  require("stdlib.utils.quickstart")
end

remote.add_interface(MOD.IF, require("interface"))
