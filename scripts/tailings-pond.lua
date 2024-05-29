Pond = {}
Pond.events = {}

-- 500 fluids units are required to fill a tile
local fluids_per_tile = 500

-- beyond 99% full, the pond will start to create pollution tiles
local overflow_threshold = 0.99

--Does gas entering the tailings pond cause pollution when vented
--default=.15 off=0
local pollution_modifier = .15

--List of Gas fluids, true values cause pollution when vented, all gasses with gas in the name fall under this category
local gasses = {
    ['chlorine'] = true,
    ['hydrogen-chloride'] = true,
    ['sulfur-dioxide'] = true,
    ['carbon-dioxide'] = true,
    ['oxygen'] = false,
    ['hydrogen'] = false,
    ['nitrogen'] = false,
    ['purest-nitrogen-gas'] = false,
    ['pressured-air'] = false,
    ['hot-air'] = false,
    ['vacuum'] = false,
    ['neon'] = false,
}

Pond.events.init = function()
	global.tailings_ponds = global.tailings_ponds or {}
	global.tiles = global.tiles or {}
	global.Tiles = nil
end

--Pond contains gases, lets spill them out. Only negative is this can be used as a 'gas' void so...
--If the gas is 'polluting' create pollution, else just vent.
local function empty_pond_gas(fluid, surface, position)
	if fluid then
		if
			gasses[fluid.name] == true
			or fluid.temperature >= game.fluid_prototypes[fluid.name].gas_temperature
			or (fluid.name:find('%-gas')
			or fluid.name:find('gas%-')
			and not gasses[fluid.name] == false)
		then
			surface.pollute(position, fluid.amount * pollution_modifier)
			game.pollution_statistics.on_flow('tailings-pond', fluid.amount * pollution_modifier)
			return nil
		elseif gasses[fluid.name] == false then
			return nil
		end
		return fluid
	end
end

--Sets animation frame based on tank filled percentage
local function set_fluid_level_image(pond)
	local fluid_per = pond.fluid_per
	--adjust percentage to match frames 30 frames, 1 is empty, 30 is full.
	local fill_level
	if fluid_per == 0 then
		fill_level = 1
	elseif fluid_per > .974 then
		fill_level = 30
	else
		fill_level = math.ceil(fluid_per * 30)
	end
	if fill_level == pond.fill_level then return end

	if pond.sprite then rendering.destroy(pond.sprite) end
	local color
	if pond.entity.fluidbox[1] then
		color = game.fluid_prototypes[pond.entity.fluidbox[1].name].base_color
	end
	pond.sprite = rendering.draw_sprite{
		sprite = 'tailings-pond-sprite-' .. fill_level,
		render_layer = 'object',
		target = pond.entity,
		target_offset = {0, -0.5},
		surface = pond.entity.surface,
		tint = color or nil
	}
	pond.fill_level = fill_level
end

local function spiral(n)
	local k = math.ceil((math.sqrt(n)-1)/2)
	local t = 2*k+1
	local m = t^2
	local t = t-1
	if n >= m-t then return k-(m-n),-k        else m = m-t end
	if n >= m-t then return -k,-k+(m-n)       else m = m-t end
	if n >= m-t then return -k+(m-n),k else return k,k-(m-n-t) end
end

--As the tailings pond get full they leak out and start polluting the ground around them
local function scorch_earth(pond)
	local entity = pond.entity
	local fluidbox = entity.fluidbox
	local fluid = fluidbox[1]
	if fluid and fluid.name == 'neutron' then return end
	
	local surface = entity.surface
	--Vent Gasses
	local fluid = empty_pond_gas(fluid, surface, entity.position)
	if not fluid then -- totally drained
		pond.fluid_per = 0
		fluidbox[1] = fluid
		return
	end

	local tanksize = fluidbox.get_capacity(1)
	if tanksize - fluid.amount < 1 then -- pond is full, don't fall for floating point trickery
		local fluid_name = fluid.name
		local is_water = fluid_name ~= 'dirty-water-heavy' and (not not fluid_name:find('water'))
		local threshold_in_units = tanksize * overflow_threshold
		local surface_index = surface.index

		if not global.tiles[surface_index] then global.tiles[surface_index] = {} end
		local tiles = global.tiles[surface_index]

		local amount = fluid.amount
		repeat
			amount = amount - fluids_per_tile
			if not is_water then
				pond.lifetime_pollution_tiles_created = (pond.lifetime_pollution_tiles_created or 0) + 1
				local x, y = spiral(pond.lifetime_pollution_tiles_created)
				x = math.floor(x + entity.position.x) - 1
				y = math.floor(y + entity.position.y) - 1
				if surface.get_tile(x, y).name ~= 'polluted-ground' then
					tiles[#tiles + 1] = {name = 'polluted-ground', position = {x = x, y = y}}
				end
			end
		until amount < threshold_in_units
		-- add fluid consumed to production stats graph
		entity.force.fluid_production_statistics.on_flow(fluid.name, amount - fluid.amount)
		fluid.amount = amount
	end

	pond.fluid_per = fluid.amount / tanksize
	--push the updated fluidbox to the entity.
	fluidbox[1] = fluid
end

Pond.events.on_built = function(event)
	local entity = event.entity or event.created_entity
	if not entity.valid or entity.name ~= 'tailings-pond' then return end
	entity.direction = defines.direction.north
	local pond = {
		entity = entity,
		fluid_per = 0
	}
	set_fluid_level_image(pond)
	global.tailings_ponds[entity.unit_number] = pond
end

Pond.events[153] = function()
	for i, pond in pairs(global.tailings_ponds) do
		if pond.entity.valid then
			scorch_earth(pond)
			set_fluid_level_image(pond)
		else
			global.tailings_ponds[i] = nil
			return
		end
	end
end

-- offset tile setting to prevent lag spikes
Pond.events[154] = function()
	for surface_index, tiles in pairs(global.tiles) do
		local surface = game.surfaces[surface_index]
		for _, tile in pairs(tiles) do
			if tile.position.x % 4 == 0 and tile.position.y % 4 == 0 then
				surface.create_entity{
					name = 'ninja-tree',
					position = tile.position,
					force = 'neutral',
					create_build_effect_smoke = false
				}
			end
		end
		surface.set_tiles(tiles, true)
	end
	global.tiles = {}
end

Pond.events.on_entity_died = function(event)
	local entity = event.entity
    if entity.name == 'ninja-tree' then
		local surface = entity.surface
		local position = entity.position
		local radius = 4
		-- Find any nearby ninja trees and burn them
		local _, fire = next(surface.find_entities_filtered{position = position, type = {'fire'}})
		if fire and fire.valid then
			for i, tree in pairs(surface.find_entities_filtered{position = position, name = 'ninja-tree', radius = radius}) do
				-- 80% chance
				if tree ~= entity and math.random(1, 100) < 80 then
					surface.create_entity{name = fire.name, position = tree.position}
				end
			end
		end
		-- Change the tiles to burnt tiles
		local position_x, position_y = position.x, position.y
		local tiles = {}
		-- Two tiles out in every direction
		for i=1, radius ^ 2 do
			local x, y = spiral(i)
			x = math.floor(x + position_x) - 1
			y = math.floor(y + position_y) - 1
			tiles[i] = {name = 'polluted-ground-burnt', position = {x, y}}
		end
        entity.surface.set_tiles(tiles, true)
        entity.destroy()
    end
end