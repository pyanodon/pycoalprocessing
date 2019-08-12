local tailings_pond = {}

local Event = require('__stdlib__/stdlib/event/event')
local Position = require('__stdlib__/stdlib/area/position')
local Area = require('__stdlib__/stdlib/area/area')

local CFG = MOD.config.TAILINGS_POND
local _gasses = CFG.GAS
local _scorch_chance = CFG.SCORCH_CHANCE
local _scorch_ticks = CFG.SCORCH_TICKS
local _pollution_mod = CFG.GAS_POLLUTE_MODIFIER

local Tiles = {}

--Pond contains gases, lets spill them out. Only negative is this can be used as a "gas" void so...
--If the gas is "polluting" create pollution, else just vent.
local function empty_pond_gas(fluid, surface, position)
    if fluid then
        if fluid.temperature >= game.fluid_prototypes[fluid.name].gas_temperature or (fluid.name:contains('-gas') or fluid.name:contains('gas-') and not _gasses[fluid.name] == false) or _gasses[fluid.name] == true then
            surface.pollute(position, fluid.amount * _pollution_mod)
            return nil
        elseif _gasses[fluid.name] == false then
            return nil
        end
        return fluid
    end
end

local function create_sprite(entity)
    return rendering.draw_sprite {
        sprite = 'tailings-pond-sprite-1',
        render_layer = 'object',
        target = entity,
        surface = entity.surface
    }
end

local function new_pond_data(entity)
    return {
        tick = game.tick,
        index = entity.unit_number,
        entity = entity,
        sprite = create_sprite(entity),
        full = nil,
        fluid_per = 0
    }
end

local tickdoubler = 1

--As the tailings pond get full they leak out and start polluting the ground around them
--Scorch up to 6 tiles from center.
local function scorch_earth(pond, tick)
    local fluidbox = pond.entity.fluidbox
    local tanksize = fluidbox.get_capacity(1)
    --Vent Gasses
    local fluid = empty_pond_gas(fluidbox[1], pond.entity.surface, pond.entity.position)

    local tiles = {}

    --No gasses left if we still have fluid
    if fluid then
        --if full set the full tick or check and spill
        if fluid.amount == tanksize then
            if not pond.full then
                pond.full = tick
                pond.fluid_per = 1
            elseif ((tick >= (pond.full + _scorch_ticks)) and (_scorch_chance > 0 and math.random(1, 100) <= _scorch_chance)) then
                --spill fluid out here, if not water pollute.
                --removing emptying code for spillage per pyanodon request
                fluid.amount = fluid.amount / 2
                pond.fluid_per = .5
                pond.full = nil
                --polluted ground is very difficult to walk on, it also ruins any path tiles near it.
                --TODO Issues when polluting near water.
                if fluid.name:contains('dirty') or not fluid.name:contains('water') then
                    local area_radius = 0
                    repeat
                        area_radius = area_radius + 6
                    until (pond.entity.surface.get_tile(pond.entity.position.x + (area_radius), pond.entity.position.y).name ~= 'polluted-ground')
                    for x, y in Area.spiral_iterate(Position.expand_to_area(pond.entity.position, area_radius)) do
                        if pond.entity.surface.get_tile(x, y).name ~= 'polluted-ground' then
                            tiles[#tiles + 1] = {name = 'polluted-ground', position = {x = x, y = y}}
                        end
                    end
                --moving set tiles to a seperate function to spread tile change load over ticks.
                --needs stdlib adjusts to use std tick spreader. proof of concept at the moment
                end -- polluting liquids
			end
        else -- not full fluid
            pond.fluid_per = tonumber(string.format('%.3f', (fluid.amount / tanksize)))
		end
		if tickdoubler == 1 then -- Full Pond
			if fluid.amount >= 100 then
				fluid.amount = fluid.amount-10
			end
			--pond.fluid_per = 0.99
			pond.full = nil
			tickdoubler = tickdoubler * -1
		end
	else -- no fluid
        pond.fluid_per = 0
    end
    --push the updated fluidbox to the entity.
    fluidbox[1] = fluid
    return tiles
end

--Sets animation frame based on tank filled percentage
local function set_fluid_level_image(pond)
    if rendering.is_valid(pond.sprite) then
        local fluid_per = pond.fluid_per
        --adjust percentage to match frames 30 frames, 1 is empty, 30 is full.
        if fluid_per == 0 then
            rendering.set_sprite(pond.sprite, 'tailings-pond-sprite-1')
        elseif fluid_per > .974 then
            rendering.set_sprite(pond.sprite, 'tailings-pond-sprite-30')
        else
            rendering.set_sprite(pond.sprite, 'tailings-pond-sprite-' .. math.ceil(fluid_per * 30))
        end
    else
        pond.sprite = create_sprite(pond.entity)
    end
end

function tailings_pond.create(event)
    if event.created_entity.name == 'tailings-pond' then
        local ponds = global.tailings_ponds
        local entity = event.created_entity
        entity.direction = defines.direction.north
        local pond = new_pond_data(entity)
        ponds[pond.index] = pond
    end
end
Event.register(Event.build_events, tailings_pond.create)

local function tile_setter(event)
    local tiles = event
    local stiles = {}
    --log(table_size(tiles))
    if table_size(tiles) > 400 then
        for i = 1, 400 do
            table.insert(stiles, tiles[i])
            tiles[i] = nil
        end
    else
        stiles = tiles
        tiles = {}
    end
    local temptable = {}
    for i = 1, table_size(tiles) do
        if tiles[i] ~= nil then
            table.insert(temptable, tiles[i])
        end
    end
    tiles = temptable
    return stiles, tiles
end

--Run tick handler every 30 ticks. In the future this will need to be spread out to itereate over a queing system.
function tailings_pond.on_tick(event)
    --log(table_size(Tiles))
    local ponds = global.tailings_ponds
    for i, pond in pairs(ponds) do
        if pond.entity.valid then
            if type(pond.sprite) == 'number' then
                local t = scorch_earth(pond, event.tick)
                --Set the animation needed based on fill level..
                set_fluid_level_image(pond)
                if t[1] ~= nil then
                    Tiles = t
                end
            else
                pond.sprite = create_sprite(pond.entity)
            end
        else
            global.tailings_ponds[i] = nil
        end
        --log(serpent.block(Tiles))
        --log(serpent.block(Tiles[1]))
        if Tiles[1] ~= nil then
            --log(serpent.block(table_size(Tiles)))
            local stiles
            stiles, Tiles = tile_setter(Tiles)
            --log(serpent.block(table_size(stiles)))
            --log(serpent.block(table_size(Tiles)))
            --log(serpent.block(pond))
            pond.entity.surface.set_tiles(stiles, true)
            for _, st in pairs(stiles) do
                pond.entity.surface.create_entity {name = 'ninja-tree', position = {st.position.x, st.position.y}}
            end
        end
    end
end
Event.register(-30, tailings_pond.on_tick)

function tailings_pond.on_init()
    global.tailings_ponds = {}
end
Event.register(Event.core_events.init, tailings_pond.on_init)

function tailings_pond.on_entity_died(event)
    if event.entity.name == 'ninja-tree' then
        event.entity.surface.set_tiles {{name = 'polluted-ground-burnt', position = event.entity.position}}
        event.entity.destroy()
    end
end

Event.register(defines.events.on_entity_died, tailings_pond.on_entity_died)

return tailings_pond
