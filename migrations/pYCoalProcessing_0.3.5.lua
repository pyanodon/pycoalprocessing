for _, force in pairs(game.forces) do
  if force.technologies["crusher"].researched then
    force.recipes["jaw-crusher"].enabled = true
  end
end
