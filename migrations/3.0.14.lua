for _, player in pairs(game.players) do
    if script.active_mods.quality then
        player.print {"messages.warning-quality"}
    end
end
