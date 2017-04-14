--require Logger and Config libraries
require("stdlib")

--Set up default MOD global variables
MOD = {}
MOD.name = "pycoalprocessing"
MOD.fullname = "PyCoalProcessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = require("config")
MOD.logfile = Logger.new(MOD.name, "info", true, {log_ticks = true})
MOD.logfile.file_name = MOD.logfile.file_name:gsub("logs/", "", 1)
MOD.log = require("stdlib.debug.debug")

--Generate any custom events
Event.reset_mod = script.generate_event_name()
Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
Event.death_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

--Require Quickstart for quicker mod testing when creating a character.
--WARNING, This is for mod testing and can ruin existing worlds.
if MOD.config.DEBUG then
    require("stdlib.debug.quickstart")
end

-------------------------------------------------------------------------------
--[[Log Init and updates]]
--Master Init
function MOD.on_init()
    MOD.log("Installing", 1)
end
Event.register(Event.core_events.init, MOD.on_init)

--Master update checker
function MOD.on_configuration_changed(data)
    if data.mod_changes ~= nil then
        MOD.log("mod changes detected")
        local changes = data.mod_changes[MOD.name]
        if changes ~= nil then -- This Mod has changed
            MOD.log("Updated from ".. tostring(changes.old_version) .. " to " .. tostring(changes.new_version), 2)
        end
    end
end
Event.register(Event.core_events.configuration_changed, MOD.on_configuration_changed)
-------------------------------------------------------------------------------

--Activate any scripts needed.
require("scripts.generators")
require("scripts.tailings-pond")

--Add in our remote interfaces
remote.add_interface(MOD.IF, require("interface"))
