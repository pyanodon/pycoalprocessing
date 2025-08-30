for _, surface in pairs(game.surfaces) do
    local replace = {}
    for _, tile in pairs(surface.find_tiles_filtered({
        name = { "polluted-ground", "polluted-ground-burnt" }
    })) do
        replace[ #replace+1 ] = { name = "grass-1", position = tile.position }
    end
    surface.set_tiles(replace, true)
end
