local PYC = require("config")

if PYC.USE_CREOSOTE_RECIPES then -- flag from config.lua

    if PYC.USE_CREOSOTE_IN.rail then
        local bi_rail = RECIPE("bi-rail-wood")
        if not bi_rail:is_valid() then
            RECIPE("rail"):clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient({"treated-wood", 2})
        else
            bi_rail:clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient({"treated-wood", 2})
        end
    end

    if PYC.USE_CREOSOTE_IN.power_poles then

        RECIPE("big-wooden-pole"):replace_ingredient("wood", {"treated-wood", 5})
        RECIPE("bi-big-wooden-pole"):replace_ingredient("wood", {"treated-wood", 5})
    end

    RECIPE("wood-floor"):replace_ingredient("wood", "treated-wood")
    RECIPE("bi-wooden-fence"):replace_ingredient("wood", "treated-wood")
end
