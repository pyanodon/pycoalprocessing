local resource_autoplace = require("resource-autoplace")

DATA {
    type = "autoplace-control",
    name = "borax",
    richness = true,
    order = "p-bor",
    category = "resource"
}

DATA {
    type = "noise-layer",
    name = "borax"
}

ENTITY {
    type = "resource",
    name = "borax",
    category = "borax",
    icon = "__pycoalprocessinggraphics__/graphics/icons/raw-borax.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-a",
    map_color = {r = 0.917, g = 0.917, b = 0.917},
    highlight = true,
    minable = {
        -- mining_particle = "borax-particle",
        mining_time = 3,
        results = {
            {type = "item", name = "raw-borax", amount = 3, probability = 0.7}
        },
        fluid_amount = 50,
        required_fluid = "syngas"
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    autoplace = resource_autoplace.resource_autoplace_settings {
        name = "borax",
        order = "b",
        base_density = 10,
        base_spots_per_km2 = 1.25,
        has_starting_area_placement = false,
        random_spot_size_minimum = 2,
        random_spot_size_maximum = 4,
        regular_rq_factor_multiplier = 1,
        starting_rq_factor_multiplier = 2,
        candidate_spot_count = 20
    },
    stage_counts = {2000, 1600, 1400, 1200, 800, 400, 200, 10},
    stages = {
        sheet = {
            filename = "__pycoalprocessinggraphics__/graphics/ores/borax.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            frame_count = 8,
            variation_count = 8,
            hr_version = {
                filename = "__pycoalprocessinggraphics__/graphics/ores/hr-borax.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                frame_count = 8,
                variation_count = 8,
                scale = 0.5
            }
        }
    }
}
