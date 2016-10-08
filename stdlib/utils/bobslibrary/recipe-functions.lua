if not bobmods.lib.recipe then bobmods.lib.recipe = {} end


function bobmods.lib.recipe.replace_ingredient(recipe, old, new)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(new) then
    local amount = 0
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old then
        amount = ingredient[2] + amount
      end
      if ingredient.name == old then
        amount = ingredient.amount + amount
      end
    end
    if amount > 0 then
      bobmods.lib.recipe.remove_ingredient(recipe, old)
      bobmods.lib.recipe.add_ingredient(recipe, {new, amount})
      return true
    else
      return false
    end
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(new) then
      log("Ingredient " .. new .. " does not exist.")
    end
    return false
  end
end

function bobmods.lib.recipe.replace_ingredient_crude(recipe, old, new)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_basic_type(new) then
    local replaced = false
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old or ingredient.name == old then
        local item = bobmods.lib.item.basic_item(ingredient)
        item.name = new
        item.type = bobmods.lib.item.get_basic_type(new)
        ingredient = item
        replaced = true
      end
    end
    return replaced
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(new) then
      log("Ingredient " .. new .. " does not exist.")
    end
    return false
  end
end

function bobmods.lib.recipe.replace_ingredient_in_all(old, new)
  if bobmods.lib.item.get_basic_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      bobmods.lib.recipe.replace_ingredient(recipe.name, old, new)
    end
  else
    log("Ingredient " .. new .. " does not exist.")
  end
end

function bobmods.lib.recipe.remove_ingredient(recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.item.remove(data.raw.recipe[recipe].ingredients, item)
  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end

function bobmods.lib.recipe.add_new_ingredient(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then
    bobmods.lib.item.add_new(data.raw.recipe[recipe].ingredients, bobmods.lib.item.basic_item(item))
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_type(item) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end

function bobmods.lib.recipe.add_ingredient(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then
    bobmods.lib.item.add(data.raw.recipe[recipe].ingredients, bobmods.lib.item.basic_item(item))
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Ingredient " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end


function bobmods.lib.recipe.add_result(recipe, item)
  if data.raw.recipe[recipe] and bobmods.lib.item.get_type(bobmods.lib.item.basic_item(item).name) then
    bobmods.lib.result_check(data.raw.recipe[recipe])
    bobmods.lib.item.add(data.raw.recipe[recipe].results, item)
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not bobmods.lib.item.get_basic_type(bobmods.lib.item.basic_item(item).name) then
      log("Item " .. bobmods.lib.item.basic_item(item).name .. " does not exist.")
    end
  end
end

function bobmods.lib.recipe.remove_result(recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.result_check(data.raw.recipe[recipe])
    bobmods.lib.item.remove(data.raw.recipe[recipe].results, item)
  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end



