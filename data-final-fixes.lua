if not mods.pyalternativeenergy then
    for _, recipe in pairs(data.raw.recipe) do
        if not recipe.localised_name and recipe.category == "combustion" and not recipe.name:find("%-biomass$") then
            local temp
            for _, result in pairs(recipe.results) do
                if result.name == "combustion-mixture1" then
                    temp = result.temperature
                end
            end
            recipe.localised_name = {"recipe-name." .. recipe.name, tostring(temp)}
        end
    end
end

require "prototypes/map-gen-presets"

-- Updating requester paste setting
local rpm_entity = tonumber(settings.startup["rpm_entity"].value)
local rpm_items = tonumber(settings.startup["rpm_items"].value)
local overload = tonumber(settings.startup["overload"].value)
if rpm_entity ~= 30 or rpm_items ~= 30 or overload ~= 0 then
    --log("Updating recipe requester paste values")
    --These types (data.raw[entity_type]) are placeable entities
    local entity_types = defines.prototypes.entity
    -- We store the result of each lookup so we don't have to do it again
    -- When iterating *the entire recipe table X every individual result* this is worthwhile!
    local valid_entities = {}
    -- This is only hit when we request an index that doesn't exist (name we haven't checked)
    -- We then check if it's an entity and make an entry for that answer, followed by returning that result
    setmetatable(valid_entities, {
        __index = function(self, index)
            local item = data.raw.item[index]
            -- Place result?
            if item and item.place_result then
                rawset(self, index, true)
                return true
            end
            -- Valid entity?
            for type_name, _ in pairs(entity_types) do
                if data.raw[type_name] and data.raw[type_name][index] then
                    rawset(self, index, true)
                    return true
                end
            end
            -- Otherwise, nope!
            rawset(self, index, false)
            return false
        end
    })

    for _, recipe in pairs(data.raw.recipe) do
        for _, result in pairs(recipe.results) do -- This looks long, however we skip a lot of the logic with caching
            local result_name = result[1] or result.name
            if result_name and valid_entities[result_name] then
                --log("Set multiplier for " .. recipe.name .. " (" .. result_name .. ")")
                recipe.requester_paste_multiplier = tonumber(rpm_entity)
                recipe.overload_multiplier = tonumber(overload)
                goto continue
            end
        end
        recipe.requester_paste_multiplier = tonumber(rpm_items)
        recipe.overload_multiplier = tonumber(overload)
        ::continue::
    end
end

data.raw["utility-constants"].default.minimum_recipe_overload_multiplier = 1

for _, recipe in pairs(data.raw.recipe) do
    if recipe.category == "tar" and not recipe.crafting_machine_tint then
        error("Recipe " .. recipe.name .. " is missing crafting_machine_tint. Please fill out this field.")
    end
end
