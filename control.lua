require("config")

MOD = {}
MOD.name = "tailings_pond"
MOD.IF = "TP"
MOD.path = "__tailings_pond__"

require("stdlib.string")
local Position = require("stdlib.area.position")
local Area = require ("stdlib.area.area")
local tailings_pond = {}

--Pond contains gases, lets spill them out. Only negative is this can be used as a "gas" void so...
--creates 1 point of pollution per gas voided.
local function empty_pond_gas(surface, position, fluid)
  surface.pollute(position, fluid.amount * _G.TAILINGS_POND.GAS_POLLUTE_MODIFIER)
  return nil
end

--Scorch the earth spilling all liquid when destroyed
--Scorch earth randomly while tank is full.
local function scorch_earth(pond, destroyed) --luacheck ignore
  --TODO create pollution on destruction
  if not destroyed and not _G.TAILINGS_POND.SCORCH then return end
  local fluid = pond.entity.fluidbox[1]
  local spillage=0
  if fluid and fluid.amount and fluid.type ~= "water" then
    spillage = fluid.amount
  end
  spillage = (spillage/400)/2
  if spillage >= .5 then
    local area = Position.expand_to_area(pond.entity.position, spillage)
    --pond.entity.surface.find(tiles)
    local tiles = {}
    for x, y in Area.spiral_iterate(area) do
      tiles[#tiles+1] = {name="dirt-dark", position={x,y}}
    end
    pond.entity.surface.set_tiles(tiles, true)
  end

end

--Destroy any attachments or sprites attached to the entity, possibly change this to an area check.
local function destroy_attachments(entity)
  for _, attachment in pairs(entity.surface.find_entities_filtered{position=entity.position}) do
    if attachment and attachment.valid and attachment ~= entity then
      attachment.destroy()
    end
  end
end

--Sets animation frame based on tank filled percentage
local function set_animation(pond)
  local fluid = pond.entity.fluidbox[1]
  local fluid_per = 0

  if fluid and (string.contains(fluid.type, "gas-")
    or string.contains(fluid.type, "-air") or string.contains(fluid.type, "steam")
    or string.contains(fluid.type, "-gas")) then
    pond.entity.fluidbox[1] = empty_pond_gas(pond.entity.surface, pond.entity.position, fluid)
  elseif fluid and fluid.amount > 0 then
    fluid_per = (fluid.amount / _G.TAILINGS_POND.TANK_SIZE)
    if fluid_per > .974 then fluid_per = .974
    elseif fluid_per > 0 and fluid_per < 0.25 then fluid_per = 0.25 end
  end
  pond.sprite.orientation = fluid_per
end

function tailings_pond.create(event)
  if event.created_entity.name == "tailings-pond" then
    local entity = event.created_entity
    entity.rotatable=false
    entity.direction=defines.direction.north
    local sprite = entity.surface.create_entity({name = "tailings-pond-sprite", force=entity.force, position = entity.position})
    sprite.orientation= 0
    sprite.destructible = false
    sprite.operable=false
    sprite.rotatable=false
    sprite.insert({name="coal",count=1})
    local ponds = global.tailings_ponds
    local pond = {
      created = event.tick,
      index = entity.unit_number,
      entity = entity,
      sprite = sprite,
    }
    ponds[pond.index] = pond
  end
end
script.on_event({defines.events.on_robot_built_entity, defines.events.on_built_entity}, tailings_pond.create)

function tailings_pond.destroy(event)
  if event.entity.name == "tailings-pond" then
    local entity = event.entity
    local pond = global.tailings_ponds[entity.unit_number]
    scorch_earth(pond, true)
    destroy_attachments(entity)
    pond=nil --luacheck: ignore
  end
end
script.on_event({defines.events.on_preplayer_mined_item, defines.events.on_robot_mined, defines.events.on_entity_died}, tailings_pond.destroy)

--Run tick handler every 30 ticks. In the future this will need to be spread out to itereate over a queing system.
function tailings_pond.on_tick(event)
  if event.tick % 30 == 0 then
    local ponds=global.tailings_ponds
    for _, pond in pairs(ponds) do
      if pond.entity.valid and pond.sprite.valid then
        set_animation(pond)
        scorch_earth(pond, false)
      end
    end
  end
end
script.on_event(defines.events.on_tick, tailings_pond.on_tick)

function tailings_pond.on_init()
  global.tailings_ponds={}
end
script.on_init(tailings_pond.on_init)

if _G.TAILINGS_POND._DEBUG then require("stdlib.quickstart") end

remote.add_interface(MOD.IF, require("interface"))
