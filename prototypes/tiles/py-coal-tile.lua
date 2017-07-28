-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "py-coal-tile",
    category = "crafting",
    enabled = false,
    ingredients =
    {
        {type="item", name="ash", amount=2},
        {type="item", name="tailings-dust", amount=10},
    },
    result = "py-coal-tile",
    requester_paste_multiplier = 4,
    subgroup = "py-items",
    order = "a-coal-tile",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type="item",
    name="py-coal-tile",
    icon="__pycoalprocessing__/graphics/icons/py-coal-tile-icon.png",
    flags={"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "a-coal-tile",
    stack_size = 500, default_request_amount = 150,
    place_as_tile = {result = "py-coal-tile",condition_size = 2,condition = { "water-tile" }}
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1= {
    type = "tile",
    name = "py-coal-tile",
    needs_correction = false,
    minable = {hardness = 0.2, mining_time = 0.5, result = "py-coal-tile"},
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1.4,
    layer = 61,
    variants =
    {
        main =
        {
            {
                picture = "__pycoalprocessing__/graphics/tiles/py-coal/py-coal-tile.png",
                count = 1,
                size = 1
            },
        },
        inner_corner =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-asphalt/concrete-inner-corner.png",
            count = 8
        },
        outer_corner =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-asphalt/concrete-outer-corner.png",
            count = 8
        },
        side =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-asphalt/concrete-side.png",
            count = 8
        },
        u_transition =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-asphalt/concrete-u.png",
            count = 8
        },
        o_transition =
        {
            picture = "__pycoalprocessing__/graphics/tiles/py-asphalt/concrete-o.png",
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
    vehicle_friction_modifier = _G.stone_path_vehicle_speed_modifier
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
