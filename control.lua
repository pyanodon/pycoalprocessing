local Event = require("__stdlib__/stdlib/event/event")

--Set up default MOD global variables
MOD = {}
MOD.name = "pycoalprocessing"
MOD.fullname = "PyCoalProcessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = require("config")

Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built}
Event.death_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

--Require Quickstart for quicker mod testing when creating a character.
--WARNING, This is for mod testing and can ruin existing worlds.
if MOD.config.DEBUG and not remote.interfaces['quickstart-script'] then
    require("__stdlib__/stdlib/core").create_stdlib_globals()
    require("__stdlib__/stdlib/scripts/quickstart")
end

--Activate any scripts needed.
require("scripts/tailings-pond")

--Add in our remote interfaces
remote.add_interface(script.mod_name, require('__stdlib__/stdlib/scripts/interface'))

--Activate resource spawn control script
--require("scripts/resource-generation")

local function on_player_created(event)
  local player = game.players[event.player_index]
  player.insert({name="burner-mining-drill", count=9})
  player.insert({name="iron-plate", count=492})
  player.insert({name="copper-plate", count=500})
  player.insert({name="wood", count=499})
end
Event.register(defines.events.on_player_created, on_player_created)

require("scripts/wiki")