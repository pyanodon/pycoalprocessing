local technology = {
    type = "technology",
    name = "coal-processing-2",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-2.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"separation","coal-processing-1","desulfurization"},
    effects =
    {

        {
            type = "unlock-recipe",
            recipe = "rectisol"
        },
        {
            type = "unlock-recipe",
            recipe = "quenching-tower"
        },
        {
            type = "unlock-recipe",
            recipe = "tailings-copper-iron"
        },
        {
            type = "unlock-recipe",
            recipe = "zinc-chloride"
        },
        {
            type = "unlock-recipe",
            recipe = "active-carbon"
        },
        {
            type = "unlock-recipe",
            recipe = "combustion-mixture1"
        },
        {
            type = "unlock-recipe",
            recipe = "power-house"
        },
        {
            type = "unlock-recipe",
            recipe = "gasturbinemk02"
        },
        {
            type = "unlock-recipe",
            recipe = "evaporator"
        },
        {
            type = "unlock-recipe",
            recipe = "tailings-dust"
        },
        {
            type = "unlock-recipe",
            recipe = "wood-to-coal"
        },
        {
            type = "unlock-recipe",
            recipe = "raw-wood-to-coal"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-slurry"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-mine"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-ore"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-powder"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-dust"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-concentrate"
        },
        {
            type = "unlock-recipe",
            recipe = "mukmoux-pasture"
        },
        {
            type = "unlock-recipe",
            recipe = "mukmoux-fat"
        },
        {
            type = "unlock-recipe",
            recipe = "oleochemicals"
        },
        {
            type = "unlock-recipe",
            recipe = "organic-solvent"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-oxide"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-complex"
        },
        {
            type = "unlock-recipe",
            recipe = "niobium-plate"
        },
        {
            type = "unlock-recipe",
            recipe = "nichrome"
        },
        {
            type = "unlock-recipe",
            recipe = "making-chromium"
        },
        {
            type = "unlock-recipe",
            recipe = "richdust-separation"
        },
        {
            type = "unlock-recipe",
            recipe = "drill-head"
        },
        {
            type = "unlock-recipe",
            recipe = "aromatics2"
        },
        {
            type = "unlock-recipe",
            recipe = "aromatic-organic"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-dust"
        },
        {
            type = "unlock-recipe",
            recipe = "sand-brick"
        },
        {
            type = "unlock-recipe",
            recipe = "syngas-distilation"
        },
        {
            type = "unlock-recipe",
            recipe = "oleochemicals-distilation"
        },
        {
            type = "unlock-recipe",
            recipe = "oleo-gasification"
        },
        {
            type = "unlock-recipe",
            recipe = "tar-oil"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-briquette"
        },
    },
    unit =
    {
        count = 50,
        ingredients = {
            {"science-pack-1", 1},
            {"science-pack-2", 1},
        },
        time = 35
    },
}
data:extend({technology})
