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

--Activate any scripts needed.
require("scripts/tailings-pond")

--Add in our remote interfaces
remote.add_interface(script.mod_name, require('__stdlib__/stdlib/scripts/interface'))

local start_inventory = {}

function start_inventory.on_init()
  if remote.interfaces['freeplay'] then

    local created_items = remote.call("freeplay", "get_created_items")
      created_items["burner-mining-drill"] = 10
      created_items["iron-plate"] = 500
      created_items["copper-plate"] = 500
      created_items["wood"] = 500

      remote.call("freeplay", "set_created_items", created_items)

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
  for p, pack in pairs(tech.research_unit_ingredients) do
		--log('hit')
		if pack.name == 'space-science-pack' then
			--log('hit')
			game.set_game_state
			{
			  game_finished = true,
			  player_won = true,
			  can_continue = true,
			  victorious_force = tech.force
			}
		end
	end
end
Event.register(Event.on_research_finished, game_finish.on_research_finished)

require("scripts/wiki")
