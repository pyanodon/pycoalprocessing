local DEBUG = require('config').DEBUG
if DEBUG then
    local developer = require('__stdlib__/stdlib/data/developer/developer')
    developer.make_test_entities('pycoalprocessing')
end

--[[
--find all techs with utility science packs and log a list of names
local techs = {}
for t, tech in pairs(data.raw.technology) do
    log(tech.name)
    if tech.unit ~= nil and tech.unit.ingredients ~= nil then
        for i, ing in pairs(tech.unit.ingredients) do
            log(serpent.block(ing))
            if string.match(ing[1], "utility") then
                table.insert(techs, tech.name)
            end
        end
    end
end

log(serpent.block(techs))
]]--

for r,recipe in pairs(data.raw.recipe) do
    if recipe.category == "combustion" then
        local temp
        for _,result in pairs(recipe.results) do
            if result.name == "combustion-mixture1" then
                temp = result.temperature
            end
        end
        recipe.localised_name = {"recipe-name." .. recipe.name, temp}
    end
end

local function create_tmp_tech(recipe, original_tech)
    local new_tech = TECHNOLOGY {
        type = "technology",
        name = "tmp-" .. recipe .. "-tech",
        icon = "__pycoalprocessinggraphics__/graphics/placeholder.png",
        icon_size = 128,
        order = "c-a",
        prerequisites = {},
        effects = {
            { type = "unlock-recipe", recipe = recipe }
        },
        unit = {
            count = 30,
            ingredients = {
                {"automation-science-pack", 1}
            },
            time = 30
        }
    }

    if original_tech then
        RECIPE(recipe):remove_unlock(original_tech)
    end

    return new_tech
end


-- TMP TECHS HERE --
if mods["pyalienlife"] and mods["pyhightech"] then

end


----------------------------------------------------
-- AUTO TECH script. Make sure it's the very last
----------------------------------------------------
-- require('prototypes/functions/auto_tech')
----------------------------------------------------
----------------------------------------------------

-- tech-t\|(?!tmp).*: NOT EMPTY
-- Restarting without science pack checks
