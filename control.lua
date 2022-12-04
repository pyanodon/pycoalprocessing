local Event = require("__stdlib__/stdlib/event/event")
local Version = require("__stdlib__/stdlib/vendor/semver")

--Set up default MOD global variables
MOD = {}
MOD.name = "pycoalprocessing"
MOD.fullname = "PyCoalProcessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"
MOD.config = require("config")

Event.build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive}
Event.death_events = {defines.events.on_pre_player_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}

--Activate any scripts needed.
require("scripts/tailings-pond")

--Add in our remote interfaces
remote.add_interface(script.mod_name, require('__stdlib__/stdlib/scripts/interface'))

local start_inventory = {}

function start_inventory.on_init()
  if remote.interfaces['freeplay'] then

    local created_items = remote.call("freeplay", "get_created_items")
    created_items["burner-mining-drill"] = 10
    remote.call("freeplay", "set_created_items", created_items)

    local debris_items = remote.call("freeplay", "get_debris_items")
    debris_items["iron-plate"] = 100
    debris_items["copper-plate"] = 50
    remote.call("freeplay", "set_debris_items", debris_items)
  end
end
Event.register(Event.core_events.init, start_inventory.on_init)

local game_finish = {}

function game_finish.on_init()
  if remote.interfaces['freeplay'] then
    remote.call("silo_script", "set_no_victory", true)
  end
end
Event.register(Event.core_events.init, game_finish.on_init)

function game_finish.on_research_finished(event)
  local tech = event.research
  if tech.name == "pyrrhic" then
    local force = tech.force
    for _, player in pairs(game.connected_players) do
      if player.force == force then player.opened = nil end
    end
    game.set_game_state
    {
      game_finished = true,
      player_won = true,
      can_continue = true,
      victorious_force = force
    }
	end
end
Event.register(defines.events.on_research_finished, game_finish.on_research_finished)


require("scripts/wiki")

local on_built = {}

function on_built.inserter(event)
  local inserter = event.created_entity
  if inserter.type ~= "inserter" then
    return
  end
  if
    inserter.get_control_behavior()
    or next(inserter.circuit_connected_entities.red)
    or next(inserter.circuit_connected_entities.green)
    or inserter.get_filter(1)
  then
    return
  end
  inserter.inserter_filter_mode = "blacklist"
end

Event.register(Event.build_events, on_built.inserter)
-- grumble grumble filters apply for the whole mod
for _, event in pairs(Event.build_events) do
  script.set_event_filter(event, {
    {
      filter = "name",
      name = "inserter"
    },
    {
      filter = "name",
      name = "burner-inserter"
    },
    {
      filter = "type",
      type = "inserter",
      mode = "and"
    },
    {
      filter = "type",
      type = "storage-tank",
      mode = "or"
    },
    {
      filter = "name",
      name = "tailings-pond",
      mode = "and"
    }
  })
end

Event.on_configuration_changed(function (event)
  local pycp_change = (event.mod_changes or {})["pycoalprocessing"]
  local old_version = (pycp_change or {}).old_version
  if not pycp_change or old_version and Version(old_version) > Version(1,9,4) then
    return
  end
  log(
    string.format("Pycp updated from %s to %s; updating inserter filters", pycp_change.old_version or "nil", pycp_change.new_version)
  )
  for _, surface in pairs(game.surfaces) do
      for _, entity in pairs(surface.find_entities_filtered{ type = "inserter", name = { "inserter", "burner-inserter" } }) do
        if not entity.get_filter(1) and entity.inserter_filter_mode ~= "blacklist" then
            entity.inserter_filter_mode = "blacklist"
        end
      end
  end
end)
