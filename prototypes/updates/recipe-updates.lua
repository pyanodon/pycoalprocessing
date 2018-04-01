local PYC = require("config")

if PYC.USE_CREOSOTE_RECIPES then -- flag from config.lua

    if PYC.USE_CREOSOTE_IN.rail then
        local bi_rail = RECIPE("bi-rail-wood")
        if not bi_rail:valid() then
            RECIPE("rail"):clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient({"treated-wood", 2})
        else
            bi_rail:clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient({"treated-wood", 2})
        end
    end

    if PYC.USE_CREOSOTE_IN.power_poles then
        RECIPE("medium-electric-pole"):set_category("crafting-with-fluid"):add_ingredient({type = "fluid", name = "creosote", amount = 10})

        RECIPE("big-wooden-pole"):replace_ingredient("wood", {"treated-wood", 5})
        RECIPE("bi-big-wooden-pole"):replace_ingredient("wood", {"treated-wood", 5})
    end

    RECIPE("wood-floor"):replace_ingredient("wood", "treated-wood")
    RECIPE("bi-wooden-fence"):replace_ingredient("wood", "treated-wood")
end

do
    --ADDING NIOBIUM INTO LOW DENSITY STRUCTURE
    local normal = {type = "item", name = "niobium-plate", amount = 5}
    local expensive = {type = "item", name = "niobium-plate", amount = 10}
    RECIPE("low-density-structure"):make_difficult():add_ingredient(normal, expensive)
end

do
    --ADDING FUELROD INTO ROCKET-FUEL INTO ROCKET-FUEL
    local normal = {type = "item", name = "fuelrod-mk01", amount = 2}
    local expensive = {type = "item", name = "fuelrod-mk01", amount = 4}
    RECIPE("rocket-fuel"):make_difficult():add_ingredient(normal, expensive)
end
