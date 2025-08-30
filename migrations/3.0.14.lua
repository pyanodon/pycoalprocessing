for _, player in pairs(game.players) do
    if script.active_mods.quality and not script.active_mods.pystellarexpedition then
        player.print({ "messages.warning-quality" })
    end
end
