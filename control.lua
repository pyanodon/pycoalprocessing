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

Event[MOD.IF] = {}
Event[MOD.IF]["reset_mod"] = script.generate_event_name()

function MOD.on_init()
  doDebug(MOD.name .. " successfully installed")
end
Event.register(Event.core_events.init, MOD.on_init)

-- function MOD.on_load()
-- end
-- Event.register(Event.core_events.init, MOD.on_load)

function MOD.on_configuration_changed(data)
  if data.mod_changes ~= nil then
    doDebug(MOD.name .. " version changes detected")
    local changes = data.mod_changes[MOD.name]
    if changes ~= nil then -- This Mod has changed
      doDebug(MOD.name .." Updated from ".. tostring(changes.old_version) .. " to " .. tostring(changes.new_version), true)
    end
  end
end
Event.register(Event.core_events.configuration_changed, MOD.on_configuration_changed)

--luacheck: globals generator tailings_pond quickstart generators
--generator = require("scripts.gasturbinemk01")
generators = require("scripts.generators")
tailings_pond = require("scripts.tailings-pond")


if _G.PYC.DEBUG then
quickstart = require("stdlib.utils.quickstart")
end

remote.add_interface(MOD.IF, require("interface"))
