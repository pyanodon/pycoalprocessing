--add the pymods resources that are duplicates of the same resource
--i.e. the oils and phosphate rocks

local resources = {}

local procks = {}

local oilpatches = {}

local sresources =
	{
	"iron",
	"copper",
	"coal",
	"stone",
	"borax"
	}
	
if game.active_mods["pyrawores"] then

table.insert(sresources,"quartz")
table.insert(sresources,"tin")

end


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

end

script.on_init(function(event)

local sores =
	{
	"phosphate-rock",
	"phosphate-rock-02",
	"oil-mk01",
	"oil-mk02",
	"oil-mk03",
	"oil-mk04"
	}

for _, ep in pairs(game.entity_prototypes) do
	if ep.type == "resource" then
		for _, r in pairs(sores) do
			if ep.name ~= r then
				table.insert(resources, ep.name)
			end
		end
	end
	
end

end)

script.on_event(defines.events.on_chunk_generated, function(event)
--find and remove old resources
local oldores = surface.find_entites_filtered{area = {{event.area.left_top.x,event.area.left_top.y},{event.area.right_bottom.x,event.area.right_bottom.y}}, type = "resource"}

for _, o in pairs(oldores) do
	o.destroy
end

--spawn new randomized resources

--starting area needs: iron, copper, coal, tin, quartz
-- need to fit in oil and tar patches
--outer starting area spawn borax, lead

local tx = event.area.left_top.x
local ty = event.area.left_top.y
local bx = event.area.right_bottom.x
local by = event.area.right_bottom.y

local Randx = math.random(tx,bx)
local Randy = math.random(ty,by)

if tx >= -200 and tx <= 200 and ty >= -200 and ty <= 200 then
	--is "starting area"
	if tx >= -150 and tx <= 150 then
		--inner start area for needed ores
		--get a random ore to spawn
		local tsize
		for _,ts in pairs(sresources) do
			tsize = tsize+1
		end
		local randore = sresources[math.random(1,tsize)
		game.surface["nauvis"].create_entity{name=randore,position={Randx,Randy},amount=123456789}
	end
end

end)