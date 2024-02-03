data.raw["research-achievement"]["eco-unfriendly"] = nil
data.raw["group-attack-achievement"]["it-stinks-and-they-dont-like-it"] = nil
data.raw["build-entity-achievement"]["getting-on-track-like-a-pro"] = nil
data.raw["produce-achievement"]["mass-production-1"] = nil
data.raw["produce-achievement"]["mass-production-2"] = nil
data.raw["produce-achievement"]["mass-production-3"] = nil
data.raw["produce-per-hour-achievement"]["circuit-veteran-1"] = nil
data.raw["produce-per-hour-achievement"]["circuit-veteran-2"] = nil
data.raw["produce-per-hour-achievement"]["circuit-veteran-3"] = nil
data.raw["produce-per-hour-achievement"]["computer-age-1"] = nil
data.raw["produce-per-hour-achievement"]["computer-age-2"] = nil
data.raw["produce-per-hour-achievement"]["computer-age-3"] = nil
data.raw["produce-per-hour-achievement"]["iron-throne-1"] = nil
data.raw["produce-per-hour-achievement"]["iron-throne-2"] = nil
data.raw["produce-per-hour-achievement"]["iron-throne-3"] = nil
data.raw["dont-use-entity-in-energy-production-achievement"]["solaris"] = nil
data.raw["kill-achievement"]["steamrolled"] = nil
data.raw["combat-robot-count"]["minions"] = nil
data.raw["dont-use-entity-in-energy-production-achievement"]["steam-all-the-way"] = nil
data.raw["dont-build-entity-achievement"]["raining-bullets"] = nil
data.raw["dont-build-entity-achievement"]["logistic-network-embargo"] = nil
data.raw["finish-the-game-achievement"]["no-time-for-chitchat"] = nil
data.raw["finish-the-game-achievement"]["there-is-no-spoon"] = nil

data:extend(
{
    {
      type = "produce-achievement",
      name = "empire-of-dirt",
      order = "0a",
      item_product = "soil",
      amount = 1000000,
      icon = "__base__/graphics/achievement/mass-production-1.png",
      icon_size = 128,
      limited_to_one_game = true
    },
    {
      type = "produce-achievement",
      name = "dust-to-dust",
      order = "0b",
      item_product = "ash",
      amount = 1000000,
      icon = "__base__/graphics/achievement/mass-production-1.png",
      icon_size = 128,
      limited_to_one_game = true
    },
    {
      type = "produce-achievement",
      name = "what-do-you-mean-i-didnt-win-the-game",
      order = "0c",
      item_product = "filled-proto-tholins-vessel",
      amount = 1,
      icon = "__base__/graphics/achievement/smoke-me-a-kipper-i-will-be-back-for-breakfast.png",
      icon_size = 128,
      limited_to_one_game = true
    },
    -- {
    --   type = "dont-use-entity-in-energy-production-achievement",
    --   name = "training-regimen",
    --   order = "0e",
    --   last_hour_only = true,
    --   included = "generator-1",
    --   minimum_energy_produced = "1TJ",
    --   icon = "__base__/graphics/achievement/solaris.png",
    --   icon_size = 128
    -- },
    {
      type = "build-entity-achievement",
      name = "animal-labor",
      order = "0f",
      to_build = "caravan",
      icon = "__base__/graphics/achievement/getting-on-track.png",
      icon_size = 128
    },
})
