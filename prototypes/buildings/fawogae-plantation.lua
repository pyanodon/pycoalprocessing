local Pipes = require("stdlib.data.pipes")

local pipes = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/pipe-north.png",
        priority = "low",
        width = 32,
        height = 32
    },
    south = {
        filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/pipe-south.png",
        priority = "extra-high",
        width = 32,
        height = 32
    }
}

local recipe1 = {
    type = "recipe",
    name = "fawogae-plantation",
    energy_required = 10,
    enabled = true,
    ingredients = {
        {"soil", 300},
        {"pipe", 15},
        {"electronic-circuit", 10}, --bob basic-circuit-board
        {"copper-cable", 25},
        {"iron-plate", 40},
        {"raw-wood", 150}
    },
    result = "fawogae-plantation"
}

local item1 = {
    type = "item",
    name = "fawogae-plantation",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-plantation-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-extraction",
    order = "b",
    place_result = "fawogae-plantation",
    stack_size = 10
}

local entity1 = {
    type = "assembling-machine",
    name = "fawogae-plantation",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-plantation-icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fawogae-plantation"},
    fast_replaceable_group = "fawogae-plantation",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification = {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fawogae"},
    crafting_speed = 0.1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01
    },
    energy_usage = "200kW",
    ingredient_count = 1,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/fawogae.png",
        width = 200,
        height = 193,
        frame_count = 100,
        line_length = 10,
        animation_speed = 3.2,
        shift = {0.13, -0.03}
    },
    fluid_boxes = {
        {
            production_type = "input",
            pipe_covers = Pipes.covers(false, true, true, true),
            pipe_picture = Pipes.pictures("assembling-machine-3", {0, 0.22}, {0.02, -1}, nil, nil, pipes),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {-3.5, 0.5}}}
        },
        off_when_no_fluid_recipe = true
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/fawogae-plantation.ogg"},
        idle_sound = {filename = "__pycoalprocessing__/sounds/fawogae-plantation.ogg", volume = 0.55},
        apparent_volume = 1.2
    }
}

data:extend {recipe1, item1, entity1}
