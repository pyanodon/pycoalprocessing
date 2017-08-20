if game.recipe_prototypes["py-sodium-hydroxide"] then
  for _, force in pairs(game.forces) do
    if force.technologies["coal-processing-2"] and force.technologies["coal-processing-2"].researched then
      force.recipes["py-sodium-hydroxide"].enabled = true
    end
  end
end