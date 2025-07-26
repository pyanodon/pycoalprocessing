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
data.raw["combat-robot-count-achievement"]["minions"] = nil
data.raw["dont-use-entity-in-energy-production-achievement"]["steam-all-the-way"] = nil
data.raw["dont-build-entity-achievement"]["raining-bullets"] = nil
data.raw["dont-build-entity-achievement"]["logistic-network-embargo"] = nil
data.raw["complete-objective-achievement"]["no-time-for-chitchat"] = nil
data.raw["complete-objective-achievement"]["there-is-no-spoon"] = nil


-- ordering: 0, then a letter per mod, then a letter within the mod
-- PyCP: a, PyIN: b, PyFE: c, PyPH: d, PyRO: e, PyHT: f, PyAL: g, PyAE: h
data:extend
{
    {
        type = "produce-achievement",
        name = "empire-of-dirt",
        order = "0aa",
        item_product = "soil",
        amount = 1000000,
        icon = "__base__/graphics/achievement/mass-production-1.png",
        icon_size = 128,
        limited_to_one_game = true
    },
    {
        type = "produce-achievement",
        name = "dust-to-dust",
        order = "0ab",
        item_product = "ash",
        amount = 1000000,
        icon = "__base__/graphics/achievement/mass-production-1.png",
        icon_size = 128,
        limited_to_one_game = true
    },
    {
        type = "complete-objective-achievement",
        name = "pyrrhic-victory",
        order = "0ac",
        objective_condition = "game-finished",
        icon = "__pycoalprocessinggraphics__/graphics/achievement/smoke-me-a-kipper-i-will-be-back-for-breakfast.png",
        icon_size = 128,
        limited_to_one_game = false
    },
}
if mods.pypetroleumhandling then
    data.raw["complete-objective-achievement"]["smoke-me-a-kipper-i-will-be-back-for-breakfast"] = nil -- replaced here with the meme achievement and above with pyrrhic victory
    data:extend {
        {
            type = "produce-achievement",
            name = "what-do-you-mean-i-didnt-win-the-game",
            order = "0da",
            item_product = "filled-tholins-vessel",
            amount = 1,
            icon = "__pycoalprocessinggraphics__/graphics/achievement/what-do-you-mean-i-didnt-win-the-game.png",
            icon_size = 128,
            limited_to_one_game = false
        },
    }
end
if mods.pyalienlife then
    data:extend {
        {
            type = "dont-use-entity-in-energy-production-achievement",
            name = "training-regimen",
            order = "0ga",
            last_hour_only = true,
            excluded = "tailings-pond", -- this is NOT optional, so fill in something that doesn't interact with power anyway
            included = "generator-1",
            minimum_energy_produced = "1TJ",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/training-regimen.png",
            icon_size = 128
        },
        {
            type = "build-entity-achievement",
            name = "animal-labor",
            order = "0gb",
            to_build = "caravan",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/animal-labor.png",
            icon_size = 128
        },
        {
            type = "build-entity-achievement",
            name = "is-it-a-bird",
            order = "0gc",
            to_build = "nukavan",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/is-it-a-bird.png",
            icon_size = 128
        },
        {
            type = "build-entity-achievement",
            name = "as-per-my-last-email",
            order = "0gd",
            to_build = "nukavan",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/as-per-my-last-email.png",
            icon_size = 128
        },
        {
            type = "build-entity-achievement",
            name = "cthulhu-fhtagn",
            order = "0ge",
            to_build = "ocula",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/cthulhu-fhtagn.png",
            icon_size = 128
        },
        {
            type = "achievement",
            name = "no-ulterior-motives-behind-this-acronym",
            order = "0gf",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/no-ulterior-motives-behind-this-acronym.png",
            icon_size = 128
        },
        {
            type = "achievement",
            name = "polished-turd",
            order = "0gg",
            icon = "__pycoalprocessinggraphics__/graphics/achievement/polished-turd.png",
            icon_size = 128
        },
    }
end
if mods.pyalternativeenergy then
    data:extend {
        {
            type = "produce-achievement",
            name = "taste-the-rainbow",
            order = "0ha",
            item_product = "pu-238",
            amount = 1,
            icon = "__pycoalprocessinggraphics__/graphics/achievement/what-do-you-mean-i-didnt-win-the-game.png",
            icon_size = 128,
            limited_to_one_game = true
        },
        {
            type = "produce-achievement",
            name = "now-i-am-become-death",
            order = "0hb",
            fluid_product = "reactor-waste-1",
            amount = 1,
            icon = "__pycoalprocessinggraphics__/graphics/achievement/what-do-you-mean-i-didnt-win-the-game.png",
            icon_size = 128,
            limited_to_one_game = true
        },
    }
end
