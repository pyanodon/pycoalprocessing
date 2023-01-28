for _, player in pairs(game.players) do
	local frame = player.gui.top.pywiki_frame
	if frame then
		frame.destroy()
	end
end