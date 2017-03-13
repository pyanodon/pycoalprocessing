for _, force in pairs(game.forces) do
  if force.technologies["py-asphalt"].researched then
    force.recipes["py-coal-tile"].enabled = true
  end
end
