for _, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
        if tech.researched then
            for _, unlock in pairs(tech.effects or {}) do
                if unlock.type == "unlock-recipe" then
                    force.recipes[unlock.recipe].enabled = true
                end
            end
        end
    end
end
