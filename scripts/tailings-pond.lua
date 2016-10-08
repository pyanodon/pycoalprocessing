local tailings_pond = {}

local Position = require("stdlib.area.position")
local Area = require ("stdlib.area.area")

--list of ventable gasses
local _gasses = _G.PYC.TAILINGS_POND.GAS
local _scorch_chance = _G.PYC.TAILINGS_POND.SCORCH_CHANCE
local _scorch_ticks = _G.PYC.TAILINGS_POND.SCORCH_TICKS
local _tank_size = _G.PYC.TAILINGS_POND.TANK_SIZE
local _pollution_mod = _G.PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER

--Gets the terrain name at position
local function get_terrain_name(surface, position) --luacheck: ignore
  return surface.get_hidden_tile(position) or surface.get_tile(position[1], position[2]).name
end

local function get_unpolluted_terrain(surface, position) --luacheck: ignore
  local area = Position.expand_to_area(position, 6)
  local tiles = {}
  for x,y in Area.spiral_iterate(area) do
    tiles[#tiles+1] = {name="polluted-ground", position={x=x,y=y}}
  end
  return tiles
end

--Pond contains gases, lets spill them out. Only negative is this can be used as a "gas" void so...
--If the gas is "polluting" create pollution, else just vent.
local function empty_pond_gas(fluid, surface, position)

  if fluid then
    if (string.contains(fluid.type, "-gas") or string.contains (fluid.type, "gas-") and not _gasses[fluid.type] == false)
    or _gasses[fluid.type] == true then
      surface.pollute(position, fluid.amount * _pollution_mod)
      return nil
    elseif _gasses[fluid.type] == false then
      return nil
    end
    return fluid
  end

end

--As the tailings pond get full they leak out and start polluting the ground around them
--Scorch up to 6 tiles from center.
local function scorch_earth(pond, tick)

  --Vent Gasses
  local fluid = empty_pond_gas( pond.entity.fluidbox[1], pond.entity.surface, pond.entity.position)

  --No gasses left if we still have fluid
  if fluid then
    --if full set the full tick or check and spill
    if fluid.amount == _tank_size then
      if not pond.full then
        pond.full=tick
        pond.fluid_per = 1
      elseif (tick >= (pond.full + _scorch_ticks)) and (_scorch_chance > 0 and math.random(1,100) <= _scorch_chance) then
        --spill fluid out here, if not water pollute.
        fluid.amount = fluid.amount / 2
        pond.fluid_per = .5
        pond.full = nil
        --polluted ground is very difficult to walk on, it also ruins and path tiles near it.
        --TODO Issues when polluting near water.
        if string.contains(fluid.type, "dirty") or not string.contains(fluid.type, "water") then
          local tiles = {}
          for x, y in Area.spiral_iterate(Position.expand_to_area(pond.entity.position, 6)) do
            tiles[#tiles+1] = {name="polluted-ground", position={x=x,y=y}}
          end
          pond.entity.surface.set_tiles(tiles, true)
        end -- polluting liquids
      end -- Full Pond
    else -- not full fluid
      --Get fluid percentage amount for animation from 0.25 starts first frame, .974 is end of last frame
      pond.fluid_per = tonumber( string.format("%.3f", (fluid.amount / _tank_size)))

    end

  else -- no fluid
    pond.fluid_per = 0
  end
  pond.entity.fluidbox[1] = fluid
  -- end
  --
  --
  --
  --
  -- if pond.fluid_per > .5 then end
  --
  -- if tick > pond.tick + scorch_ticks then
  -- scorch_earth(pond)
  -- pond.tick=event.tick
  -- end
  -- if can_scorch and pond.fluid.percent > .5 then
  --
  -- if not (string.contains(pond.fluid.type, "water") and not string.contains(pond.fluid.type, "dirty") then
  --
  --
  -- if ((math.random()/2)+(pond.fluid.percent/1.75)) > 1 then
  -- local surface = pond.entity.surface
  -- local tiles = {}
  -- for x, y in Area.spiral_iterate(Position.Position.expand_to_area(pond.entity.position, 6)) do
  -- tiles[#tiles+1] = {name="polluted-ground", position={x=x,y=y}}
  -- end
  -- surface.set_tiles(pond.tiles, true)
  --
  -- end
  -- end
  -- end
end

--Switches pond "intake" pumps/valves on or off based on power.
local function pond_active(pond)
  if pond.spinner.energy <= 0 and pond.entity.active then
    pond.entity.active=false
    return false
  elseif pond.spinner.energy > 0 and not pond.entity.active then
    pond.entity.active=true
    return true
  end
end

-- local function empty_pond_gas(pond)
-- local fluid = pond.entity.fluidbox[1]
-- if fluid then
-- if (string.contains(fluid.type, "-gas") or string.contains (fluid.type, "gas-") and not gasses[fluid.type] == false)
-- or gasses[fluid.type] == true then
-- local surface, position = pond.entity.surface, pond.entity.position
-- surface.pollute(position, fluid.amount * _G.PYC.TAILINGS_POND.GAS_POLLUTE_MODIFIER)
-- doDebug("Pollutes" .. fluid.type)
-- pond.entity.fluidbox[1] = nil
-- return
-- elseif gasses[fluid.type] == false then
-- doDebug("NO pollution" .. fluid.type)
-- pond.entity.fluidbox[1] = nil
-- return
-- end
-- end
-- end

--Sets animation frame based on tank filled percentage
local function set_animation(pond)
  local fluid_per = pond.fluid_per

  --adjust percentage to match frames.
  if fluid_per > .974 then fluid_per = .974
  elseif fluid_per > 0 and fluid_per < 0.025 then fluid_per = 0.025 end

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
      full = nil,
      fluid_per = 0,
      mt = {}
    }
    ponds[pond.index] = pond
  end
end
Event.register(Event.build_events, tailings_pond.create)

--Destroy any attachments or sprites attached to the entity.
local function destroy_attachments(pond)
  if pond.sprite and pond.sprite.valid then pond.sprite.destroy() end
  if pond.spinner and pond.spinner.valid then pond.spinner.destroy() end
end

function tailings_pond.destroy(event)
  if event.entity.name == "tailings-pond" then
    if global.tailings_ponds[event.entity.unit_number] then
      destroy_attachments(global.tailings_ponds[event.entity.unit_number])
      global.tailings_ponds[event.entity.unit_number]=nil
    end
  end
end
Event.register(Event.death_events, tailings_pond.destroy)

--Run tick handler every 30 ticks. In the future this will need to be spread out to itereate over a queing system.
function tailings_pond.on_tick(event)
  if event.tick % 30 == 0 then
    local ponds=global.tailings_ponds
    for _, pond in pairs(ponds) do
      if pond.entity.valid and pond.sprite.valid then

        --Vent any gasses, also check for some bob gases.
        -- if water then Pollute the ground, and drain some fluid
        scorch_earth(pond, event.tick)

        --Should pond be active, If it has no power then the "intake pumps" are turned off and will not allow it to fill.
        pond_active(pond)

        --Set the animation needed based on fill level..

        set_animation(pond)

      end
    end
  end
end
Event.register(defines.events.on_tick, tailings_pond.on_tick)

function tailings_pond.on_init()
  global.tailings_ponds={}
  MOD.logfile.log("Init tailings_ponds")
end
Event.register(Event.core_events.init, tailings_pond.on_init)

return tailings_pond
