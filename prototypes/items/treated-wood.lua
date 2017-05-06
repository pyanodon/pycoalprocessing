-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe_treated_lumber= {
    type = "recipe",
    name = "treated-wood",
    category = "crafting-with-fluid",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="fluid", name="creosote", amount=10},
        {type="item", name="wood", amount=1},
    },
    results=
    {
        {type="item", name="treated-wood", amount=2},
    },
}
-------------------------------------------------------------------------------
--[[Items]]--
local treated_lumber = {
    type = "item",
    name = "treated-wood",
    icon = "__pycoalprocessing__/graphics/icons/treated-wood.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "treated-wood",
    fuel_value = "3MJ",
    fuel_category = "chemical",
    stack_size = 100
}
-------------------------------------------------------------------------------
--[[Entites]]--
-------------------------------------------------------------------------------
--[[Extend Data]]--
data:extend({recipe_treated_lumber, treated_lumber})
