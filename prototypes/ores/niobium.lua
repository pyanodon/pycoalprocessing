DATA {
    type = "autoplace-control",
    name = "niobium",
    richness = true,
    order = "b-e",
    category = "resource"
}

DATA {
    type = "noise-layer",
    name = "niobium"
}

ENTITY {
    type = "resource",
    name = "niobium",
    category = "niobium",
    icon = "__pycoalprocessing__/graphics/icons/niobium-ore.png",
    icon_size = 32,
    flags = {"placeable-neutral"},
    order = "a-b-a",
    map_color = {r = 0.403, g = 0.6, b = 0.701},
    highlight = true,
    minimum = 600,
    normal = 1200,
    maximum = 5000,
    minable = {
        hardness = 1.5,
        -- mining_particle = "niobium-particle",
        mining_time = 3,
        results = {
            {"niobium-ore", 1}
        },
        fluid_amount = 60,
        required_fluid = "refsyngas"
    },
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
        control = "niobium",
        sharpness = 1,
        richness_multiplier = 1500,
        richness_multiplier_distance_bonus = 30,
        richness_base = 500,
        coverage = 0.01,
        peaks = {
            {
                noise_layer = "niobium",
                noise_octaves_difference = -1.5,
                noise_persistence = 0.3,
                starting_area_weight_optimal = 0,
                starting_area_weight_range = 0,
                starting_area_weight_max_range = 2
            }
        }
    },
    stage_counts = {2000, 1600, 1400, 1200, 800, 400, 200, 10},
    stages = {
        sheet = {
            filename = "__pycoalprocessing__/graphics/ores/niobium.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            frame_count = 8,
            variation_count = 8,
            hr_version = {
                filename = "__pycoalprocessing__/graphics/ores/hr-niobium.png",
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
