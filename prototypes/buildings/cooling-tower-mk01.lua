local pipe_pictures = function(shift_south)
    local north, south, east, west
    north = Proto.empty_sprite
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/cooling-tower-mk01/pipe-ending-down.png",
            priority = "extra-high",
            width = 40,
            height = 45,
            shift = shift_south
        }
        west = Proto.empty_sprite
        east = Proto.empty_sprite
        return {north=north, south=south, west=west, east=east}
    end
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "cooling-tower-mk01",
    energy_requiered = 17,
    enabled = false,
    ingredients =
    {
        {"storage-tank", 1},
        {"small-pump", 1},
        {"advanced-circuit", 5},
        {"pipe", 20}, --updated-bob copper-pipe
        {"iron-gear-wheel", 15}, --updated-bob brass-gear-wheel
        {"iron-plate", 30}, --updated-bob brass-plate

    },
    result= "cooling-tower-mk01",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type = "item",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessing__/graphics/icons/cooling-tower-mk01.png",
    flags = {"goes-to-quickbar"},
    subgroup = "py-fluid-handling",
    order = "a-c[cooling-tower-mk01]",
    place_result = "cooling-tower-mk01",
    stack_size = 5,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "cooling-tower-mk01",
    icon = "__pycoalprocessing__/graphics/icons/cooling-tower-mk01.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "cooling-tower-mk01"},
    fast_replaceable_group = "cooling-tower-mk01",
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_specification =
    {
        module_slots = 1
    },
    allowed_effects = {"speed"},
    crafting_categories = {"cooling"},
    crafting_speed = 0.75,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.00,
    },
    energy_usage = "70kW",
    ingredient_count = 1,

    animation =
    {
        filename = "__pycoalprocessing__/graphics/entity/cooling-tower-mk01/cooling-tower-mk01.png",
        width = 113,
        height = 133,
        frame_count = 30,
        line_length = 10,
        animation_speed = 2,
        shift = {0.20, -0.4},
    },

    fluid_boxes =
    {
        {
            production_type = "input",
            pipe_picture = pipe_pictures({-0.05, -0.8}),
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {2.0, 0.0} }}
        },
        {
            production_type = "output",
            pipe_picture = pipe_pictures({-0.05, -0.8}),
            pipe_covers = Proto.pipe_covers(false, true, true, true),
            base_level = 1,
            pipe_connections = {{ type="output" , position = {-2.0, 0.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/cooling-tower-mk01.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/cooling-tower-mk01.ogg", volume = 0.35 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
