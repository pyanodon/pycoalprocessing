require "util"
require "scripts.gasturbinemk01"



script.on_event(defines.events.on_tick, function(event)
local t = event.tick
		check_generators()
    recheck_archived_generators()
end)

function BuiltEntity(event)
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

function MinedEntity(event)
	if event.entity.name == "burner-generator" then
	local b = event.entity
	local X = b.position.x 
	local Y = b.position.y
	
		
		local power = {}		
		lid =	b.surface.find_entity("burner-generator-power",{X, Y})
		if lid ~= nil then
		lid.destroy()	end
		
	end

end

script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
script.on_event(defines.events.on_preplayer_mined_item , MinedEntity)
script.on_event(defines.events.on_entity_died , MinedEntity)
script.on_event(defines.events.on_robot_pre_mined  , MinedEntity)