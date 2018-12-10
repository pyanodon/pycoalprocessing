DATA {
    type = "autoplace-control",
    name = "borax",
    richness = true,
    order = "b-e",
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
    icon = "__pycoalprocessing__/graphics/icons/raw-borax.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-a",
    map_color = {r = 0.917, g = 0.917, b = 0.917},
    highlight = true,
    minable = {
        hardness = 1.5,
        -- mining_particle = "borax-particle",
        mining_time = 3,
        results = {
            {type = "item", name = "raw-borax", amount = 3, probability = 0.7},
        },
        fluid_amount = 50,
        required_fluid = "syngas"
    },
    starting_area_size = 5500,
    starting_area_amount = 1600,
    starting_area = true,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
        control = "borax",
        sharpness = 15/20,
        richness_multiplier = 1000,
        richness_multiplier_distance_bonus = 20,
        richness_base = 10,
        coverage = 0.0048,
        peaks = {
            {
                noise_layer = "borax",
                noise_octaves_difference = -1.5,
                noise_persistence = 0.3
            }
        }
    },
    stage_counts = {2000, 1600, 1400, 1200, 800, 400, 200, 10},
    stages = {
        sheet = {
            filename = "__pycoalprocessing__/graphics/ores/borax.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            frame_count = 8,
            variation_count = 8,
            hr_version = {
                filename = "__pycoalprocessing__/graphics/ores/hr-borax.png",
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
