--stdlib table mutates
require("stdlib.table")
require("stdlib.string")
require("stdlib.defines.color")
require("stdlib.defines.time")

--stdlib Globals
require("stdlib.log.logger")
require("stdlib.config.config")
require("stdlib.event.event")
require("stdlib.event.gui")

--Set up default MOD global variables
MOD = {}
MOD.name = "pycoalprocessing"
MOD.fullname = "PyCoalProcessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = require("config")
MOD.logfile = Logger.new(MOD.name, "info", true, {log_ticks = true})
MOD.log = require("stdlib.debug.debug")
MOD.interface = require("interface")

Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
Event.death_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

-------------------------------------------------------------------------------
--[[Init]]--
-------------------------------------------------------------------------------
function MOD.on_init()
end
Event.register(Event.core_events.init, MOD.on_init)

function MOD.on_configuration_changed(event)
    if event.data.mod_changes then
        local changes = event.data.mod_changes[MOD.name]
        if changes then -- This Mod has changed
            MOD.log("Updated from ".. tostring(changes.old_version) .. " to " .. tostring(changes.new_version), 2)
        end
    end
end
Event.register(Event.core_events.configuration_changed, MOD.on_configuration_changed)

-------------------------------------------------------------------------------
--Require Quickstart for quicker mod testing when creating a character.
--WARNING, This is for mod testing and can ruin existing worlds.
if MOD.config.DEBUG then
    require("stdlib.debug.quickstart")
end

--Activate any scripts needed.
require("scripts.generators")
require("scripts.tailings-pond")

--Add in our remote interfaces
remote.add_interface(MOD.IF, MOD.interface)
