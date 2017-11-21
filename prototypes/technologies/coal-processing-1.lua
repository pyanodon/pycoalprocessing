local technology = {
    type = "technology",
    name = "coal-processing-1",
    icon = "__pycoalprocessing__/graphics/technology/coal-processing-1.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {"steel-processing"},
    effects =
    {
        {
            type = "unlock-recipe",
            recipe = "gasifier"
        },
        {
            type = "unlock-recipe",
            recipe = "hpf"
        },
        {
            type = "unlock-recipe",
            recipe = "tar-processing-unit"
        },
        {
            type = "unlock-recipe",
            recipe = "creosote"
        },
        {
            type = "unlock-recipe",
            recipe = "treated-wood"
        },
        {
            type = "unlock-recipe",
            recipe = "syngas"
        },
        {
            type = "unlock-recipe",
            recipe = "water-mineralized"
        },
        {
            type = "unlock-recipe",
            recipe = "ulric-corral"
        },
        {
            type = "unlock-recipe",
            recipe = "bonemeal"
        },
        {
            type = "unlock-recipe",
            recipe = "borax-mine"
        },
        {
            type = "unlock-recipe",
            recipe = "raw-borax"
        },
        {
            type = "unlock-recipe",
            recipe = "borax-washing"
        },
        {
            type = "unlock-recipe",
            recipe = "ralesia-plantation"
        },
        {
            type = "unlock-recipe",
            recipe = "ralesia"
        },
        {
            type = "unlock-recipe",
            recipe = "rich-clay"
        },
        {
            type = "unlock-recipe",
            recipe = "ground-sample01"
        },
        {
            type = "unlock-recipe",
            recipe = "bio-sample01"
        },
        {
            type = "unlock-recipe",
            recipe = "alien-sample01"
        },
        {
            type = "unlock-recipe",
            recipe = "equipment-chassi"
        },
        {
            type = "unlock-recipe",
            recipe = "lab-instrument"
        },
        {
            type = "unlock-recipe",
            recipe = "lens"
        },
        {
            type = "unlock-recipe",
            recipe = "boron-trioxide"
        },
        {
            type = "unlock-recipe",
            recipe = "ralesia-seeds"
        },
        {
            type = "unlock-recipe",
            recipe = "diborane"
        },
        {
            type = "unlock-recipe",
            recipe = "boric-acid"
        },
        {
            type = "unlock-recipe",
            recipe = "science-pack-2"
        },
        {
            type = "unlock-recipe",
            recipe = "tar-distilation"
        },
        {
            type = "unlock-recipe",
            recipe = "tar-gasification"
        },
        {
            type = "unlock-recipe",
            recipe = "coal-fawogae"
        },
        {
            type = "unlock-recipe",
            recipe = "coke-coal"
        },
        {
            type = "unlock-recipe",
            recipe = "stone-distilation"
        },
        {
            type = "unlock-recipe",
            recipe = "botanical-nursery"
        },
        {
            type = "unlock-recipe",
            recipe = "log1"
        },
        {
            type = "unlock-recipe",
            recipe = "log2"
        },
        {
            type = "unlock-recipe",
            recipe = "log3"
        },
        {
            type = "unlock-recipe",
            recipe = "log-wood"
        },
    },
    unit =
    {
        count = 30,
        ingredients = {
            {"science-pack-1", 1},
        },
        time = 35
    },
}
data:extend({technology})
