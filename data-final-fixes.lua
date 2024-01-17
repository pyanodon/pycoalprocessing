if not mods.pyalternativeenergy then
    for _, recipe in pairs(data.raw.recipe) do
        if not recipe.localised_name and recipe.category == 'combustion' and not recipe.name:find('%-biomass$') then
            local temp
            for _, result in pairs(recipe.results) do
                if result.name == 'combustion-mixture1' then
                    temp = result.temperature
                end
            end
            recipe.localised_name = {'recipe-name.' .. recipe.name, temp}
        end
    end
end

require('prototypes/map-gen-presets')