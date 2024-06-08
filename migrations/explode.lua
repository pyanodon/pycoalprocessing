local killed_ninjas = 0
local remaining_ninjas = 0
for _, surface in pairs(game.surfaces) do
    for _, ninja in pairs(surface.find_entities_filtered {type = 'tree', name = 'ninja-tree'}) do
        local tile_position = ninja.position
        tile_position.x = math.floor(tile_position.x)
        tile_position.y = math.floor(tile_position.y)
        if tile.position.x % 4 ~= 0 or tile.position.y % 4 ~= 0 then
            ninja.destroy()
            killed_ninjas = killed_ninjas + 1
        else
            remaining_ninjas = remaining_ninjas + 1
        end
    end
end

if killed_ninjas > 0 then
    game.print('Killed ' .. killed_ninjas .. ' ninjas. ' .. remaining_ninjas .. ' ninjas remain.')
end
