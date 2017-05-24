local Prototype = require("stdlib.prototype.prototype")

local pipes = {
    south =
    {
        filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/pipe-ending-down.png",
        priority = "extra-high",
        width = 40,
        height = 45,
    }
}

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "methanol-reactor",
    energy_required = 15,
    enabled = false,
    ingredients =
    {
        {"gasturbinemk01", 1},
        {"chemical-plant", 1}, --updated-bob electrolyser
        {"electronic-circuit", 25},
        {"steel-plate", 20},
        {"iron-gear-wheel", 15}, --updated-bob steel-bearing

    },
    result= "methanol-reactor",
    icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "methanol-reactor",
    icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[methanol-reactor]",
    place_result = "methanol-reactor",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "methanol-reactor",
    icon = "__pycoalprocessing__/graphics/icons/methanol-reactor.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "methanol-reactor"},
    fast_replaceable_group = "methanol-reactor",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.75, -2.75}, {2.75, 2.75}},
    selection_box = {{-3, -3}, {3, 3}},
    module_specification =
    {
        module_slots = 5
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"methanol"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01 / 2,
    },
    energy_usage = "500kW",
    ingredient_count = 5,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/methanol-off.png",
        width = 202,
        height = 247,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.15, -0.79},
    },

    working_visualisations =
    {
        {
            north_position = {0.15, -0.79},
            west_position = {0.15, -0.79},
            south_position = {0.15, -0.79},
            east_position = {0.15, -0.79},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/methanol-anim.png",
                frame_count = 50,
                line_length = 10,
                width = 202,
                height = 247,
                animation_speed = 0.25
            }
        },
    },

    fluid_boxes =
    {
        --North, left
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {-0.5, -3.5} }}
        },
        --North, right
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {0.5, -3.5} }}
        },

        --South, left
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {-0.5, 3.5} }}
        },
        --South, right
        {
            production_type = "output",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output", position = {0.5, 3.5} }}
        },

        --West, top
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-3.5, -0.5} }}
        },
        --West, bottom
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-3.5, 0.5} }}
        },

        --East, top
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.5,-0.5} }}
        },
        --East, bottom
        {
            production_type = "input",
            pipe_picture = Prototype.Pipes.pictures("assembling-machine-3", nil, {-0.05,-0.75}, nil, nil, pipes),
            pipe_covers = Prototype.Pipes.covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.5, 0.5} }}
        },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/methanol-reactor.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/methanol-reactor.ogg", volume = 0.65 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
