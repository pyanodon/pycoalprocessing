local Prototype = require("stdlib.data.prototype")


local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/pipe-north.png",
            priority = "low",
            width = 32,
            height = 32,
            shift = shift_north
        }
    else
        north = Prototype.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/pipe-south.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            shift = shift_south
        }
    else
        south = Prototype.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_west
        }
    else
        west = Prototype.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_east
        }
    else
        east = Prototype.empty_sprite
    end
    return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "fawogae-plantation",
    energy_requiered = 100,
    enabled = true,
    ingredients =
    {
        {"soil", 300},
        {"pipe", 15},
        {"electronic-circuit", 10}, --updated-bob basic-circuit-board
        {"copper-cable", 25},
        {"iron-plate", 40},
        {"raw-wood", 150},

    },
    result= "fawogae-plantation",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "fawogae-plantation",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-plantation-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[fawogae-plantation]",
    place_result = "fawogae-plantation",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "fawogae-plantation",
    icon = "__pycoalprocessing__/graphics/icons/fawogae-plantation-icon.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "fawogae-plantation"},
    fast_replaceable_group = "fawogae-plantation",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
    selection_box = {{-3.0, -3.0}, {3.0, 3.0}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"fawogae"},
    crafting_speed = 0.1,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.01,
    },
    energy_usage = "200kW",
    ingredient_count = 1,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/fawogae-plantation/fawogae.png",
        width = 200,
        height = 193,
        frame_count = 100,
        line_length = 10,
        animation_speed = 3.2,
        shift = {0.13, -0.03},
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            -- pipe_picture = Prototype.pipes("assembler", {0.05, 0.65}, {-0.00, -0.83}, {0.55, 0.15}, {-0.5, 0.15}),
            pipe_covers = Prototype.pipe_covers(false, true, true, true),
            pipe_picture=pipe_pictures({0,0.22}, {0,-1}, nil, nil),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-3.5, 0.5} }}
        },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/fawogae-plantation.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/fawogae-plantation.ogg", volume = 0.55 },
        apparent_volume = 1.2,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
