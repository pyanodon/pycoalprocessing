--Research any new recipes in coal-processing-1 not present in previous version
for _, force in pairs(game.forces) do
  if force.technologies["coal-processing-1"].researched then
    for _, effect in pairs(force.techologies["coal-processing-1"].effects) do
      if effect.type == "unlock-recipe" then
        force.recipes[effect.recipe].enabled = true
      end
    end
  end
end
