for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered{typpe = {"assembling-machine", "furnace", "rocket-silo", "mining-drill"}}) do
        local id = storage.beacon_interference_icons[entity.unit_number]
        if id then
            local rendering_object = rendering.get_object_by_id(id)
            rendering_object.time_to_live = 0
            rendering_object.blink_interval = 30
            for _, player in pairs(game.players) do
                player.add_custom_alert(entity, {type = "virtual", name = "beacon-interference"}, {"entity-status.beacon-interference"}, true)
                player.add_pin{
                    label = "[img=beacon-interference] Beacon interference",
                    entity = entity
                }
            end
        end
    end
end