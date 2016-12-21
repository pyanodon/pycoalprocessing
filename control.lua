--Require Config Settings
_G.PYC = require("config")

--require Logger and Config libraries
require("stdlib.log.logger")
require("stdlib.config.config")

--Set up default MOD global variables
MOD = {}
MOD.name = "pycoalprocessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = Config.new({})
MOD.config.set("loglevel", 2)
MOD.logfile = Logger.new(MOD.name, "info", true, {log_ticks = true})

require("stdlib.utils.debug") -- require debug functions (requires Mod.logfile be set)
require("stdlib.utils.utils")  -- string, table, time, colors
require("stdlib.event.event") --Event system
require("stdlib.gui.gui") --Gui system

--Generate any custom events
Event.reset_mod = script.generate_event_name()
Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
Event.death_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

local function debug_fluids()
  local header = "Fluid, Def Temp, Max Temp, Heat Cap, Press to Speed, Flow to Energy\n"
  game.write_file("logs/pycoalprocessing/fluid_data.csv", header)
  for _, fluid in pairs (game.fluid_prototypes) do
    local string
    --string = "["..fluid.name.."]"
    string = fluid.name .. "," ..fluid.default_temperature .. "," .. fluid.max_temperature .. ",".. fluid.heat_capacity .. "," .. fluid.pressure_to_speed_ratio .. ","..fluid.flow_to_energy_ratio .. "\n"
    game.write_file("logs/pycoalprocessing/fluid_data.csv",string,true)
  end
end


-------------------------------------------------------------------------------
--[[Log Init and updates]]
--Master Init
function MOD.on_init()
  doDebug(MOD.name .. " successfully installed")
  if _G.PYC.DEBUG then debug_fluids() end
end
Event.register(Event.core_events.init, MOD.on_init)

--Master update checker
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
-------------------------------------------------------------------------------

--Activate any scripts needed.
--luacheck: globals tailings_pond quickstart generators
generators = require("scripts.generators")
tailings_pond = require("scripts.tailings-pond")

--Require Quickstart for quicker mod testing when creating a character.
--WARNING, This is for mod testing and can ruin existing worlds.
if _G.PYC.DEBUG_QUICKSTART then
quickstart = require("stdlib.utils.quickstart")
end

--Add in our remote interfaces
remote.add_interface(MOD.IF, require("interface"))
