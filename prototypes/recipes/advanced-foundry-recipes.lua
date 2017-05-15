-------------------------------------------------------------------------------
--NEXELIT PLATE
local nexelit_plate ={
    type = "recipe",
    name = "nexelit-plate",
    category = "advanced-foundry",
    enabled = "false",
    energy_required = 2,
    ingredients ={
        {type="item", name="nexelit-ore", amount=2},
        {type="fluid", name="petroleum-gas", amount=15},
        {type="item", name="limestone", amount=2},
        {type="item", name="sand-casting", amount=1},
    },
    results=
    {
        {type="item", name="nexelit-plate", amount=2},
    },
    main_product= "nexelit-plate",
    icon = "__pycoalprocessing__/graphics/icons/nexelit-plate.png",
}
-------------------------------------------------------------------------------

--Make foundry recipes from smelting recipes with 1 ingredient.
local list = {}
log("Creating additional foundry recipes")
local _filter_ing = function(v)
    return v.category == "smelting" and (v.ingredients and #v.ingredients == 1) or (v.normal and v.normal.ingredients and #v.normal.ingredients == 1) end

    for _, recipe in pairs(table.filter(data.raw.recipe, _filter_ing)) do

        local ing1 = (recipe.ingredients and recipe.ingredients[1].name and recipe.ingredients[1])
        or (recipe.ingredients and {type="item", name=recipe.ingredients[1][1], amount=recipe.ingredients[1][2] * 5})
        ing1 = ing1 or (recipe.normal and recipe.normal.ingredients and recipe.normal.ingredients[1].name and recipe.normal.ingredients[1])
        or (recipe.normal and {type="item", name=recipe.normal.ingredients[1][1], amount=recipe.normal.ingredients[1][2] * 5})

        local res
        if recipe.result then
            res = {{type = "item", name = recipe.result or recipe.result[1], amount = 8}}
        elseif recipe.results then
            res = table.deepcopy(recipe.results)
        elseif recipe.normal.result then
            res = {{type = "item", name = recipe.normal.result or recipe.normal.result[1], amount = 8}}
        elseif recipe.normal.results then
            res = table.deepcopy(recipe.normal.results)
        end


        local new = {
            type = "recipe",
            name = "advanced-foundry-"..recipe.name,
            category = "advanced-foundry",
            enabled = true,
            energy_required = 3,
            ingredients = {
                ing1,
                {type="item", name="fuelrod-mk01", amount=1},
                {type="item", name="limestone", amount=2},
                {type="item", name="sand-casting", amount=1},
            },
            results = res,
            icon = recipe.icon,
            icons = recipe.icons,
            main_product = data.raw.item[res[1].name] and res[1].name or nil
        }
        log(new.name)
        list[#list+1] = new
    end
    data:extend(list)

    data:extend{nexelit_plate}
