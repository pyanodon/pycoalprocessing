for _, surface in pairs(game.surfaces) do
    for _, inserter in pairs(surface.find_entities_filtered{name={'fast-inserter', 'stack-inserter'}}) do
        if not (inserter.get_control_behavior()
            or next(inserter.circuit_connected_entities.red)
            or next(inserter.circuit_connected_entities.green)
            or inserter.get_filter(1))
        then
            inserter.inserter_filter_mode = 'blacklist'
        end
    end
end