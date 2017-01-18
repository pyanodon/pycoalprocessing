-- Generators.lua base code liberated from KS Power.
local generators = {}
local MAX_TEMP = 100
--local MIN_TEMP = 15
--luacheck: ignore base_1_14_10
local base_1_14_10 = {21.5, 28, 34.5, 41, 47.5, 54, 60.5, 67, 73.5, 80, 86.5, 93, 99.5, 106}

local fluid_data = {
  ["syngas"] = {pollution = 0.30, eff = 12},
  ["refsyngas"] = {pollution = 0.20, eff = 3},

  ["combustion-mixture1"] = {pollution = 0.10, eff=14},
  ["combustion-mixture2"] = {pollution = 0.05, eff=20},

  ["coal-slurry"] = {pollution = 0.05, eff=-15},
  ["ultra-critical-coal"] = {pollution = 0.05, eff=28},
  ["super-critical-coal"] = {pollution = 0.05, eff=30},

  ["diesel-fuel"] = {pollution = 0.05, eff=22},
  ["liquid-fuel"] = {pollution = 0.05, eff=15},
  ["gasoline-fuel"] = {pollution = 0.05, eff=25},

  ["light-oil"] = {pollution = 0.40, eff=-7},
  ["petroleum-gas"] = {pollution = 0.30, eff = 0},

  ["methanol"] = {pollution = 0.50, eff = 10},
  ["hydrogen"] = {pollution = 0.00, eff = 7},
  --Testing liquids, remove before release.
  -- ["water"] = {pollution = 0.0, eff = 50},
  -- ["oxygen"] = {pollution = 0.0, eff = 0},
}

local generator_data = {
  ["gasturbinemk01"] = {name = "gasturbinemk01", base_eff = 50, base_pollution = 0.3},
  ["gasturbinemk02"] = {name = "gasturbinemk02", base_eff = 60, base_pollution = 0.2},
  ["gasturbinemk03"] = {name = "gasturbinemk03", base_eff = 65, base_pollution = 0.1},
  ["gasturbinemk04"] = {name = "gasturbinemk04", base_eff = 70, base_pollution = 0.0},
}

--return the desired temperature based on effiency
--100% effiency is 100deg, mk04 is 80
--coal water gives us 35deg, ultra-coal=100deg
local function set_temp(pot, box)
  local data = fluid_data[box.type]
  if data then
    return ((MAX_TEMP - (MAX_TEMP - pot.base_eff) + data.eff)+0.4)
  else
    return 15
  end
end

local function generate_pollution(pot)
end

local function heat_pot(pot)
  local box = pot.fluidbox[1]
  if not box then return end --Empty box
  box.temperature = set_temp(pot, box)
  pot.fluidbox[1] = box
end

--Add the generator pot to a table
function generators.add_generator(entity)
  global.generator_pot_count = global.generator_pot_count + 1
  global.generator_interval = math.ceil(global.generator_pot_count/200)
  global.generators[global.generator_pot_count] = {
    fluidbox = entity.fluidbox,
    base_pollution = generator_data[entity.name].base_pollution,
    base_eff = generator_data[entity.name].base_eff,
  }
end

--Reset all generator data
function generators.reset_generators()
  doDebug("PYcoalProcessing Resetting all generators", true)
  global.generators = {}
  global.generator_pot_count = 0
  for _, surface in pairs(game.surfaces) do
    local entites = surface.find_entities_filtered{type="generator"}
    for _, entity in pairs(entites) do
      if generator_data[entity.name] then
        generators.add_generator(entity)
      end
    end
  end
end
Event.register(Event.reset_mod, generators.reset_generators)

function generators.on_tick()
  --if not global.generators then return end
  local pots = global.generators
  if pots then
    local interval = global.generator_interval
    local tick = game.tick
    for k, pot in pairs (pots) do
      if (k + tick) % interval == 0 then
        if not (pot.fluidbox and pot.fluidbox.valid) then
          pots[k] = nil
          global.generator_pot_count = global.generator_pot_count - 1
          doDebug("Pot removed")
        else
          heat_pot(pot)
        end
      end
    end
  end
  --global.diesel_pots = pots

end
Event.register(defines.events.on_tick, generators.on_tick)

function generators.on_built_entity(event)
  if generator_data[event.created_entity.name] then
    generators.add_generator(event.created_entity)
    doDebug("Generator added "..event.created_entity.unit_number)
  end
end
Event.register(Event.build_events, generators.on_built_entity)

-------------------------------------------------------------------------------
--[[Init]]

function generators.on_init()
  generators.reset_generators()
end
Event.register(Event.core_events.init, generators.on_init)

function generators.on_configuration_changed(data)
  if data.mod_changes and data.mod_changes[MOD.name] ~= nil then -- This Mod has changed
    doDebug("Updating Generators")
    global.archived_generators = nil
    global.gasturbinemk01 = nil --remove defunct table
    global.archived_gasturbinemk01 = nil --remove defunct table
    generators.reset_generators()
  end
end
Event.register(Event.core_events.configuration_changed, generators.on_configuration_changed)

return generators
