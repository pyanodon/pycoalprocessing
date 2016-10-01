local generator = {}

-- local function find_generators(surface)
--   if global.gasturbinemk01 == nil then
--     global.gasturbinemk01 = {}
--     for c in surface.get_chunks() do
--       for _, gasturbinemk01 in pairs(surface.find_entities_filtered({area={{c.x * 32, c.y * 32}, {c.x * 32 + 32, c.y * 32 + 32}}, name="gasturbinemk01"})) do
--         table.insert(global.gasturbinemk01, gasturbinemk01)
--       end
--     end
--   end
-- end

local fluidTypeToTemperature =
{
  ["syngas"] =
  {
    min = 99.6,
    set = 100
  },
}

local function check_generators()
  if global.archived_gasturbinemk01 == nil then
    global.archived_gasturbinemk01 = {}
  end
  if global.gasturbinemk01 ~= nil then
    for k,gen in pairs(global.gasturbinemk01) do
      if gen.valid then
        if gen.fluidbox[1] ~= nil then
          local pot = gen.fluidbox[1]
          --local p = gen.position
          local lookup = fluidTypeToTemperature[pot.type]
          if lookup ~= nil then
            pot["temperature"] = lookup.set
          else pot["temperature"] = 15
          end
          if math.floor(gen.fluidbox[1]["temperature"] + 0.01) == pot["temperature"] then
            table.insert(global.archived_gasturbinemk01, gen)
            table.remove(global.gasturbinemk01, k)
            --game.players[1].print{"Generator was archived "..#global.archived_gasturbinemk01.." "..#global.gasturbinemk01}
          end

          gen.fluidbox[1] = pot

        else
          if global.archived_gasturbinemk01 == nil then
            global.archived_gasturbinemk01 = {}
          end
          table.insert(global.archived_gasturbinemk01, gen)
          table.remove(global.gasturbinemk01, k)
          --game.players[1].print{"empty pot was archived "..#global.archived_gasturbinemk01.." "..#global.gasturbinemk01}
        end

      else table.remove(global.gasturbinemk01, k)
        --game.players[1].print{"Generator was removed from index "..#global.archived_gasturbinemk01.." "..#global.gasturbinemk01}
      end
    end
  end
end

local function recheck_archived_generators()
  if global.archived_gasturbinemk01 == nil then
    global.archived_gasturbinemk01 = {}
  end
  if not global.gen_index then global.gen_index = 1 end
  local gen_index = global.gen_index
  local generators = global.archived_gasturbinemk01
  local num_archived = #generators
  local gen = generators[gen_index]

  if gen ~= nil then
    if gen.valid then
      local pot = gen.fluidbox[1]
      if pot ~= nil then
        local lookup = fluidTypeToTemperature[pot.type]
        if lookup ~= nil then
          if pot["temperature"] < lookup.min then
            pot["temperature"] = lookup.set
            gen.fluidbox[1] = pot
            table.insert(global.gasturbinemk01, gen)
            table.remove(global.archived_gasturbinemk01, gen_index)
            gen_index = gen_index - 1
          end
        end
      end
    else table.remove(global.archived_gasturbinemk01, gen_index)
      gen_index = gen_index - 1
    end
    if gen_index == num_archived then gen_index = 0 end
    gen_index = gen_index +1
  end
  global.gen_index = gen_index
end

function generator.on_init()
end

function generator.on_tick()
--local t = event.tick
	check_generators()
	recheck_archived_generators()
end
Event.register(defines.events.on_tick, generator.on_tick)


function generator.on_built_entity(event)
	if event.created_entity.name == "gasturbinemk01" then

		if global.gasturbinemk01 == nil then global.gasturbinemk01 = {} end
	if global.archived_gasturbinemk01 == nil then global.archived_gasturbinemk01 = {} end
			local gasturbinemk01 = event.created_entity
						if global.gasturbinemk01 == nil
						then global.gasturbinemk01 = {}
						end
					table.insert(global.archived_gasturbinemk01, gasturbinemk01)
	end
end
Event.register({defines.events.on_built_entity, defines.events.on_robot_built_entity}, generator.on_built_entity)


return generator
