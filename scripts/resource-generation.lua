local ore_gen = {}

local Event = require("__stdlib__/stdlib/event/event")

--add the pymods resources that are duplicates of the same resource
--i.e. the oils and phosphate rocks

local resources = {}

local procks = {}

local rocks = {}
local rockset = {}

local oilpatches = {}

local isresources =
	{
	"iron-ore",
	"copper-ore",
	"coal",
	"stone",
	}

local osresources =
	{
	"borax",
	}

function ore_gen.on_init()
	global.ore_gen = {}

--only do something if pyro or pyph are active_mods

if game.active_mods["pyrawores"] or game.active_mods["pypetroleumhandling"] then

	if game.active_mods["pyrawores"] then

	table.insert(isresources,"ore-quartz")
	table.insert(isresources,"ore-tin")

	table.insert(osresources,"ore-aluminium")
	table.insert(osresources,"salt-rock")

	table.insert(rocks,"salt-rock")

	--getting rocks
		for _, r in pairs(game.entity_prototypes) do
			if r.type == "resource" then
				if string.find(r.name, "rock") ~= nil then
					table.insert(rocks, r.name)
				end
			end
		end
	end

	--log(serpent.block(rocks))

	if game.active_mods["pyhightech"] and game.active_mods["pyrawores"] then

	procks =
		{
		"phosphate-rock",
		"phosphate-rock-02"
		}

	table.insert(resources,procks)

	end

	if game.active_mods["pypetroleumhandling"] then

	oilpatches =
		{
		"oil-mk01",
		"oil-mk02",
		"oil-mk03",
		"oil-mk04"
		}

	table.insert(resources,oilpatches)

	table.insert(isresources,"tar-patch")
	table.insert(isresources,"oil-mk01")

	table.insert(rocks, "tar-patch")
	table.insert(rocks, "oil-mk01")

	end

	local sores =
		{
		"phosphate-rock",
		"phosphate-rock-02",
		"oil-mk01",
		"oil-mk02",
		"oil-mk03",
		"oil-mk04"
		}

		for _, r in pairs(rocks) do
			rockset[r] = true
		end

end

end
Event.register(Event.core_events.init, ore_gen.on_init)

function ore_gen.on_chunk_generated(event)

--only do something if pyro or pyph are active_mods

if game.active_mods["pyrawores"] or game.active_mods["pypetroleumhandling"] then

	--log("generating resources")

	if math.random(1,6) <= 2 then

	--spawn new randomized resources

	--starting area needs: iron, copper, coal, tin, quartz
	-- need to fit in oil and tar patches
	--outer starting area spawn borax, lead, aluminium

	local tx = event.area.left_top.x
	local ty = event.area.left_top.y
	local bx = event.area.right_bottom.x
	local by = event.area.right_bottom.y

	local Randx = math.random(tx,bx)
	local Randy = math.random(ty,by)

	local patchdiamiter = math.random(10,25)
	local oreamount = math.random(1,4)*1000

	if tx >= -200 and tx <= 200 and ty >= -200 and ty <= 200 then
		--is "starting area"
		if tx >= -100 and tx <= 100 and ty >= -100 and ty <= 100 then
			--inner start area for needed ores
			--get a random ore to spawn
			local tsize = 0
			if tsize == 0 then
				for _,ts in pairs(isresources) do
					tsize = tsize+1
				end
			end
			--log(tsize)
			--log(serpent.block(isresources))
			if tsize > 0 then
				local stiles = 0
				local sindex = math.random(1,tsize)
				local randore = isresources[sindex]
				--check if resources already exist beofre placing more on top
				local orecheck = game.surfaces["nauvis"].find_entities_filtered{area={{Randx-20,Randy-20},{Randx+20,Randy+20}},type="resource"}
				local hitore = false
				for _, r in pairs(orecheck) do
					if r ~= nil then
						hitore=true
					end
				end
				if hitore == false then
					if string.find(game.surfaces["nauvis"].get_tile(Randx,Randy).name, "water") == nil then
						stiles = stiles+1
						if rockset[randore] then
							oreamount=oreamount*500
							game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
						else
							game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
						end
					end
						if rockset[randore] == nil then
						--create patches for ores
						local patchx = Randx - 20
						local patchy = Randy - 20
						local center = {Randx,Randy}
						--log(oreamount)
							for i = 0,1600 do
								--log(patchx..","..patchy)
								local entity = game.surfaces["nauvis"].find_entities({{patchx,patchy},{patchx,patchy}})
									--log("patchx "..patchx)
									--log("randx "..Randx)
									--log(math.abs(patchx-Randx))
									--log(patchdiamiter)
										if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter + math.random(0,10) or math.random(1,3) == 1 then
											if string.find(game.surfaces["nauvis"].get_tile(patchx,patchy).name, "water") == nil then
												stiles = stiles+1
												game.surfaces["nauvis"].create_entity{name=randore,position={patchx,patchy},amount=oreamount}
											end
										end
								patchx=patchx+1
									if patchx == Randx+20 then
										patchx = Randx-20
										patchy=patchy+1
									end
							end
						end
					if stiles * oreamount > 500000 then
						tsize=tsize-1
						table.remove(isresources,sindex)
					end
				end
			end
		end
		--outer starting area
		if (tx >= -200 and tx <= -100  and ty >= -200 and ty <= -100) or (tx >= 100 and tx <= 200 and ty >= 100 and ty <= 200) then
			--inner start area for needed ores
			--get a random ore to spawn
			local tsize = 0
			if tsize == 0 then
				for _,ts in pairs(osresources) do
					tsize = tsize+1
				end
			end
			--log(tsize)
			--log(serpent.block(osresources))
			if tsize > 0 then
				local stiles = 0
				local sindex = math.random(1,tsize)
				local randore = osresources[sindex]
				--check if resources already exist beofre placing more on top
				local orecheck = game.surfaces["nauvis"].find_entities_filtered{area={{Randx-20,Randy-20},{Randx+20,Randy+20}},type="resource"}
				local hitore = false
				for _, r in pairs(orecheck) do
					if r ~= nil then
						hitore=true
					end
				end
				if hitore == false then
					if string.find(game.surfaces["nauvis"].get_tile(Randx,Randy).name, "water") == nil then
						stiles = stiles+1
						if rockset[randore] then
							oreamount=oreamount*500
							game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
						else
							game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
						end
					end
						if rockset[randore] == nil then
						--create patches for ores
						local patchx = Randx - 20
						local patchy = Randy - 20
						local center = {Randx,Randy}
						--log(oreamount)
							for i = 0,1600 do
								--log(patchx..","..patchy)
								local entity = game.surfaces["nauvis"].find_entities({{patchx,patchy},{patchx,patchy}})
									--log("patchx "..patchx)
									--log("randx "..Randx)
									--log(math.abs(patchx-Randx))
									--log(patchdiamiter)
										if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter + math.random(0,10) or math.random(1,3) == 1 then
											if string.find(game.surfaces["nauvis"].get_tile(patchx,patchy).name, "water") == nil then
												stiles = stiles+1
												game.surfaces["nauvis"].create_entity{name=randore,position={patchx,patchy},amount=oreamount}
											end
										end
								patchx=patchx+1
									if patchx == Randx+20 then
										patchx = Randx-20
										patchy=patchy+1
									end
							end
						end
					if stiles * oreamount > 500000 then
						tsize=tsize-1
						table.remove(osresources,sindex)
					end
				end
			end
		end
	end

	end

end

end
Event.register(defines.events.on_chunk_generated, ore_gen.on_chunk_generated)