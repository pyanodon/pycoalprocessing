local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/top.png",
            priority = "low",
            width = 224,
            height = 230,
            --shift = {0.0, -0.163},
            shift = shift_north
        }
    else
        north = Proto.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/bottom.png",
            priority = "extra-high",
            width = 224,
            height = 230,
            --shift = {0.0, -0.163},
            shift = shift_south
        }
    else
        south = Proto.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/left.png",
            priority = "extra-high",
            width = 224,
            height = 230,
            --shift = {0.8125, 0}
            shift = shift_west
        }
    else
        west = Proto.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/right.png",
            priority = "extra-high",
            width = 224,
            height = 230,
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
    name = "ralesia-plantation",
    energy_requiered = 100,
    enabled = false,
    ingredients =
    {
        {"soil", 400},
        {"pipe", 15}, -- bob steel pipe
        {"electronic-circuit", 25}, -- bob basic-electronic-circuit-board
        {"glass", 100},
        {"iron-plate", 30},
        {"treated-wood", 50},
		{"small-lamp", 20},

    },
    result= "ralesia-plantation",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "ralesia-plantation",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-plantation-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-b[ralesia-plantation]",
    place_result = "ralesia-plantation",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "ralesia-plantation",
    icon = "__pycoalprocessing__/graphics/icons/ralesia-plantation-icon.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "ralesia-plantation"},
    fast_replaceable_group = "ralesia-plantation",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"ralesia"},
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
        filename = "__pycoalprocessing__/graphics/entity/ralesia-plantation/ralesia-plantation.png",
        width = 224,
        height = 230,
        frame_count = 50,
        line_length = 8,
        animation_speed = 2,
		run_mode = "forward-then-backward",
        shift = {0.0, -0.163},
    },

    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = pipe_pictures({-0.0,3.837}, {-0.0,-3.837}, {4.0,0.0}, {-4.0,0.0}),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0.0, 4.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/ralesia-plantation.ogg", volume = 0.5 },
        idle_sound = { filename = "__pycoalprocessing__/sounds/ralesia-plantation.ogg", volume = 0.35 },
        apparent_volume = 0.2,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
