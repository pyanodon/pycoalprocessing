local ore_gen = {}

local Event = require("__stdlib__/stdlib/event/event")

--add the pymods resources that are duplicates of the same resource
--i.e. the oils and phosphate rocks

local resources = {}

local procks = {}

local rocks = {}
local rockset = {}

local oilpatches = {}

local sresources =
	{
	"iron-ore",
	"copper-ore",
	"coal",
	"stone",
	"borax"
	}

function ore_gen.on_init()
	global.ore_gen = {}
	
	
if game.active_mods["pyrawores"] then

table.insert(sresources,"ore-quartz")
table.insert(sresources,"ore-tin")

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

table.insert(sresources,"tar-patch")
table.insert(sresources,"oil-mk01")

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
--[[
for _, ep in pairs(game.entity_prototypes) do
	if ep.type == "resource" then
		for _, r in pairs(sores) do
			if ep.name ~= r then
				for _, i in pairs(resources) do
					if ep.name ~= i then
						table.insert(resources, ep.name)
					end
				end
			end
		end
	end
	
end
]]--
--log(serpent.block(resources))

	for _, r in pairs(rocks) do
		rockset[r] = true
	end

end
Event.register(Event.core_events.init, ore_gen.on_init)

function ore_gen.on_chunk_generated(event)

--log("generating resources")

if math.random(1,4) == 1 then

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
local oreamount = math.random(1,8)*1000

if tx >= -200 and tx <= 200 and ty >= -200 and ty <= 200 then
	--is "starting area"
	if tx >= -100 and tx <= 100 and ty >= -100 and ty <= 100 then
		--inner start area for needed ores
		--get a random ore to spawn
		local tsize = 0
		if tsize == 0 then
			for _,ts in pairs(sresources) do
				tsize = tsize+1
			end
		end
		log(tsize)
		log(serpent.block(sresources))
		if tsize > 0 then
			local sindex = math.random(1,tsize)
			local randore = sresources[sindex]
			tsize=tsize-1
			table.remove(sresources,sindex)
			if string.find(game.surfaces["nauvis"].get_tile(Randx,Randy).name, "water") == nil then
				if rockset[randore] then
					oreamount=oreamount*1000
					game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
				else
					game.surfaces["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=oreamount}
				end
			end
				if rockset[randore] == nil then
				--create patches for ores
				local patchx = Randx - 10
				local patchy = Randy - 10
				local center = {Randx,Randy}
					for i = 0,400 do
						--log(patchx..","..patchy)
						local entity = game.surfaces["nauvis"].find_entities({{patchx,patchy},{patchx,patchy}})
							--log("patchx "..patchx)
							--log("randx "..Randx)
							--log(math.abs(patchx-Randx))
							--log(patchdiamiter)
								if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter/2 or math.random(1,2) == 1 then
									if string.find(game.surfaces["nauvis"].get_tile(patchx,patchy).name, "water") == nil then
										game.surfaces["nauvis"].create_entity{name=randore,position={patchx,patchy},amount=oreamount}
									end
								end
						patchx=patchx+1
							if patchx == Randx+10 then
								patchx = Randx-10
								patchy=patchy+1
							end
					end
				end
		end
	end
end

end

end
Event.register(defines.events.on_chunk_generated, ore_gen.on_chunk_generated)