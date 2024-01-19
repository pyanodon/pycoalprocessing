Inserters = {}
Inserters.events = {}

Inserters.events.on_built = function(event)
    local inserter = event.entity or event.created_entity
	if not inserter.valid or inserter.type ~= 'inserter' then return end
	if inserter.get_control_behavior()
		or next(inserter.circuit_connected_entities.red)
		or next(inserter.circuit_connected_entities.green)
		or inserter.get_filter(1)
		or inserter.logistic_network
	then return end
	inserter.inserter_filter_mode = 'blacklist'
end