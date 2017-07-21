local PYC = require("config")

local function add_ing(str_recipe, normal, expensive)
    expensive = expensive or normal
    local recipe = data.raw.recipe[str_recipe]
    if recipe then
        if recipe.normal then
            recipe.normal.ingredients[#recipe.normal.ingredients + 1] = normal
            if recipe.expensive then
                recipe.expensive.ingredients[#recipe.expensive.ingredients + 1] = expensive
            end
        else
            recipe.ingredients[#recipe.ingredients + 1] = normal
        end
    end
end

local function rep_ings(str_recipe, normal, expensive)
    expensive = expensive or normal
    local recipe = data.raw.recipe[str_recipe]
    if recipe then
        if recipe.normal then
            recipe.normal.ingredients = table.deepcopy(normal)
            if recipe.expensive then
                recipe.expensive.ingredients = table.deepcopy(expensive)
            end
        else
            recipe.ingredients = normal
        end
    end
end

if PYC.USE_CREOSOTE_RECIPES then -- flag from config.lua
    if PYC.USE_CREOSOTE_IN.rail then
        if not data.raw.recipe["bi-rail-wood"] then
            rep_ings("rail", {
                    {"stone", 1},
                    {"iron-stick", 2},
                    {"treated-wood", 2}
                }
            )
        end

        --Bio Industries
        rep_ings("bi-rail-wood", {
                {"stone", 1},
                {"iron-stick", 2},
                {"treated-wood", 2}
            }
        )
    end

    if PYC.USE_CREOSOTE_IN.power_poles then
        local newpole = data.raw.recipe["medium-electric-pole"]
        newpole.category = "crafting-with-fluid"
        add_ing("medium-electric-pole", {type="fluid", name="creosote", amount=10})

        --Big Wooden Pole Mod
        rep_ings("big-wooden-pole",
            {
                {"treated-wood", 5},
                {"copper-cable", 8}
            }
        )
    end

    --Bio Industries
    rep_ings("bi-big-wooden-pole",
        {
            {"treated-wood", 5},
            {"small-electric-pole", 2},
        }
    )

    --More Floors
    rep_ings("wood-floor",
        {
            {"treated-wood", 10}
        }
    )

    --Bio Industries
    rep_ings("bi-wooden-fence",
        {
            {"treated-wood", 2},
            {"raw-wood", 2},
        }
    )
end

--ADDING NIOBIUM INTO LOW DENSITY STRUCTURE
do
    local normal = {type = "item", name = "niobium-plate", amount = 5}
    local expensive = {type = "item", name = "niobium-plate", amount = 10}
    add_ing("low-density-structure", normal, expensive)
end

--ADDING FUELROD INTO ROCKET-FUEL INTO ROCKET-FUEL
do
    local normal = {type = "item", name = "fuelrod-mk01", amount = 2}
    local expensive = {type = "item", name = "fuelrod-mk01", amount = 4}
    add_ing("rocket-fuel", normal, expensive)
end
