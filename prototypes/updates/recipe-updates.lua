--luacheck: ignore PYC
--Since we only want to change "some" things about an existing item lets do it in the data_updates phase with an exact copy.

if PYC.USE_CREOSOTE_RECIPES then -- flag from config.lua
  if PYC.USE_CREOSOTE_IN.rail then
    local newpole=table.deepcopy(data.raw.recipe["medium-electric-pole"])
    newpole.category = "crafting-with-fluid"
    newpole.ingredients[#newpole.ingredients +1] = { --Get the current number of ingredients and add one too it (just another form of table.insert)
      type="fluid", name="creosote", amount=10
    }
    data:extend({newpole})
  end

  if PYC.USE_CREOSOTE_IN.power_poles then
    local newrail=table.deepcopy(data.raw.recipe["rail"])
    newrail.category = "crafting-with-fluid"
    table.insert(newrail.ingredients, {type="fluid", name="creosote", amount=10})
    data:extend({newrail})

    if data.raw.recipe["big-wooden-pole"] then
      local big_wooden = table.deepcopy(data.raw.recipe["big-wooden-pole"])
      big_wooden.category = "crafting-with-fluid"
      table.insert(big_wooden.ingredients, {type = "fluid", name="creosote", amount=10})
      data:extend({big_wooden})
    end
  end
end
