local Pipes = require("stdlib.data.pipes")

local pipe_left = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/desulfurizator-unit/dessulfurizator-north1.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local pipe_right = {
    north = {
        filename = "__pycoalprocessing__/graphics/entity/desulfurizator-unit/dessulfurizator-north2.png",
        priority = "low",
        width = 64,
        height = 64
    }
}

local recipe1 = {
    type = "recipe",
    name = "desulfurizator-unit",
    energy_required = 17,
    enabled = false,
    ingredients = {
        {"storage-tank", 3},
        {"chemical-plant", 1},
        {"electronic-circuit", 40},
        {"steel-plate", 20},
        {"iron-plate", 50} --bob invar-alloy
    },
    result = "desulfurizator-unit"
}

local item1 = {
    type = "item",
    name = "desulfurizator-unit",
    icon = "__pycoalprocessing__/graphics/icons/desulfurizator-unit.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "j",
    place_result = "desulfurizator-unit",
    stack_size = 5
}

local entity1 = {
    type = "assembling-machine",
    name = "desulfurizator-unit",
    icon = "__pycoalprocessing__/graphics/icons/desulfurizator-unit.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "desulfurizator-unit"},
    fast_replaceable_group = "desulfurizator-unit",
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.9, -2.9}, {2.9, 2.9}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification = {
        module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"desulfurization"},
    crafting_speed = 0.5,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05
    },
    energy_usage = "250kW",
    ingredient_count = 1,
    animation = {
        filename = "__pycoalprocessing__/graphics/entity/desulfurizator-unit/dessulfurizator-anim.png",
        width = 196,
        height = 202,
        frame_count = 15,
        line_length = 5,
        animation_speed = 0.75,
        shift = {0.06, -0.1}
    },
    fluid_boxes = {
        {
            production_type = "output",
            pipe_picture = Pipes.pictures("assembling-machine-3", {-0.05, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_right),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{type = "output", position = {3.5, -1.5}}}
        },
        {
            production_type = "input",
            pipe_picture = Pipes.pictures("assembling-machine-3", {0.25, 1.25}, {-0.00, -0.95}, {0.65, 0.10}, {-0.65, 0.10}, pipe_left),
            pipe_covers = Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{type = "input", position = {3.5, 1.5}}}
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__base__/sound/chemical-plant.ogg"},
        idle_sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.35},
        apparent_volume = 2.5
    }
}

data:extend {recipe1, item1, entity1}
