-------------------------------------------------------------------------------
--[[coal-gas]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1 =
{
    type = "recipe",
    name = "coal-gas",
    category = "distilator",
    enabled = "true",
    energy_required = 3,
    ingredients ={
        {type="item", name="coal", amount=10},
    },
    results=
    {
        {type="fluid", name="coal-gas", amount=40},
        {type="fluid", name="tar", amount=50},
        {type="item", name="iron-oxide", amount=1, probability=0.5},
        {type="item", name="coke", amount=2},
    },
    main_product= "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/coalgas-from-coal.png",
    --order = "a [coal-gas]",
}

local recipe2 =
{
    type = "recipe",
    name = "coal-gas-from-wood",
    category = "distilator",
    enabled = "true",
    energy_required = 3,
    ingredients ={
        {type="item", name="raw-wood", amount=10},
    },
    results=
    {
        {type="fluid", name="coal-gas", amount=2},
        {type="fluid", name="tar", amount=30},
        {type="item", name="iron-oxide", amount=1, probability=0.5},
        {type="item", name="coal", amount=10},
    },
    main_product= "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/coalgas-from-wood.png",
    --order = "a [coal-gas]",
}

-------------------------------------------------------------------------------
--[[fluids]]--
local fluid =
{
    type = "fluid",
    name = "coal-gas",
    icon = "__pycoalprocessing__/graphics/icons/coalgas.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.921, g = 0.776, b = 0.541},
    flow_color = {r = 0.921, g = 0.776, b = 0.541},
    max_temperature = 100,
	gas_temperature = 15,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    subgroup = "py-syngas",
    order = "a-[coal-gas]"
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({recipe1, recipe2, fluid})
