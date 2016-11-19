--luacheck: ignore PYC

if PYC.USE_CREOSOTE_RECIPES then -- flag from config.lua
  if PYC.USE_CREOSOTE_IN.rail then
    if not data.raw.recipe["bi-rail-wood"] then
      local newrail=data.raw.recipe["rail"]
      newrail.ingredients = {
        {"stone", 1},
        {"iron-stick", 2},
        {"treated-lumber", 2}
      }
    end

    --Bio Industries
    if data.raw.recipe["bi-rail-wood"] then
      local biwoodrail = data.raw.recipe["bi-rail-wood"]
      biwoodrail.ingredients = {
        {"stone", 1},
        {"iron-stick", 2},
        {"treated-lumber", 2}
      }
    end
  end

  if PYC.USE_CREOSOTE_IN.power_poles then
    local newpole=table.deepcopy(data.raw.recipe["medium-electric-pole"])
    newpole.category = "crafting-with-fluid"
    newpole.ingredients[#newpole.ingredients +1] = {
      type="fluid", name="creosote", amount=10
    }
    data:extend({newpole})

    --Big Wooden Pole Mod
    if data.raw.recipe["big-wooden-pole"] then
      local bigpole = data.raw.recipe["big-wooden-pole"]
      bigpole.ingredients = {
        {"treated-lumber", 5},
        {"copper-cable", 8}
      }
    end

    --Bio Industries
    if data.raw.recipe["bi-big-wooden-pole"] then
      local bibigpole = data.raw.recipe["bi-big-wooden-pole"]
      bibigpole.ingredients = {
        {"treated-lumber", 5},
        {"small-electric-pole", 2},
      }
    end
  end

  --More Floors
  if data.raw.recipe["wood-floor"] then
    local woodfloor = data.raw.recipe["wood-floor"]
    woodfloor.ingredients = {
      {"treated-lumber", 10},
    }
  end

  --Bio Industries
  if data.raw.recipe["bi-wooden-fence"] then
    local fence = data.raw.recipe["bi-wooden-fence"]
    fence.ingredients =
    {
      {"treated-lumber", 2},
      {"raw-wood", 2},
    }
  end

end
