require("config")
require("stdlib.utils.utils")
_G.Event=require("stdlib.event.event")

MOD = {}
MOD.name = "pycoalprocessing"
MOD.IF = "PYC"
MOD.path = "__pycoalprocessing__"


local generator = require("scripts.gasturbinemk01")
local tailings_pond = require("scripts.tailings-pond")


if _G.PYC.DEBUG then
  require("stdlib.utils.quickstart")
end

script.on_init(function ()
  tailings_pond.on_init()
end)

script.on_event(defines.events.on_tick, function (event)
  tailings_pond.on_tick(event)
  generator.on_tick(event)
end)


Event.register({defines.events.on_robot_built_entity, defines.events.on_built_entity}, tailings_pond.create)
Event.register({defines.events.on_preplayer_mined_item, defines.events.on_robot_mined, defines.events.on_entity_died}, tailings_pond.destroy)

Event.register({defines.events.on_built_entity, defines.events.on_robot_built_entity}, generator.on_built_entity)
-- local mined_table = {defines.events.on_preplayer_mined_item, defines.events.on_entity_died, defines.events.on_robot_pre_mined}
-- Event.register(mined_table , MinedEntity)


remote.add_interface(MOD.IF, require("interface"))
