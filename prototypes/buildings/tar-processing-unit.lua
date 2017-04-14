local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/methanol-reactor/long-pipe-north.png",
            priority = "low",
            width = 30,
            height = 44,
            shift = shift_north
        }
    else
        north = Proto.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/pipe-ending-down.png",
            priority = "extra-high",
            width = 40,
            height = 45,
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
    name = "tar-processing-unit",
    energy_required = 5,
    enabled = "false",
    ingredients ={
        {"steel-plate", 20},
        {"iron-plate", 10},
        {"pipe", 15}, --updated-bob stone-pipe
        {"steel-furnace", 1},
        {"electronic-circuit", 7},
    },
    result= "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[tar-processing-unit]",
    place_result = "tar-processing-unit",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "tar-processing-unit",
    icon = "__pycoalprocessing__/graphics/icons/tar-processing-unit.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "tar-processing-unit"},
    fast_replaceable_group = "tar-processing-unit",
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-3.4, -3.4}, {3.4, 3.4}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "pollution"},
    crafting_categories = {"tar"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.02 / 2,
    },
    energy_usage = "100kW",
    ingredient_count = 4,
    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/tar-processing.png",
        width = 236,
        height = 229,
        frame_count = 1,
        --animation_speed = 0.5,
        shift = {0.15, -0.1},
    },

    working_visualisations =
    {
        {
            north_position = {1.212, -0.07},
            west_position = {1.212, -0.07},
            south_position = {1.212, -0.07},
            east_position = {1.212, -0.07},
            animation =
            {
                filename = "__pycoalprocessing__/graphics/entity/tar-processing-unit/tar-anim.png",
                frame_count = 40,
                line_length = 8,
                width = 96,
                height = 67,
                animation_speed = 0.15
            }
        }
    },
    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = pipe_pictures(nil, {-0.05, -0.8}, nil, {-0.81, 0.075}),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {0, 4} }}
        },
        {
            production_type = "output",
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            pipe_picture = pipe_pictures(nil, {-0.05, -0.8}, nil, {-0.81, 0.075}),
            base_level = 1,
            pipe_connections = {{ position = {0, -4} }}
        },
    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__base__/sound/oil-refinery.ogg" },
        idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
