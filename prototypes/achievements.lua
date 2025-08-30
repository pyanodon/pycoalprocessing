local vanilla_achievements_to_disable = {
    { cat = "research-achievement",                             name = "eco-unfriendly" },
    { cat = "group-attack-achievement",                         name = "it-stinks-and-they-dont-like-it" },
    { cat = "build-entity-achievement",                         name = "getting-on-track-like-a-pro" },
    { cat = "produce-achievement",                              name = "mass-production-1" },
    { cat = "produce-achievement",                              name = "mass-production-2" },
    { cat = "produce-achievement",                              name = "mass-production-3" },
    { cat = "produce-per-hour-achievement",                     name = "circuit-veteran-1" },
    { cat = "produce-per-hour-achievement",                     name = "circuit-veteran-2" },
    { cat = "produce-per-hour-achievement",                     name = "circuit-veteran-3" },
    { cat = "produce-per-hour-achievement",                     name = "computer-age-1" },
    { cat = "produce-per-hour-achievement",                     name = "computer-age-2" },
    { cat = "produce-per-hour-achievement",                     name = "computer-age-3" },
    { cat = "produce-per-hour-achievement",                     name = "iron-throne-1" },
    { cat = "produce-per-hour-achievement",                     name = "iron-throne-2" },
    { cat = "produce-per-hour-achievement",                     name = "iron-throne-3" },
    { cat = "dont-use-entity-in-energy-production-achievement", name = "solaris" },
    { cat = "kill-achievement",                                 name = "steamrolled" },
    { cat = "combat-robot-count-achievement",                   name = "minions" },
    { cat = "dont-use-entity-in-energy-production-achievement", name = "steam-all-the-way" },
    { cat = "dont-build-entity-achievement",                    name = "raining-bullets" },
    { cat = "dont-build-entity-achievement",                    name = "logistic-network-embargo" },
    { cat = "complete-objective-achievement",                   name = "no-time-for-chitchat" },
    { cat = "complete-objective-achievement",                   name = "there-is-no-spoon" },
    mods.pypetroleumhandling and
    { cat = "complete-objective-achievement", name = "smoke-me-a-kipper-i-will-be-back-for-breakfast" } or nil
}

for _, cheevo in pairs(vanilla_achievements_to_disable) do
    data.raw[ cheevo.cat ][ cheevo.name ].hidden = true
end


-- ordering: 0, then a letter per mod, then a letter within the mod
-- PyCP: a, PyIN: b, PyFE: c, PyPH: d, PyRO: e, PyHT: f, PyAL: g, PyAE: h
data:extend
({
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
})
if mods.pypetroleumhandling then
    data:extend({
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
    })
end
if mods.pyalienlife then
    data:extend({
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
            to_build = "flyavan",
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
    })
end
if mods.pyalternativeenergy then
    data:extend({
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
    })
end
