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
    minimum = 400,
    normal = 1000,
    maximum = 4000,
    minable = {
        hardness = 1.5,
        -- mining_particle = "borax-particle",
        mining_time = 3,
        results = {
            {"raw-borax", 1}
        },
        fluid_amount = 50,
        required_fluid = "syngas"
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
        control = "borax",
        sharpness = 1,
        starting_area = true,
        richness_multiplier = 1500,
        richness_multiplier_distance_bonus = 30,
        richness_base = 500,
        coverage = 0.009,
        peaks = {
            {
                noise_layer = "borax",
                noise_octaves_difference = -1.5,
                noise_persistence = 0.3,
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
