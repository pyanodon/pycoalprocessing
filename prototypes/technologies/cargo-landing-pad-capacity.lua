data:extend({ {
    type = "technology",
    name = "cargo-landing-pad-capacity",
    icon = data.raw.technology[ "rocket-silo" ].icon,
    icon_size = data.raw.technology[ "rocket-silo" ].icon_size,
    effects = {
        {
            type = "cargo-landing-pad-count",
            modifier = 1,
            icons = {
                {
                    icon = data.raw.item[ "cargo-landing-pad" ].icon,
                    icon_size = data.raw.item[ "cargo-landing-pad" ].icon_size,
                    scale = 1
                },
                {
                    icon = "__core__/graphics/icons/technology/constants/constant-capacity.png",
                    icon_size = 128,
                    scale = 0.25,
                    shift = { 25, 25 }
                }
            }
        }
    },
    prerequisites = { "rocket-silo" },
    unit = {
        count_formula = "2^(L-1)*2000",
        ingredients = mods.pyalienlife and {
            { "automation-science-pack" },
            { "py-science-pack-1" },
            { "logistic-science-pack" },
            { "py-science-pack-2" },
            { "chemical-science-pack" },
            { "py-science-pack-3" },
        } or table.deepcopy(data.raw.technology[ "rocket-silo" ].unit.ingredients),
        time = 180
    },
    max_level = "infinite"
} })
