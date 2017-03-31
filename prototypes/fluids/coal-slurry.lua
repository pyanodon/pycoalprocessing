-------------------------------------------------------------------------------
--[[coal-slurry-fuel]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1 =
{
    type = "recipe",
    name = "coal-slurry",
    category = "fluid-separator",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="dirty-water", amount=25},
    },
    results=
    {
        {type="fluid", name="water", amount=10},
        {type="fluid", name="coal-slurry", amount=15},
    },
    main_product= "coal-slurry",
    icon = "__pycoalprocessing__/graphics/icons/coal-slurry.png",
    --order = "b-c [syn-gas]",
}
-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "coal-slurry",
    icon = "__pycoalprocessing__/graphics/icons/coal-slurry.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.247, g = 0.247, b = 0.247},
    flow_color = {r = 0.247, g = 0.247, b = 0.247},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "z-[coal-slurry]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({recipe1, fluid})
