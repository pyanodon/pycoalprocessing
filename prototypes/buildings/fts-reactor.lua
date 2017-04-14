local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/pipe-north.png",
            priority = "medium",
            width = 30,
            height = 44,
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
    name = "fts-reactor",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"concrete", 20},
        {"steel-plate", 20},
        {"stone-brick", 10}, --updated-bob glass
        {"iron-gear-wheel", 5}, --updated-bob steel-bearing
        {"iron-plate", 10}, --updated-bob invar-alloy
        {"advanced-circuit", 10},
    },
    result= "fts-reactor",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "fts-reactor",
    icon = "__pycoalprocessing__/graphics/icons/fts-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[fts-reactor]",
    place_result = "fts-reactor",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "fts-reactor",
    icon = "__pycoalprocessing__/graphics/icons/fts-reactor.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "fts-reactor"},
    fast_replaceable_group = "fts-reactor",
    max_health = 300,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fts-reactor"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05,
    },
    energy_usage = "300kW",
    ingredient_count = 5,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/fts-reactor/base-anim.png",
                width = 192,
                height = 160,
                line_length = 10,
                frame_count = 99,
                shift = {0.507, 0},
                animation_speed = 0.75,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/fts-reactor/top-anim.png",
                width = 185,
                height = 226,
                line_length = 11,
                frame_count = 99,
                shift = {-0.243, -6.0},
                animation_speed = 0.75,
            },
        }
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures({0,1}, {0,-1}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.0, -0.0} }}
        },
        {
            production_type = "input",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures({0,1}, {0,-1}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.0, -1.0} }}
        },
        {
            production_type = "input",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures({0,1}, {0,-1}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {3.0, -2.0} }}
        },

        {
            production_type = "output",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures(nil, nil, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, -0.0} }}
        },
        {
            production_type = "output",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures(nil, nil, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, -1.0} }}
        },
        {
            production_type = "output",
            --pipe_picture = floatationpipepictures(),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture=pipe_pictures(nil, nil, nil, nil),
            base_level = 1,
            pipe_connections = {{position = {-3.0, -2.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/evaporator.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/evaporator.ogg", volume = 0.5 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
