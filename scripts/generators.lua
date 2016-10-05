local generators = {}
local MAX_TEMP = 100
--luacheck: ignore base_1_14_10
local base_1_14_10 = {21.5, 28, 34.5, 41, 47.5, 54, 60.5, 67, 73.5, 80, 86.5, 93, 99.5, 106}

generators.fluid_data = {
  ["syngas"] = {pollution = 0.3, eff = 0},
  ["refsyngas"] = {pollution = 0.2, eff = 3},
  ["combustion-mixture1"] = {pollution = 0.1, eff=0},
  ["light-oil"] = {pollution = 0.4, eff=-7},
  ["petroleum-gas"] = {pollution = 0.3, eff = -9},
  ["methanol"] = {pollution = 0.1, eff = -8},
  --["water"] = {pollution = 0.0, eff = 50},
}

generators.generator_data = {
  ["gasturbinemk01"] = {name = "gasturbinemk01", base_eff = 50, base_pollution = 0.3},
  ["gasturbinemk02"] = {name = "gasturbinemk02", base_eff = 60, base_pollution = 0.2},
  ["gasturbinemk03"] = {name = "gasturbinemk03", base_eff = 70, base_pollution = 0.1},
  ["gasturbinemk04"] = {name = "gasturbinemk04", base_eff = 80, base_pollution = 0.0},
}

--return the desired temperature based on effiency
local function get_temp(eff, machine_eff)
  -- 100% effiency is 100deg, mk04 is 70
  --coal water gives us 35deg, ultra-coal=90deg
  return (MAX_TEMP - (MAX_TEMP - machine_eff) + eff)
end

--Add the generator to our global table indexed by unit number
function generators.add_generator(entity)
  local generator = {
    index = entity.unit_number,
    name = entity.name,
    entity = entity,
    base_pollution = generators.generator_data[entity.name].base_pollution,
    base_eff = generators.generator_data[entity.name].base_eff,
    mt = {}
  }
  generator.mt.__index = generator.entity
  setmetatable (generator, generator.mt)
  global.generators[generator.index] = generator
end

--Reset all generator data
function generators.reset_generators()
  doDebug("Resetting all generators")
  global.generators = {}
  for _, surface in pairs(game.surfaces) do
    local entites = surface.find_entities_filtered{type="generator"}
    for _, entity in pairs(entites) do
      if generators.generator_data[entity.name] then
        --global.archived_generators[entity.unit_number] = nil
        generators.add_generator(entity)
      end
    end
  end
end
Event.register(Event[MOD.IF].reset_mod, generators.reset_generators)

--check generators for fluid and set tempurature and pollution
function generators.check_generators()
  for _, generator in pairs(global.generators) do
    if generator.entity and generator.entity.valid then
      if generator.fluidbox[1] then
        local pot = generator.fluidbox[1]
        local pot_data = generators.fluid_data[pot.type]
        if pot_data then
          pot.temperature = get_temp(pot_data.eff, generator.base_eff)
          generator.entity.fluidbox[1]=pot
          --create pollution
          if pot.amount < 10 then
            generator.surface.pollute(generator.position, ((pot_data.pollution + generator.base_pollution)/2))
          end
        else
          --25deg or less stops providing electricity.
          --might need to toggle between active and not?
          pot.temperature = 15
          generator.entity.fluidbox[1] = pot
        end
      end
    else
      --generator invalid so lets remove it.
      global.generators[generator.index]=nil
    end
  end

end

function generators.on_init()
  global.generators = {}
  --global.archived_generators = {}
end
Event.register(Event.core_events.init, generators.on_init)

function generators.on_load()
  for _, gen in pairs (global.generators) do
    setmetatable (gen, gen.mt)
  end
end
Event.register(Event.core_events.load, generators.on_load)

function generators.on_configuration_changed(data)
  local changes = data.mod_changes[MOD.name]
  if changes ~= nil then -- This Mod has changed
    doDebug("Updating Generators")
    global.generators = global.generators or {}
    --global.archived_generators = global.archived_generators or {}
    global.gasturbinemk01 = nil --remove defunct table
    global.archived_gasturbinemk01 =nil --remove defunct table
    generators.reset_generators()
  end
end
Event.register(Event.core_events.configuration_changed, generators.on_configuration_changed)

function generators.on_tick()
  generators.check_generators()
  -- recheck_archived_generators()
end
Event.register(defines.events.on_tick, generators.on_tick)

function generators.on_built_entity(event)
  if generators.generator_data[event.created_entity.name] then
    generators.add_generator(event.created_entity)
    doDebug("Generator added")
  end
end
Event.register({defines.events.on_built_entity, defines.events.on_robot_built_entity}, generators.on_built_entity)

--Remove the generator from both lists when destroyed
function generators.on_destroy(event)
  global.generators[event.entity.unit_number] = nil
  --global.archived_generators[event.entity.unit_number] = nil
end
local death_events = {defines.events.on_preplayer_mined_item, defines.events.on_robot_pre_mined, defines.events.on_entity_died}
Event.register(death_events, generators.on_destroy)

return generators
