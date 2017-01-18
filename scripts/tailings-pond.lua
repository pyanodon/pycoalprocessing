local tailings_pond = {}

local Position = require("stdlib.area.position")
local Area = require ("stdlib.area.area")

local CFG = MOD.config.TAILINGS_POND
local _gasses = CFG.GAS
local _scorch_chance = CFG.SCORCH_CHANCE
local _scorch_ticks = CFG.SCORCH_TICKS
local _tank_size = CFG.TANK_SIZE
local _pollution_mod = CFG.GAS_POLLUTE_MODIFIER

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

--Destroy any attachments or sprites attached to the entity.
local function destroy_attachments(pond)
  if pond.sprite and pond.sprite.valid then pond.sprite.destroy() end
  if pond.spinner and pond.spinner.valid then pond.spinner.destroy() end
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

local function create_sprite(entity)
  local sprite = entity.surface.create_entity({name = "tailings-pond-sprite", force=entity.force, position = entity.position})
  sprite.orientation = 0
  sprite.destructible = false
  sprite.operable = false
  sprite.rotatable = false
  sprite.insert({name="coal",count=1})
  return sprite
end

local function create_spinner(entity)
  local spinner = entity.surface.create_entity({name = "tailings-pond-spinner", force=entity.force, position = entity.position})
  spinner.insert({name="speed-module", count=1})
  spinner.destructible = false
  spinner.operable = false
  return spinner
end

local function new_pond_data(entity, sprite, spinner)
  return {
    tick = game.tick,
    index = entity.unit_number,
    entity = entity,
    sprite = sprite,
    spinner = spinner,
    full = nil,
    fluid_per = 0,
  }
end

--As the tailings pond get full they leak out and start polluting the ground around them
--Scorch up to 6 tiles from center.
local function scorch_earth(pond, tick)

  --Vent Gasses
  local fluid = empty_pond_gas( pond.entity.fluidbox[1], pond.entity.surface, pond.entity.position)
  --game.print("boxes" .. #pond.entity.fluidbox)

  --No gasses left if we still have fluid
  if fluid then
    --if full set the full tick or check and spill
    if fluid.amount == _tank_size then
      if not pond.full then
        pond.full=tick
        pond.fluid_per = 1
      elseif ((tick >= (pond.full + _scorch_ticks)) and (_scorch_chance > 0 and math.random(1,100) <= _scorch_chance)) or pond.spinner.energy == 0 then
        --spill fluid out here, if not water pollute.
        fluid.amount = fluid.amount / 2
        pond.fluid_per = .5
        pond.full = nil
        --polluted ground is very difficult to walk on, it also ruins any path tiles near it.
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
  --push the updated fluidbox to the entity.
  pond.entity.fluidbox[1] = fluid
end

--Sets animation frame based on tank filled percentage
local function set_animation(pond)
  local fluid_per = pond.fluid_per
  --adjust percentage to match frames.
  if fluid_per > .974 then fluid_per = .974
  elseif fluid_per > 0 and fluid_per < 0.025 then fluid_per = 0.025 end
  pond.sprite.orientation = fluid_per
end

-------------------------------------------------------------------------------
--[[Events]]--

--Reset all tailings_pond data
function tailings_pond.reset_ponds()
  doDebug("Resetting all tailings ponds", true)
  global.tailings_ponds = {}
  local ponds = global.tailings_ponds
  for _, surface in pairs(game.surfaces) do
    for _, pond in pairs(surface.find_entities_filtered{name="tailings-pond"}) do
      --local search = Area.offset(pond.prototype.selection_box, pond.position)
      local spinner = surface.find_entities_filtered{position=pond.position, name="tailings-pond-spinner", limit=1}[1]
      local sprite = surface.find_entities_filtered{position=pond.position, name="tailings-pond-sprite", limit=1}[1]
      if not sprite then
        doDebug("Sprite not found for "..pond.unit_number)
        sprite = create_sprite(pond)
      end
      if not spinner then
        doDebug("Spinner not found for "..pond.unit_number)
        spinner = create_spinner(pond)
      end
      local pond_data = new_pond_data(pond, sprite, spinner)
      ponds[pond_data.index] = pond_data
    end
  end
end
Event.register(Event.reset_mod, tailings_pond.reset_ponds)

function tailings_pond.create(event)
  if event.created_entity.name == "tailings-pond" then
    local ponds = global.tailings_ponds
    local entity = event.created_entity
    entity.direction = defines.direction.north

    local sprite = create_sprite(entity)
    local spinner = create_spinner(entity)

    local pond = new_pond_data(entity, sprite, spinner)
    ponds[pond.index] = pond
  end
end
Event.register(Event.build_events, tailings_pond.create)



function tailings_pond.destroy(event)
  if event.entity.name == "tailings-pond" then
    if global.tailings_ponds[event.entity.unit_number] then
      doDebug("Destroying pond "..event.entity.unit_number)
      destroy_attachments(global.tailings_ponds[event.entity.unit_number])
      global.tailings_ponds[event.entity.unit_number]=nil
    end
  end
end
Event.register(Event.death_events, tailings_pond.destroy)

function tailings_pond.boot_out(event)
  local player=game.players[event.player_index]
  if player.vehicle and player.vehicle.name == "tailings-pond-sprite" then
    player.vehicle.passenger = false
    player.teleport(player.position)
  end
end
Event.register(defines.events.on_player_driving_changed_state, tailings_pond.boot_out)

--Run tick handler every 30 ticks. In the future this will need to be spread out to itereate over a queing system.
function tailings_pond.on_tick(event)
  if event.tick % 30 == 0 then
    local ponds=global.tailings_ponds
    for _, pond in pairs(ponds) do
      if pond.entity.valid and pond.sprite.valid then
        --Vent any gasses, also check for some bob gases.
        -- if liquid then Pollute the ground, and drain some fluid
        scorch_earth(pond, event.tick)
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

function tailings_pond.on_configuration_changed(data)
  if data.mod_changes and data.mod_changes[MOD.name] then -- This Mod has changed
    global.talinings_ponds = global.tailings_ponds or {}
    tailings_pond.reset_ponds()
    MOD.logfile.log("Config Changed tailings_ponds")
  end
end
Event.register(Event.core_events.configuration_changed, tailings_pond.on_configuration_changed)

return tailings_pond
