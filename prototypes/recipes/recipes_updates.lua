    --Since we only want to change "some" things about an existing item lets do it in the data_updates phase with an exact copy.

    if USECREOSOTE_POLE then -- flag from config.lua
      local newpole=table.deepcopy(data.raw.recipe["medium-electric-pole"])
      newpole.category = "crafting-with-fluid"
      newpole.ingredients[#newpole.ingredients +1] = { --Get the current number of ingredients and add one too it (just another form of table.insert)
        type="fluid", name="creosote", amount=10
      }
      data:extend({newpole}) --insert our replacement pole
    end

    if USECREOSOTE_RAIL then
      local newrail=table.deepcopy(data.raw.recipe["rail"])
      newrail.category = "crafting-with-fluid"
      table.insert(newrail.ingredients, {type="fluid", name="creosote", amount=10})
      data:extend({newrail})
    end
