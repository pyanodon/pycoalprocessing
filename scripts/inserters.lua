Inserters = {}
Inserters.events = {}

Inserters.events.on_built = function(event)
    local inserter = event.entity or event.created_entity
	if not inserter.valid or inserter.type ~= 'inserter' then return end
	local slot_count = inserter.filter_slot_count
	local has_filter = false
	for i = 1,slot_count do
		if inserter.get_filter(i) then
			has_filter = true
		end
	end
	if inserter.get_control_behavior()
		or next(inserter.circuit_connected_entities.red)
		or next(inserter.circuit_connected_entities.green)
		or has_filter
	then return end
	inserter.inserter_filter_mode = 'blacklist'
end