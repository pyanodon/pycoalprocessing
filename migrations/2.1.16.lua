local killed_ninjas = 0
for _, surface in pairs(game.surfaces) do
    for _, ninja in pairs(surface.find_entities_filtered {type = "tree", name = "ninja-tree"}) do
        ninja.destroy()
        killed_ninjas = killed_ninjas + 1
    end
end

if killed_ninjas > 0 then
    game.print("Killed " .. killed_ninjas .. " ninjas")
end
