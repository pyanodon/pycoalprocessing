if game.recipe_prototypes["extract-coarse"] then
    for _, force in pairs(game.forces) do
        if force.technologies["excavation-1"] and force.technologies["excavation-1"].researched then
            if force.recipes["extract-coarse"] then
                force.recipes["extract-coarse"].enabled = true
            end
            if force.technologies["coal-processing-3"] and force.technologies["coal-processing-3"].researched then
                if force.recipes["coaldust-ash"] then
                    force.recipes["coaldust-ash"].enabled = true
                end
            end
        end
    end
end
