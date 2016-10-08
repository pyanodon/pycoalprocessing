function bobmods.lib.basic_item(inputs)
  return bobmods.lib.item.basic_item(inputs)
end

--[[ Cannot be used in legacy, due to new group conflict.
function bobmods.lib.item(inputs)
  return bobmods.lib.item.item(inputs)
end
]]--

function bobmods.lib.get_item_type(name)
  return bobmods.lib.item.get_type(name)
end

function bobmods.lib.get_basic_item_type(name)
  return bobmods.lib.item.get_basic_type(name)
end

function bobmods.lib.combine_items(item1_in, item2_in)
  return bobmods.lib.item.combine(item1_in, item2_in)
end

function bobmods.lib.add_item(list, item_in)
  bobmods.lib.item.add(list, item_in) --increments amount if exists
end

function bobmods.lib.add_new_item(list, item_in)
  bobmods.lib.item.add_new(list, item_in) --ignores if exists
end

function bobmods.lib.remove_item(list, item)
  bobmods.lib.item.remove(list, item)
end



function bobmods.lib.replace_science_pack (technology, old, new)
  bobmods.lib.tech.replace_science_pack (technology, old, new)
end

function bobmods.lib.add_new_science_pack (technology, pack, amount)
  bobmods.lib.tech.add_new_science_pack (technology, pack, amount)
end

function bobmods.lib.add_science_pack (technology, pack, amount)
  bobmods.lib.tech.add_science_pack (technology, pack, amount)
end

function bobmods.lib.remove_science_pack (technology, pack)
  bobmods.lib.tech.remove_science_pack (technology, pack)
end

function bobmods.lib.add_technology_recipe (technology, recipe)
  bobmods.lib.tech.add_recipe_unlock (technology, recipe)
end

function bobmods.lib.remove_technology_recipe (technology, recipe)
  bobmods.lib.tech.remove_recipe_unlock (technology, recipe)
end

function bobmods.lib.replace_technology_prerequisite (technology, old, new)
  bobmods.lib.tech.replace_prerequisite (technology, old, new)
end

function bobmods.lib.add_technology_prerequisite (technology, prerequisite)
  bobmods.lib.tech.add_prerequisite (technology, prerequisite)
end

function bobmods.lib.remove_technology_prerequisite (technology, prerequisite)
  bobmods.lib.tech.remove_prerequisite (technology, prerequisite)
end



function bobmods.lib.add_productivity_limitation(intermediate)
  bobmods.lib.module.add_productivity_limitation(intermediate)
end

function bobmods.lib.add_productivity_limitations(intermediates)
  bobmods.lib.module.add_productivity_limitations(intermediates)
end



function bobmods.lib.replace_recipe_item (recipe, old, new)
  bobmods.lib.recipe.replace_ingredient(recipe, old, new)
end

function bobmods.lib.replace_recipe_item_crude (recipe, old, new)
  bobmods.lib.recipe.replace_ingredient_crude(recipe, old, new)
end

function bobmods.lib.replace_item_all_recipes (old, new)
  bobmods.lib.recipe.replace_ingredient_in_all(old, new)
end

function bobmods.lib.remove_recipe_item (recipe, item)
  bobmods.lib.recipe.remove_ingredient(recipe, item)
end

function bobmods.lib.add_new_recipe_item (recipe, item)
  bobmods.lib.recipe.add_new_ingredient(recipe, item)
end

function bobmods.lib.add_recipe_item (recipe, item)
  bobmods.lib.recipe.add_ingredient(recipe, item)
end

function bobmods.lib.add_recipe_result(recipe, item)
  bobmods.lib.recipe.add_result(recipe, item)
end

function bobmods.lib.remove_recipe_result(recipe, item)
  bobmods.lib.recipe.remove_result(recipe, item)
end



function bobmods.lib.create_autoplace(inputs)
  return bobmods.lib.resource.create_autoplace(inputs)
end

function bobmods.lib.autoplace_peak(inputs)
  return bobmods.lib.resource.autoplace_peak(inputs)
end

function bobmods.lib.add_autoplace_peak(inputs)
  bobmods.lib.resource.add_autoplace_peak(inputs)
end

function bobmods.lib.add_item_to_resource(resource, item)
  bobmods.lib.resource.add_result(resource, item)
end

function bobmods.lib.remove_item_from_resource(resource, item)
  bobmods.lib.resource.remove_result(resource, item)
end

function bobmods.lib.stage_counts(stages, mult)
  return bobmods.lib.resource.stage_counts(stages, mult)
end

function bobmods.lib.ore_sprite(inputs)
  return bobmods.lib.resource.sprite(inputs)
end

function bobmods.lib.create_ore_item(inputs)
  bobmods.lib.resource.create_item(inputs)
end

function bobmods.lib.create_ore_resource(inputs)
  bobmods.lib.resource.create(inputs)
end

function bobmods.lib.create_ore_particle(inputs)
  bobmods.lib.resource.create_particle(inputs)
end

function bobmods.lib.generate_ore_data_stage(inputs)
  bobmods.lib.resource.generate_data_stage(inputs)
end

function bobmods.lib.generate_ore_updates_stage(inputs)
  bobmods.lib.resource.generate_updates_stage(inputs)
end

function bobmods.lib.generate_ore(inputs)
  bobmods.lib.resource.generate(inputs)
end



function bobmods.lib.machine_has_category(machine, category_in)
  return bobmods.lib.machine.has_category(machine, category_in)
end

function bobmods.lib.machine_add_category(machine, category)
  bobmods.lib.machine.add_category(machine, category)
end

function bobmods.lib.machine_type_if_category_add_category(machine_type, category, category_to_add)
  bobmods.lib.machine.type_if_add_category(machine_type, category, category_to_add)
end



