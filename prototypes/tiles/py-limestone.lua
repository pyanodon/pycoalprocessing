--luacheck: no global
-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "py-limestone",
    category = "crafting-with-fluid",
    enabled = false,
    ingredients =
    {
        {type="fluid", name="creosote", amount=10},
        {type="item", name="ash", amount=3},
        {type="item", name="limestone", amount=5},
    },
    result = "py-limestone",
    requester_paste_multiplier = 4,
    subgroup = "py-items",
    order = "a-limestone",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type="item",
    name="py-limestone",
    icon="__pycoalprocessing__/graphics/icons/py-limestone-icon.png",
    flags={"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "a-limestone",
    stack_size = 500, default_request_amount = 150,
    place_as_tile = {result = "py-limestone",condition_size = 2,condition = { "water-tile" }}
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1= {
    type = "tile",
    name = "py-limestone",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "py-limestone"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 2.0,
    layer = 61,
    variants =
    {
        main =
        {
            {
                picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone1.png",
                count = 16,
                size = 1
            },
            {
                picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone2.png",
                count = 4,
                size = 2,
                probability = 0.39,
            },
            {
                picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone4.png",
                count = 4,
                size = 4,
                probability = 1,
            },
        },
        inner_corner =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone-inner-corner.png",
            count = 8
        },
        outer_corner =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone-outer-corner.png",
            count = 8
        },
        side =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone-side.png",
            count = 8
        },
        u_transition =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone-u.png",
            count = 8
        },
        o_transition =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-limestone/py-limestone-o.png",
            count = 1
        }
    },
    walking_sound =
    {
        {
            filename = "__base__/sound/walking/concrete-01.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-02.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-03.ogg",
            volume = 1.2
        },
        {
            filename = "__base__/sound/walking/concrete-04.ogg",
            volume = 1.2
        }
    },
    --map_color={r=0.90, g=0.70, b=0.50},
    map_color=defines.color.darkgrey,
    ageing=0,
    vehicle_friction_modifier = stone_path_vehicle_speed_modifier
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
