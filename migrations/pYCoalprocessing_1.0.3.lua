-- Renamed ref_to_light-oil to ref-to-light-oil
for _, force in pairs(game.forces) do
    if force.technologies["fuel-production"] and force.technologies["fuel-production"].researched then
        if force.recipes["ref-to-light-oil"] then
            force.recipes["ref-to-light-oil"].enabled = true
        end
    end
end
