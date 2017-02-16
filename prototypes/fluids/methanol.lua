-------------------------------------------------------------------------------
--[[methanol]]--
-------------------------------------------------------------------------------
--[[recipes]]--
local methanol_from_syngas = {
    type = "recipe",
    name = "methanol-from-syngas",
    category = "methanol",
    enabled = "false",
    energy_required = 2,
    ingredients ={

        {type="fluid", name="syngas", amount=5},
        {type="item", name="copper-ore", amount=2},
        {type="item", name="iron-ore", amount=1}, --bob zinc-ore
    },
    results=
    {
        {type="fluid", name="methanol", amount=5},
    },
    --main_product= "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    subgroup = "py-methanol",
    order = "a-[methanol]",
}

--bob-additions: methanol_from_hydrogen

-------------------------------------------------------------------------------
--[[fluids]]--
local methanol = {
    type = "fluid",
    name = "methanol",
    icon = "__pycoalprocessing__/graphics/icons/methanol.png",
    default_temperature = 15,
    heat_capacity = "1KJ",
    base_color = {r = 0.231, g = 0.776, b = 0.333},
    flow_color = {r = 0.231, g = 0.776, b = 0.333},
    max_temperature = 100,
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
}

-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({methanol_from_syngas, methanol})
