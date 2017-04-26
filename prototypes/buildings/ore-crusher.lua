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
            --shift = {0.03125, 0.0625},
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
    name = "ore-crusher",
    energy_requiered = 10,
    enabled = false,
    ingredients =
    {
        {"car", 2},
        {"iron-plate", 20},
        {"engine-unit", 10},
        {"steel-plate", 70}, --updated-bob invar-alloy
        {"electronic-circuit", 20}, --updated-bob basic-electronic-circuit-board 
    },
    result= "ore-crusher",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "ore-crusher",
    icon = "__pycoalprocessing__/graphics/icons/ore-crusher.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-d[ore-crusher]",
    place_result = "ore-crusher",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "ore-crusher",
    icon = "__pycoalprocessing__/graphics/icons/ore-crusher.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ore-crusher"},
    fast_replaceable_group = "ore-crusher",
    max_health = 600,
    corpse = "medium-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"crusher"},
    crafting_speed = 0.3,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05 / 2.6,
    },
    energy_usage = "300kW",
    ingredient_count = 3,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/ore-crusher/sprite-left.png",
                width = 96,
                height = 256,
                line_length = 21,
                frame_count = 161,
                shift = {-2.0, -0.5},
                animation_speed = 0.85,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/ore-crusher/sprite-mid.png",
                width = 96,
                height = 256,
                line_length = 21,
                frame_count = 161,
                shift = {1.0, -0.5},
                animation_speed = 0.85,
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/ore-crusher/sprite-right.png",
                width = 32,
                height = 256,
                line_length = 64,
                frame_count = 161,
                shift = {3.0, -0.5},
                animation_speed = 0.85,
            },
        }
    },

    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.85 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/classifier.ogg", volume = 0.5 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
