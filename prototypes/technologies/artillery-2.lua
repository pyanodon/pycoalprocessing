TECHNOLOGY {
  type = "technology",
  name = "artillery-2",
  icon_size = 256, icon_mipmaps = 4,
  icon = "__base__/graphics/technology/artillery.png",
  effects = {},
  prerequisites = {"artillery"},
  unit =
  {
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack",   1},
      {"chemical-science-pack",   1},
      {"military-science-pack",   1}
    },
    time = 30,
    count = 2000
  },
  order = "d-e-f"
}
