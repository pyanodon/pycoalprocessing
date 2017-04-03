local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/gasifier/pipe-north.png",
            priority = "low",
            width = 44,
            height = 32,
            --shift = {0.03125, 0.3125}
            shift = shift_north
        }
    else
        north = Proto.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/pipe-south.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            --shift = {0.03125, -1.0625}
            shift = shift_south
        }
    else
        south = Proto.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/pipe-west.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            --shift = {0.8125, 0}
            shift = shift_west
        }
    else
        west = Proto.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/pipe-east.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            --shift = {-0.78125, 0.15625}
            shift = shift_east
        }
    else
        east = Proto.empty_sprite
    end
    return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "gasifier",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"steel-plate", 20},
        {"pipe", 20},
        {"iron-plate", 10},
        --{"storage-tank", 1},
        {"electronic-circuit", 4},

    },
    result= "gasifier",
    icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type = "item",
    name = "gasifier",
    icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[gasifier]",
    place_result = "gasifier",
    stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "gasifier",
    icon = "__pycoalprocessing__/graphics/icons/gasifier.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "gasifier"},
    fast_replaceable_group = "gasifier",
    max_health = 350,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.9, -3.9}, {3.9, 3.9}},
    selection_box = {{-4, -4}, {4, 4}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"gasifier"},
    crafting_speed = 1.25,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
    },
    energy_usage = "270kW",
    ingredient_count = 4,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/gasifier/gasifier-anim.png",
        priority = "high",
        width = 269,
        height = 269,
        frame_count = 30,
        line_length = 6,
        shift = {0.15, 0.3},
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = pipe_pictures( {0.05, 0.575}, {0.0, -0.65}, {0.75, 0.1}, {-0.75, 0.1}),
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {4.5, -0.5} }}
        },
        {
            production_type = "input",
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = pipe_pictures({0.05, 0.575}, {0.0, -0.65}, {0.75, 0.1}, {-0.75, 0.1}),
            pipe_connections = {{ type="input", position = {4.5, -2.5} }}
        },
        {
            production_type = "input",
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_picture = pipe_pictures({0.05, 0.575}, {0.0, -0.65}, {0.75, 0.1}, {-0.75, 0.1}),
            pipe_connections = {{ type="input", position = {4.5, 2.5} }}
        },

        {
            production_type = "output",
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_picture = pipe_pictures({0.05, 0.575}, {0.0, -0.65}, {0.75, 0.1}, {-0.75, 0.1}),
            pipe_connections = {{ type="output" , position = {-4.5, -1.5} }}
        },
        {
            production_type = "output",
            pipe_picture = pipe_pictures( {0.05, 0.575}, {0.00, -0.65}, {0.75, 0.1}, {-0.75, 0.1}),
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output" , position = {-4.5, 1.5} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/gasifier.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/gasifier.ogg", volume = 0.65 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
