for _, force in pairs(game.forces) do
  if force.technologies["py-asphalt"].researched then
    data.raw.recipe["py-coal-tile"].enabled = true
  end
end
