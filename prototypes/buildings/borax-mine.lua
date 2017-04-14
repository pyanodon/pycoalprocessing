local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/borax-mine/top-connection.png",
            priority = "low",
            width = 288,
            height = 288,
            --shift = {0.03125, 0.3125}
            shift = shift_north
        }
    else
        north = Proto.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/borax-mine/bottom-connection.png",
            priority = "extra-high",
            width = 288,
            height = 288,
            --shift = {0.03125, -1.0625}
            shift = shift_south
        }
    else
        south = Proto.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__pycoalprocessing__/graphics/entity/borax-mine/left-connection.png",
            priority = "extra-high",
            width = 288,
            height = 288,
            --shift = {0.8125, 0}
            shift = shift_west
        }
    else
        west = Proto.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__pycoalprocessing__/graphics/entity/borax-mine/right-connection.png",
            priority = "extra-high",
            width = 288,
            height = 288,
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
    name = "borax-mine",
    energy_requiered = 25,
    enabled = false,
    ingredients =
    {
        {"electric-mining-drill", 2},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 20}, --updated-bob basic-electronic-circuit-board
        {"steel-plate", 150},
        {"iron-gear-wheel", 15}, --updated-bob steel-bearing
        {"transport-belt", 30},

    },
    result= "borax-mine",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "borax-mine",
    icon = "__pycoalprocessing__/graphics/icons/borax-mine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[borax-mine]",
    place_result = "borax-mine",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "borax-mine",
    icon = "__pycoalprocessing__/graphics/icons/borax-mine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "borax-mine"},
    fast_replaceable_group = "borax-mine",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.3, -4.3}, {4.3, 4.3}},
    selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"borax"},
    crafting_speed = 0.3,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.06,
    },
    energy_usage = "420kW",
    ingredient_count = 4,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/borax-mine/bottom-borax.png",
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.9,
                shift = {0.0, 2.25},
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/borax-mine/top-borax.png",
                width = 288,
                height = 144,
                line_length = 7,
                frame_count = 90,
                animation_speed = 0.9,
                shift = {0.0, -2.25},
            },
        }
    },

    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = pipe_pictures({-0.0,4.9}, {-0.0,-4.9}, {4.9,0.0}, {-4.9,0.0}),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, 5.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/borax-mine.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/borax-mine.ogg", volume = 1.25 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
