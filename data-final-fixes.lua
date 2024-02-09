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

-- Updating requester paste setting
if settings.startup['rpm_entity'].value ~= 30 or settings.startup['rpm_items'].value ~= 30 then
    --log("Updating recipe requester paste values")
      --These types (data.raw[entity_type]) are placeable entities
      local entity_types = {'accumulator','artillery-turret','beacon','boiler','burner-generator','character','arithmetic-combinator','decider-combinator','constant-combinator','container','logistic-container','infinity-container','assembling-machine','rocket-silo','furnace','electric-energy-interface','electric-pole','unit-spawner','fish','combat-robot','construction-robot','logistic-robot','gate','generator','heat-interface','heat-pipe','inserter','lab','lamp','land-mine','linked-container','market','mining-drill','offshore-pump','pipe','infinity-pipe','pipe-to-ground','player-port','power-switch','programmable-speaker','pump','radar','curved-rail','straight-rail','rail-chain-signal','rail-signal','reactor','roboport','simple-entity','simple-entity-with-owner','simple-entity-with-force','solar-panel','spider-leg','storage-tank','train-stop','linked-belt','loader-1x1','loader','splitter','transport-belt','underground-belt','tree','turret','ammo-turret','electric-turret','fluid-turret','unit','car','artillery-wagon','cargo-wagon','fluid-wagon','locomotive','spider-vehicle','wall'}
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
              for _, type_name in pairs(entity_types) do
                  if data.raw[type_name][index] then
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
          for _, result_table in pairs({
              recipe.result and {recipe.result},
              recipe.results,
              recipe.normal and (recipe.normal.results or {recipe.normal.result}),
              recipe.expensive and (recipe.expensive.results or {recipe.expensive.result})
          }) do
              for _, result in pairs(result_table) do -- This looks long, however we skip a lot of the logic with caching
                  local result_name = result[1] or result.name
                  if result_name and valid_entities[result_name] then
                      --log("Set multiplier for " .. recipe.name .. " (" .. result_name .. ")")
                      recipe.requester_paste_multiplier = settings.startup['rpm_entity'].value
                      goto continue
                  end
              end
          end
          recipe.requester_paste_multiplier = settings.startup['rpm_items'].value
          ::continue::
      end
  end