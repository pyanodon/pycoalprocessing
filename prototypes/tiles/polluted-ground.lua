local sand_vehicle_speed_modifier = _G.sand_vehicle_speed_modifier

DATA {
    type = "tile",
    name = "polluted-ground",
    collision_mask = {"ground-tile"},
    walking_speed_modifier = .50,
    autoplace = nil,
    layer = 36,
    variants = {
        main = {
            {
                picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground1.png",
                count = 16,
                size = 1
            },
            {
                picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground2.png",
                count = 16,
                size = 2,
                probability = 0.39,
                weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}
            },
            {
                picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground4.png",
                count = 16,
                line_length = 11,
                size = 4,
                probability = 1,
                weights = {0.090, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020, 0.010, 0.100, 0.025, 0.100, 0.100, 0.100}
            }
        },
        inner_corner = {
            picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-inner-corner.png",
            count = 8
        },
        outer_corner = {
            picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-outer-corner.png",
            count = 8
        },
        side = {
            picture = "__pycoalprocessing__/graphics/tiles/polluted-ground/polluted-ground-side.png",
            count = 8
        }
    },
    walking_sound = {
        {
            filename = "__base__/sound/walking/sand-01.ogg",
            volume = 0.8
        },
        {
            filename = "__base__/sound/walking/sand-02.ogg",
            volume = 0.8
        },
        {
            filename = "__base__/sound/walking/sand-03.ogg",
            volume = 0.8
        },
        {
            filename = "__base__/sound/walking/sand-04.ogg",
            volume = 0.8
        }
    },
    map_color = defines.color.brown,
    pollution_absorption_per_second = 0.0002,
    vehicle_friction_modifier = sand_vehicle_speed_modifier
}
