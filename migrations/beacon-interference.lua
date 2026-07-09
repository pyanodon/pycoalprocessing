storage.beacon_interference_alerts = storage.beacon_interference_alerts or {}
storage.alerts = storage.alerts or {}
storage.alert_count = storage.alert_count or 0

if not storage.beacon_interference_icons then return end

for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered{type = {"assembling-machine", "furnace", "rocket-silo", "mining-drill"}}) do
        local id = storage.beacon_interference_icons[entity.unit_number]
        if id then
            local rendering_object = rendering.get_object_by_id(id)
            rendering_object.destroy()
            storage.beacon_interference_alerts[entity.unit_number] = py.generate_alert(
              entity,
              {type = "virtual", name = "beacon-interference"},
              "beacon-interference",
              {"entity-status.beacon-interference"},
              true
            )
        end
    end
end

storage.beacon_interference_icons = nil