local tailings_pond = {}

local Position = require("stdlib.area.position")
local Area = require ("stdlib.area.area")

--Pond contains gases, lets spill them out. Only negative is this can be used as a "gas" void so...
--creates 1 point of pollution per gas voided.
local function empty_pond_gas(surface, position, fluid)
  surface.pollute(position, fluid.amount * _G.PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER)
  return nil
end

--Gets the terrain name at position
local function get_terrain_name(surface, position)
  return surface.get_hidden_tile(position) or surface.get_tile(position[1], position[2]).name
end

local function get_unpolluted_terrain(surface, position)
  local area = Position.expand_to_area(position, 6)
  local tiles = {}
  for x,y in Area.spiral_iterate(area) do
    tiles[#tiles+1] = {name="polluted-ground", position={x=x,y=y}}
  end
  return tiles
end

--TODO create pollution on destruction

--As the tailings pond get full they start polluting the ground around them
--Scorch up to 6 tiles from center.
local function scorch_earth(pond)
  if _G.PYC.TAILINGS_POND.SCORCH and #pond.tiles > 0 and pond.fluid.percent > .5 then
    if not (string.contains(pond.fluid.type, "water")) then
      if ((math.random()/2)+(pond.fluid.percent/1.75)) > 1 then
        local surface = pond.entity.surface

        if #pond.tiles > 0 then
          surface.set_tiles(pond.tiles, true)
          pond.tiles = {}
        end

      end
    end
  end
end

--Destroy any attachments or sprites attached to the entity.
local function destroy_attachments(pond)
  if pond.sprite and pond.sprite.valid then pond.sprite.destroy() end
  if pond.spinner and pond.spinner.valid then pond.spinner.destroy() end
end

--Sets animation frame based on tank filled percentage
local function set_animation(pond)
  local fluid = pond.entity.fluidbox[1]
  local fluid_per = 0

  if pond.spinner.energy <= 0 and pond.entity.active then
    pond.entity.active=false
  elseif pond.spinner.energy > 0 and not pond.entity.active then
    pond.entity.active=true
  end

  if fluid and (string.contains(fluid.type, "gas-")
    or string.contains(fluid.type, "-air") or string.contains(fluid.type, "steam")
    or string.contains(fluid.type, "-gas")) then
    pond.entity.fluidbox[1] = empty_pond_gas(pond.entity.surface, pond.entity.position, fluid)
  elseif fluid and fluid.amount > 0 then
    fluid_per = tonumber( string.format("%.3f", (fluid.amount / _G.PYC.TAILINGS_POND.TANK_SIZE)))
    pond.fluid.percent = fluid_per
    pond.fluid.amount = fluid.amount
    pond.fluid.type = fluid.type
    if fluid_per > .974 then
      fluid_per = .974
    elseif fluid_per > 0 and fluid_per < 0.025 then fluid_per = 0.025 end
  end
  pond.sprite.orientation = fluid_per
end

function tailings_pond.create(event)
  if event.created_entity.name == "tailings-pond" then

    local entity = event.created_entity
    --entity.rotatable=false
    entity.direction=defines.direction.north
    entity.active=false

    local sprite = entity.surface.create_entity({name = "tailings-pond-sprite", force=entity.force, position = entity.position})
    sprite.orientation= 0
    sprite.destructible = false
    sprite.operable=false
    sprite.rotatable=false
    sprite.insert({name="coal",count=1})

    local spinner = entity.surface.create_entity({name = "tailings-pond-spinner", force=entity.force, position = entity.position})
    spinner.insert({name="speed-module", count=1})
    spinner.destructible = false
    spinner.operable=false

    local ponds = global.tailings_ponds
    local pond = {
      tick = event.tick,
      index = entity.unit_number,
      entity = entity,
      sprite = sprite,
      spinner = spinner,
      tiles = get_unpolluted_terrain(entity.surface, entity.position),
      fluid = {
        type = "",
        amount = 0,
        percent = 0,
      },
      mt = {}
    }
    ponds[pond.index] = pond
  end
end

function tailings_pond.destroy(event)
  if event.entity.name == "tailings-pond" then
    if global.tailings_ponds[event.entity.unit_number] then
      destroy_attachments(global.tailings_ponds[event.entity.unit_number])
      global.tailings_ponds[event.entity.unit_number]=nil
    end
  end
end

--Run tick handler every 30 ticks. In the future this will need to be spread out to itereate over a queing system.
function tailings_pond.on_tick(event)
  if event.tick % 30 == 0 then
    local ponds=global.tailings_ponds
    for _, pond in pairs(ponds) do
      if pond.entity.valid and pond.sprite.valid then
        set_animation(pond)
        if event.tick > pond.tick + _G.PYC.TAILINGS_POND.SCORCH_TICKS then
          scorch_earth(pond)
          pond.tick=event.tick
        end
      end
    end
  end
end

function tailings_pond.on_init()
  global.tailings_ponds={}
end

return tailings_pond
