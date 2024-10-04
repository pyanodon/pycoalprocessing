storage.on_tick = {}
-- fix rotation of fawogae plantations after fixing the graphics
for _, surface in pairs(game.surfaces) do
    for i=1, 4 do
        local target = 'fawogae-plantation-mk0' .. i
        if not prototypes.entity[target] then
            break
        end
        for _, plantation in pairs(surface.find_entities_filtered{name = target}) do
            if plantation.valid then
                local result = plantation.rotate{reverse = true}
                log("Rotating " .. plantation.unit_number .. " was " .. (result and "successful" or "unsuccessful"))
            end
        end
    end
end