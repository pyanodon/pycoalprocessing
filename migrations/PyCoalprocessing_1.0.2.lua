for _, surface in pairs(game.surfaces) do
    for _, sprite in pairs(surface.find_entities_filtered{name = "tailings-pond-sprite"}) do
        if sprite.valid then sprite.destroy() end
    end
end
