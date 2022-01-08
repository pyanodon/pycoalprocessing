local table = require('__stdlib__/stdlib/utils/table')
local queue = require('__stdlib__/stdlib/misc/queue')

local pytech = {}

local start_tech_name = '__START__'
local fuel_fluid = 'fluid'
local fuel_electricity = 'electricity'
local fuel_heat = 'heat'
local recipe_boiler = 'boiler::'
local recipe_mining = 'mining::'
local recipe_offshore = 'offshore::'
local recipe_burnt = 'burnt-result::'
local recipe_rocket = 'rocket-launch::'
local crafting_generator = '__generator__'
local crafting_reactor = '__reactor__'
local crafting_launch = '__launch__'
local item_rocket_launch = '__launch__'

local l_recipe_result = '__recipe_result__'
local l_crafting_machine = '__crafting_machine__'
local l_fuel = '__fuel__'

local starting_entities = table.array_to_dictionary({'character', 'crash-site-assembling-machine-1-repaired', 'crash-site-lab-repaired'}, true)

pytech.fg = {} -- fuzzy graph
pytech.fluids = {}
pytech.placed_by = {}
pytech.mining_categories = {}
pytech.crafting_categories = {}
pytech.fuel_categories = {}
pytech.processed_items = {}
pytech.processed_recipes = {}
pytech.processed_internals = {}
pytech.fuel_burners = {}

local nt_item = 'item'
local nt_fluid = 'fluid'
local nt_recipe = 'recipe'
local nt_tech_head = 'tech-h'
local nt_tech_tail = 'tech-t'

function pytech.fg_get_node(name, type, label)
    local key = type .. '|' .. name
    local node = pytech.fg[key]

    if not node then
        node = {}
        node.type = type
        node.name = name
        node.key = key
        node.label = label
        node.parents = {}
        node.children = {}
        node.fz_parents = {}
        node.fz_children = {}
        pytech.fg[key] = node
    end

    return node
end


function pytech.fg_node_exists(name, type)
    local key = type .. '|' .. name
    return pytech.fg[key] ~= nil
end


function pytech.fg_add_link(parent, child)
    parent.children[child.key] = child
    child.parents[parent.key] = parent
end


function pytech.fg_remove_link(parent, child)
    parent.children[child.key] = nil
    child.parents[parent.key] = nil
end


function pytech.fg_add_fuzzy_link(parent, child, label)
    if not parent.fz_children[label] then
        parent.fz_children[label] = {}
    end

    parent.fz_children[label][child.key] = child

    if not child.fz_parents[label] then
        child.fz_parents[label] = {}
    end

    child.fz_parents[label][parent.key] = parent
end


function pytech.fg_remove_fuzzy_link(parent, child, label, remove_label)
    if remove_label then
        for _, p in pairs(child.fz_parents[label] or {}) do
            if p.key ~= parent.key then
                pytech.fg_remove_fuzzy_link(p, child, label, false)
            end
        end

        for _, c in pairs(parent.fz_children[label] or {}) do
            if c.key ~= child.key then
                pytech.fg_remove_fuzzy_link(parent, c, label, false)
            end
        end

        child.fz_parents[label] = nil
        parent.fz_children[label] = nil
    elseif child.fz_parents[label] then
        child.fz_parents[label][parent.key] = nil

        if table.is_empty(child.fz_parents[label]) then
            child.fz_parents[label] = nil
        end

        parent.fz_children[label][child.key] = nil

        if table.is_empty(parent.fz_children[label]) then
            parent.fz_children[label] = nil
        end
    end
end


function pytech.get_prototype(parent_type, prototype_name)
    local prototype

    for t, _ in pairs(defines.prototypes[parent_type]) do
        prototype = data.raw[t] and data.raw[t][prototype_name]

        if prototype then break end
    end

    if not prototype then
        log('ERROR: Prototype not found: ' .. parent_type .. ' / ' .. prototype_name)
    end

    return prototype
end


function pytech.standardize_products(products, product, item_name, count)
    local function standardize_product(p)
        return {
            type = p.type or 'item',
            name = p.name or p[1],
            amount = p.amount or p[2],
            probability = p.probability,
            amount_min = p.amount_min,
            amount_max = p.amount_max,
            catalyst_amount = p.catalyst_amount,
            temperature = p.temperature,
            min_temperature = p.minimum_temperature,
            max_temperature = p.maximum_temperature
        }
    end

    if not products then
        products = { product or { item_name, (count or 1) } }
    end

    local results = {}

    for _, p in pairs(products) do
        table.insert(results, standardize_product(p))
    end

    return results
end


function pytech.insert_double_lookup(tab, category, item)
    if not tab[category] then
        tab[category] = {}
    end
    tab[category][item] = true
end


function pytech.parse_tech(tech)
    -- log('Parsing tech: ' .. tech.name)
    local node = pytech.fg_get_node(tech.name, nt_tech_head, tech)

    -- Hard coded dependencies
    for _, dep in pairs(tech.dependencies or {}) do
        if data.raw.technology[dep] then
            local n_parent = pytech.fg_get_node(dep, nt_tech_tail)
            pytech.fg_add_link(n_parent, node)
        else
            error('\n\nInvalid tech dependency: ' .. dep .. '\nSource: ' .. tech.name .. '\n')
        end
        -- log('Adding dependency link ' .. n_parent.key .. ' to ' .. node.key)
    end

    local packs = {}
    -- Science packs
    for _, ing in pairs(pytech.standardize_products(tech.unit.ingredients)) do
        local item = pytech.get_prototype(nt_item, ing.name)
        local n_item = pytech.parse_item(item)
        pytech.fg_add_link(n_item, node)
        table.insert(packs, ing.name)
    end

    node.fz_parents[l_crafting_machine] = {}

    for _, lab in pairs(data.raw.lab) do
        local inputs = table.array_to_dictionary(lab.inputs)

        if table.all(packs, function(p) return inputs[p] end) then
            for item, _ in pairs(pytech.placed_by[lab.name]) do
                local item_node = pytech.fg_get_node(item, nt_item)
                pytech.fg_add_fuzzy_link(item_node, node, l_crafting_machine)
            end
        end
    end

    if table.is_empty(node.fz_parents[l_crafting_machine]) then
        error('\n\nNo suitable lab found to research tech: ' .. node.name .. '\n', 0)
    end

    -- Recipes
    for _, effect in pairs(tech.effects or {}) do
        if effect.type == 'unlock-recipe' then
            local recipe = data.raw.recipe[effect.recipe]

            if recipe then
                local n_recipe = pytech.parse_recipe(not recipe.ignore_for_dependencies and tech.name, recipe)

                if not recipe.ignore_for_dependencies then
                    pytech.fg_add_link(node, n_recipe)
                end
            end
        end
    end
end


function pytech.parse_recipe(tech_name, recipe)
    local name = (tech_name and (tech_name .. '::') or '') .. recipe.name
    -- log('Parsing recipe: ' .. name)
    local node = pytech.fg_get_node(name, nt_recipe, tech_name)
    node.factorio_name = recipe.name

    if pytech.processed_recipes[name] then
        return node
    else
       pytech.processed_recipes[name] = true
    end

    if recipe.normal then
        recipe = recipe.normal
    end

    for _, res in pairs(pytech.standardize_products(recipe.results, nil, recipe.result, recipe.result_count)) do
        if ((res.amount or 0) > 0 or (res.amount_max or 0) > 0) and (not res.probability or res.probability > 0) then
            if res.type == nt_item then
                local item = pytech.get_prototype(nt_item, res.name)
                local n_item = pytech.parse_item(item)
                pytech.fg_add_fuzzy_link(node, n_item, l_recipe_result)

                if item.place_result then
                    pytech.add_fuel_dependencies(node, item)
                    pytech.add_fixed_recipe(node, item)
                end

                if item.rocket_launch_products or item.rocket_launch_product then
                    pytech.add_rocket_product_recipe(item, tech_name)
                end
            else
                local fluid = data.raw.fluid[res.name]

                if fluid then
                    local n_fluid = pytech.parse_fluid(fluid, res.temperature)
                    pytech.fg_add_fuzzy_link(node, n_fluid, l_recipe_result)
                end
            end
        end
    end

    for _, ing in pairs(pytech.standardize_products(recipe.ingredients)) do
        if ing.type == nt_item then
            local item = pytech.get_prototype(nt_item, ing.name)
            local n_item = pytech.parse_item(item)
            pytech.fg_add_fuzzy_link(n_item, node, ing.name)
        else
            local fluid = data.raw.fluid[ing.name]

            if fluid then
                for temp, _ in pairs(pytech.fluids[ing.name]) do
                    if (not ing.temperature or ing.temperature == temp)
                        and (not ing.min_temperature or ing.min_temperature <= temp)
                        and (not ing.max_temperature or ing.max_temperature >= temp)
                    then
                        local n_fluid = pytech.parse_fluid(fluid, temp)
                        pytech.fg_add_fuzzy_link(n_fluid, node, ing.name)
                    end
                end
            end
        end
    end

    local category = recipe.category or 'crafting'

    if not pytech.crafting_categories[category] then
        log('ERROR: Missing crafting category: ' .. category .. ', for ' .. recipe.name)
    end

    if pytech.crafting_categories[category] and not pytech.crafting_categories[category][start_tech_name] then
        for crafter, _ in pairs(pytech.crafting_categories[category]) do
            pytech.add_crafting_machine_link(node, crafter)
        end
    end

    return node
end


function pytech.add_fuel_dependencies(child_node, item)
    -- log('add_fuel_dependencies (recipe_node: ' .. recipe_node.key .. ', item_node ' .. item_node.key)
    local entity = pytech.get_prototype('entity', item.place_result)
    local es = entity.burner or entity.energy_source

    if es then
        if es.type == 'burner' then
            for _, category in pairs(es.fuel_categories or { (es.fuel_category or 'chemical') }) do
                for fuel, _ in pairs(pytech.fuel_categories[category]) do
                    local fuel_node = pytech.fg_get_node(fuel, nt_item)
                    pytech.fg_add_fuzzy_link(fuel_node, child_node, l_fuel)
                    -- log('Adding fuel for recipe ' .. child_node.key .. ': ' .. fuel_node.key)
                end
            end
        elseif es.type == 'fluid' then
            for fluid, _ in pairs(pytech.fuel_categories[fuel_fluid]) do
                if not es.fluid_box.filter or fluid == es.fluid_box.filter then
                    for temp, _ in pairs(pytech.fluids[fluid]) do
                        local fuel_node = pytech.parse_fluid(nil, temp, fluid)
                        pytech.fg_add_fuzzy_link(fuel_node, child_node, l_fuel)
                        -- log('Adding fuel for recipe ' .. child_node.key .. ': ' .. fuel_node.key)
                    end
                end
            end
        end
    end
end


function pytech.add_fixed_recipe(recipe_node, item)
    local entity = pytech.get_prototype('entity', item.place_result)

    if entity.fixed_recipe and recipe_node.label then
        local fixed_recipe = data.raw.recipe[entity.fixed_recipe]
        local fixed_node = pytech.parse_recipe(recipe_node.label, fixed_recipe)
        local tech = pytech.fg_get_node(recipe_node.label, nt_tech_head)
        pytech.fg_add_link(tech, fixed_node)
    end
end


function pytech.parse_item(item)
    -- log('Parsing item: ' .. item.name)
    local node = pytech.fg_get_node(item.name, nt_item, item)

    -- if not pytech.processed_items[item.name] then
    --     pytech.processed_items[item.name] = true
    -- end

    return node
end


function pytech.parse_fluid(fluid, temperature, fluid_name)
    local name = (fluid and fluid.name or fluid_name) .. '(' .. (temperature or fluid.default_temperature) .. ')'
    -- log('Parsing fluid: ' .. name)
    local node = pytech.fg_get_node(name, nt_fluid, fluid)

    return node
end


function pytech.init_fluid_temperatures()
    for _, recipe in pairs(data.raw.recipe) do
        -- log ('Recipe: ' .. recipe.name .. ', normal: ' .. (recipe.normal and 'yes' or 'no'))
        local r = recipe.normal or recipe

        for _, res in pairs(pytech.standardize_products(r.results, nil, r.result, r.result_count)) do
            if res.type == 'fluid' and data.raw.fluid[res.name] then
                pytech.insert_double_lookup(pytech.fluids, res.name, res.temperature or data.raw.fluid[res.name].default_temperature)
            end
        end
    end

    for _, boiler in pairs(data.raw.boiler) do
        if (boiler.mode or 'heat-water-inside') == 'output-to-separate-pipe' then
            local filter = boiler.output_fluid_box.filter or boiler.fluid_box.filter

            if filter then
                pytech.insert_double_lookup(pytech.fluids, filter, boiler.target_temperature)
            else
                log('ERROR: Unsupported feature: Unfiltered boiler')
            end
        else
            log('ERROR: Unsupported feature: Old style boiler (heat-water-inside)')
        end
    end
end


function pytech.init_placeables()
    for it, _ in pairs(defines.prototypes['item']) do
        for _, item in pairs(data.raw[it]) do
            if item.place_result then
                pytech.insert_double_lookup(pytech.placed_by, item.place_result, item.name)
            end
        end
    end
end


function pytech.init_mining_categories()
    for _, entity in pairs(data.raw['mining-drill']) do
        for _, category in pairs(entity.resource_categories) do
            pytech.insert_double_lookup(pytech.mining_categories, category, entity.name)
        end
    end

    for _, category in pairs(data.raw.character.character.mining_categories or {}) do
        pytech.insert_double_lookup(pytech.mining_categories, category, 'character')
    end
end


function pytech.init_crafting_categories()
    for et, _ in pairs(defines.prototypes['entity']) do
        for _, entity in pairs(data.raw[et]) do
            if not table.any(entity.flags or {}, function(v) return v == 'hidden' end) then
                local entity_name = starting_entities[entity.name] and start_tech_name or entity.name

                for _, category in pairs(entity.crafting_categories or {}) do
                    pytech.insert_double_lookup(pytech.crafting_categories, category, entity_name)
                    -- TODO: Ingredient & fluidbox count
                end
            end
        end
    end
end


function pytech.init_fuel_categories()
    for it, _ in pairs(defines.prototypes['item']) do
        for _, item in pairs(data.raw[it]) do
            if item.fuel_category and item.fuel_value and util.parse_energy(item.fuel_value) > 0 and not table.any(item.flags or {}, function(v) return v == 'hidden' end) then
                -- log('Adding item ' .. item.name .. ' to fuel category ' .. item.fuel_category)
                pytech.insert_double_lookup(pytech.fuel_categories, item.fuel_category, item.name)
            end
        end
    end

    for _, fluid in pairs(data.raw.fluid) do
        if fluid.fuel_value and util.parse_energy(fluid.fuel_value) > 0 then
            pytech.insert_double_lookup(pytech.fuel_categories, fuel_fluid, fluid.name)
        end
    end
end


function pytech.init_fuel_burners()
    for et, _ in pairs(defines.prototypes['entity']) do
        for _, entity in pairs(data.raw[et]) do
            local es = entity.burner or entity.energy_source

            if es and (entity.burner or es.type == 'burner') and not table.any(entity.flags or {}, function(v) return v == 'hidden' end) then
                for _, category in pairs(es.fuel_categories or { (es.fuel_category or 'chemical') }) do
                    pytech.insert_double_lookup(pytech.fuel_burners, category, entity.name)
                    -- log('Adding burner ' .. entity.name .. ' for fuel category ' .. category)
                end
            end
        end
    end
end


function pytech.add_mining_recipe(entity)
    local recipe = {
        name = recipe_mining .. entity.name,
        ingredients = entity.minable.required_fluid and {{ type = 'fluid', name = entity.minable.required_fluid, amount = entity.minable.fluid_amount }} or {},
        results = entity.minable.results,
        result = entity.minable.result,
        result_count = entity.minable.count
    }

    local node = pytech.parse_recipe(nil, recipe)

    if entity.type == 'resource' then
        local category = entity.category or 'basic-solid'

        if not pytech.mining_categories[category] then
            log('ERROR: Missing mining category: ' .. category .. ', for ' .. entity.name)
        end

        if pytech.mining_categories[category] and not pytech.mining_categories[category]['character'] then
            for miner, _ in pairs(pytech.mining_categories[category]) do
                pytech.add_crafting_machine_link(node, miner)
            end
        end
    end

    return node
end


function pytech.add_boiler_recipe(boiler)
    if (boiler.mode or 'heat-water-inside') == 'output-to-separate-pipe' then
        local out_fluid = boiler.output_fluid_box.filter or boiler.fluid_box.filter
        local in_fluid = boiler.fluid_box.filter

        if out_fluid and in_fluid then
            local recipe = {
                name = recipe_boiler .. boiler.name,
                ingredients = {{ type = 'fluid', name = in_fluid, amount = 1, minimum_temperature = boiler.fluid_box.minimum_temperature, maximum_temperature = boiler.fluid_box.maximum_temperature }},
                results = {{ type = 'fluid', name = out_fluid, amount = 1, temperature = boiler.target_temperature }}
            }

            local node = pytech.parse_recipe(nil, recipe)
            pytech.add_crafting_machine_link(node, boiler.name)

            return node
        else
            log('ERROR: Unsupported feature: Unfiltered boiler')
        end
    else
        log('ERROR: Unsupported feature: Old style boiler (heat-water-inside)')
    end
end


function pytech.add_offhsore_pump_recipe(pump)
    local recipe = {
        name = recipe_offshore .. pump.name,
        ingredients = {},
        results = {{ type = 'fluid', name = pump.fluid, amount = pump.pumping_speed }}
    }

    local node = pytech.parse_recipe(nil, recipe)
    pytech.add_crafting_machine_link(node, pump.name)

    return node
end


function pytech.add_crafting_machine_link(recipe_node, entity_name)
    -- log ('Adding crafting entity: ' .. entity_name .. ' to recipe ' .. recipe_node.key)
    for item, _ in pairs(pytech.placed_by[entity_name] or {}) do
        local crafter_node = pytech.fg_get_node(item, nt_item)
        -- log ('Adding crafting machine: ' .. crafter_node.key .. ' to recipe ' .. recipe_node.key)
        pytech.fg_add_fuzzy_link(crafter_node, recipe_node, l_crafting_machine)
    end
end


function pytech.add_burnt_result_recipe(item)
    local recipe = {
        name = recipe_burnt .. item.name,
        ingredients = {{ type = nt_item, name = item.name, amount = 1 }},
        results = {{ type = nt_item, name = item.burnt_result, amount = 1 }}
    }

    local node = pytech.parse_recipe(nil, recipe)
    node.fz_parents[l_crafting_machine] = {}

    for entity, _ in pairs(pytech.fuel_burners[item.fuel_category]) do
        local burner = pytech.get_prototype('entity', entity)
        local es = burner.burner or burner.energy_source

        if es and (es.burnt_inventory_size or 0) > 0 then
            pytech.add_crafting_machine_link(node, entity)
        end
    end

    return node
end


function pytech.add_rocket_product_recipe(item, tech_name)
    -- log('add_rocket_product_recipe: ' .. item.name)
    local recipe = {
        name = recipe_rocket .. item.name,
        ingredients = {{ type = nt_item, name = item.name, amount = 1 }},
        results = item.rocket_launch_products or { item.rocket_launch_product }
    }

    local node = pytech.parse_recipe(tech_name, recipe)
    local tech_node = pytech.fg_get_node(tech_name, nt_tech_head)
    pytech.fg_add_link(tech_node, node)
    node.fz_parents[l_crafting_machine] = {}

    for _, entity in pairs(data.raw['rocket-silo']) do
        if (entity.rocket_result_inventory_size or 0) > 0 and entity.fixed_recipe then
            local rocket = data.raw['rocket-silo-rocket'][entity.rocket_entity]

            if rocket and rocket.inventory_size > 0 then
                pytech.add_crafting_machine_link(node, entity.name)
            end
        end
    end

    return node
end


function pytech.pre_process_techs()
    for _, tech in pairs(data.raw.technology) do
        if tech.enabled ~= false and not tech.hidden then
            local found = false

            for _, effect in pairs(tech.effects or {}) do
                if effect.type == 'unlock-recipe' then
                    found = true
                    break
                end
            end

            if not found then
                tech.dependencies = table.merge(tech.dependencies or {}, tech.prerequisites)
                tech.no_recipe = true
            end
        end
    end

    for _, tech in pairs(data.raw.technology) do
        if tech.enabled ~= false and not tech.hidden then
            for _, prereq in pairs(tech.prerequisites or {}) do
                if data.raw.technology[prereq] and data.raw.technology[prereq].no_recipe then
                    tech.dependencies = table.merge(tech.dependencies or {}, { prereq })
                    -- log('Adding dependency: ' .. prereq .. ' to ' .. tech.name)
                end
            end
        end
    end
end


function pytech.parse_data_raw()
    local start_node = pytech.fg_get_node(start_tech_name, nt_tech_head)

    -- Starter recipes
    for _, recipe in pairs(data.raw.recipe) do
        if (recipe.normal and recipe.normal.enabled ~= false) or (not recipe.normal and recipe.enabled ~= false) then
            local node = pytech.parse_recipe(nil, recipe)
            pytech.fg_add_link(start_node, node)
        end
    end

    -- Minables
    for et, _ in pairs(defines.prototypes['entity']) do
        for _, entity in pairs(data.raw[et]) do
            if entity.autoplace and entity.minable and (entity.minable.result or entity.minable.results) then
                local node = pytech.add_mining_recipe(entity)
                pytech.fg_add_link(start_node, node)
            end
        end
    end

    -- Boilers
    for _, entity in pairs(data.raw.boiler) do
        pytech.add_boiler_recipe(entity)
    end

    -- Offshore pumps
    for _, entity in pairs(data.raw['offshore-pump']) do
        pytech.add_offhsore_pump_recipe(entity)
    end

    -- Burnt result
    for it, _ in pairs(defines.prototypes[nt_item]) do
        for _, item in pairs(data.raw[it]) do
            if item.fuel_category and item.burnt_result then
                pytech.add_burnt_result_recipe(item)
            end
        end
    end

    pytech.pre_process_techs()

    for _, tech in pairs(data.raw.technology) do
        if tech.enabled ~= false and not tech.hidden then
            pytech.parse_tech(tech)
        end
    end
end


function pytech.update_internal_product(recipe, product, tech_name, add_to_tail)
    if add_to_tail then
        local tail_node = pytech.fg_get_node(recipe.label, nt_tech_tail)
        pytech.fg_add_fuzzy_link(tail_node, product, l_recipe_result)
    end

    -- local found = false

    -- for _, cc_child in pairs(product.fz_children) do
    --     if cc_child.node.label == tech_name then
    --         found = true
    --         break
    --     end
    -- end

    -- if not found then
    --     return
    -- end

    local internal_node = pytech.fg_get_node(recipe.label .. '::' .. product.name, product.type, product.label)

    pytech.fg_remove_fuzzy_link(recipe, product, l_recipe_result)
    pytech.fg_add_fuzzy_link(recipe, internal_node, l_recipe_result)

    if pytech.processed_internals[internal_node.key] then
        return
    else
        pytech.processed_internals[internal_node.key] = true
    end

    -- log('Internal node: ' .. recipe.label .. '::' .. product.name .. (add_to_tail and ' +tail' or ' -tail'))
    for label, children in pairs(product.fz_children) do
        for _, child in pairs(children) do
            if child.label == tech_name or not child.label then
                local child_node

                if not child.label then
                    for c_label, c_children in pairs(child.fz_children) do
                        for _, c_child in pairs(c_children) do
                            local found = false
                            for _, cc_children in pairs(c_child.fz_children) do
                                for _, cc_child in pairs(cc_children) do
                                    if cc_child.label == tech_name then
                                        found = true
                                        break
                                    end
                                end
                            end

                            if found then
                                child_node = pytech.fg_get_node(tech_name .. '::' .. child.name, child.type, tech_name)

                                for p_label, parents in pairs(child.fz_parents) do
                                    for _, parent in pairs(parents) do
                                        pytech.fg_add_fuzzy_link(parent, child_node, p_label)
                                    end
                                end

                                pytech.fg_add_fuzzy_link(child_node, c_child, c_label)
                                pytech.update_internal_product(child_node, c_child, tech_name, false)
                            end
                        end
                    end
                else
                    child_node = child
                end

                if child_node then
                    pytech.fg_add_fuzzy_link(internal_node, child_node, label)
                end
            end
        end
    end
end


function pytech.pre_process_fuzzy_graph()
    -- log('Add tech tail nodes')
    for _, node in pairs(pytech.fg) do
        if node.type == nt_tech_head and node.name ~= start_tech_name then
            -- Add tail nodes for technology nodes
            local tail_node = pytech.fg_get_node(node.name, nt_tech_tail)

            for _, recipe_node in pairs(node.children) do
                pytech.fg_add_link(recipe_node, tail_node)
            end

            pytech.fg_add_link(node, tail_node)
        end
    end

    -- log('Add internal products')
    local product_nodes = {}
    for _, node in pairs(pytech.fg) do
        if node.type == nt_item or node.type == nt_fluid then
            table.insert(product_nodes, node)
        end
    end

    for _, node in pairs(product_nodes) do
        -- log('Pre-processing: ' .. node.name)
        -- Publish recipe results to be dependent on the tech tail node instead
        -- Create an internal copy of the product node to be used internally by other recipes in the same tech or anonymous recipes (barreling, etc)
        local parents = table.merge({}, node.fz_parents[l_recipe_result])

        for _, recipe in pairs(parents) do
            if recipe.type == nt_recipe and recipe.label then
                pytech.update_internal_product(recipe, node, recipe.label, true)
            end
        end
    end
end


function pytech.topological_sort()
    -- log('============== TOPOLOGICAL SORT ==============')

    -- log('Add incoming set')
    for _, node in pairs(pytech.fg) do
        node.incoming = {}

        for key, parent in pairs(node.parents) do
            node.incoming[key] = { parent }
        end

        for label, parents in pairs(node.fz_parents) do
            node.incoming[label] = table.merge({}, parents)
        end
    end

    local sorted_set = {}
    local starting_set = {}
    starting_set[start_tech_name] = pytech.fg_get_node(start_tech_name, nt_tech_head)
    local level = 1
    local found_error = false
    local run_loop = true

    while run_loop do
        while not table.is_empty(starting_set) do
            local current_set = {}

            for key, node in pairs(starting_set) do
                current_set[key] = node
            end

            for key, node in pairs(current_set) do
                -- log(level .. ' - ' .. node.key)
                starting_set[key] = nil
                node.level = level
                sorted_set[node.key] = node

                local fz_children = {}
                for c_label, children in pairs(node.fz_children) do
                    fz_children[c_label] = {}
                    for child_key, child in pairs(children) do
                        fz_children[c_label][child_key] = child
                    end
                end

                for c_label, children in pairs(fz_children) do
                    for _, child in pairs(children) do
                        -- Current node is the earliest of the fuzzy dependencies, change fuzzy link to hard link
                        pytech.fg_remove_fuzzy_link(node, child, c_label, true)
                        pytech.fg_add_link(node, child)
                        child.incoming[c_label] = nil
                        child.incoming[node.key] = node
                    end
                end

                for _, child in pairs(node.children) do
                    child.incoming[node.key] = nil

                    if not sorted_set[child.key] and table.is_empty(child.incoming) then
                        -- log(child.key .. ': EMPTY')
                        starting_set[child.key] = child
                    else
                        -- log(child.key .. ': NOT EMPTY')
                        -- for ikey, inode in pairs(child.incoming) do
                        --     log(' - ' .. ikey)
                        -- end
                    end
                end
            end

            level = level + 1
        end

        run_loop = false

        if table_size(sorted_set) < table_size(pytech.fg) then
            found_error = true
        end

        --     -- local q = queue()
        --     -- local marked = {}
        --     -- q(start_tech_name)
        --     -- marked[start_tech_name] = true

        --     -- while not queue.is_empty(q) do
        --     --     local n = q()

        --     --     for _, node in pairs(n.children or {}) do
        --     --         if not marked[node.key] then
        --     --             marked[node.key] = true
        --     --             q(node)
        --     --         end
        --     --     end
        --     -- end

        --     for _, node in pairs(pytech.fg) do
        --         if not sorted_set[node.key] and node.type == nt_recipe and node.label --[[ and table_size(node.incoming) == 1 ]] then
        --             for key, _ in pairs(node.incoming) do
        --                 log('Stashing ' .. node.key .. ' with incoming ' .. key)
        --             end
        --             node.incoming = {}
        --             starting_set[node.key] = node
        --             run_loop = true
        --             break
        --         end
        --     end

        -- -- elseif not table.is_empty(stashed_links) then
        -- --     for key, inc in pairs(stashed_links) do
        -- --         local node = pytech.fg[key]
        -- --         node.incoming = inc
        -- --         sorted_set[key] = nil
        -- --         for key, value in pairs(t) do

        -- --         end
        -- --         starting_set[key] = node
        -- --         log('Unstashing ' .. node.key)
        -- --     end
        -- end
    end

    for _, node in pairs(pytech.fg) do
        if not sorted_set[node.key] then
            log('ERROR: Unprocessed node: ' .. node.key)
        end
    end

    log('Sorted nodes: ' .. table_size(sorted_set))

    if found_error then
        pytech.find_dependency_loop()
    end
end


function pytech.find_dependency_loop()
    log('START find_dependency_loop')

    local graph = {}

    for key, node in pairs(pytech.fg) do
        graph[key] = node
    end

    log('size: ' .. table_size(graph))

    local change = true

    while change do
        change = false

        local graph2 = table.merge({}, graph)
        for key, node in pairs(graph2) do
            if table.is_empty(node.children) and table.is_empty(node.fz_children) then
                local parents = table.merge({}, node.parents)
                for _, p in pairs(parents) do
                    pytech.fg_remove_link(p, node)
                end

                parents = table.merge({}, node.fz_parents)
                for label, pp in pairs(parents) do
                    for _, p in pairs(pp) do
                        pytech.fg_remove_fuzzy_link(p, node, label, true)
                        break
                    end
                end

                graph[key] = nil
                change = true
            elseif table.is_empty(node.parents) and table.is_empty(node.fz_parents) then
                local children = table.merge({}, node.children)
                for _, c in pairs(children) do
                    pytech.fg_remove_link(node, c)
                end

                children = table.merge({}, node.fz_children)
                for label, cc in pairs(children) do
                    for _, c in pairs(cc) do
                        pytech.fg_remove_fuzzy_link(node, c, label)
                    end
                end

                graph[key] = nil
                change = true
            end
        end
    end

    log('size: ' .. table_size(graph))

    local length = table_size(graph) + 1
    local path

    for _, node in pairs(graph) do
        if node.type == nt_recipe then
            for _, child in pairs(node.children) do
                local l = pytech.find_shortest_path(node, child)
                if l and queue.size(l) < length then
                    length = queue.size(l)
                    path = l
                    log('Shortest parh: ' .. node.key .. ' to ' .. child.key .. ' / ' .. length)
                end
            end
        end
    end

    if path then
        log('Found loop : ' )
        local msg = '\n\nDependency loop detected: '
        for _, key in queue.rpairs(path) do
            msg = msg .. pytech.log_node(key)
        end
        msg = msg .. pytech.log_node(queue.peek_last(path)) .. '\n'
        error(msg)
    end

    log('END find_dependency_loop')
end


function pytech.log_node(key)
    local node = pytech.fg[key]
    if node.type == nt_tech_tail then
        return '\n  - Technology: ' .. node.name
    elseif node.type == nt_recipe then
        return '\n  - Recipe: ' .. node.factorio_name
    elseif node.type == nt_item then
        return '\n  - Item: ' .. node.name
    elseif node.type == nt_fluid then
        return '\n  - Fluid: ' .. node.name
    else return ''
    end
end


function pytech.find_shortest_path(start_node, target_node)
    local q = queue()
    local marked = {}
    local dist = {}
    local edgeTo = {}

    marked[start_node.key] = true
    dist[start_node.key] = 0
    q(start_node)

    while(not queue.is_empty(q)) do
        local n = q()

        for key, p in pairs(n.parents) do
            if not marked[key] then
                edgeTo[key] = n.key
                dist[key] = dist[n.key] + 1

                if key == target_node.key then
                    local path = queue()
                    local x = key

                    while dist[x] ~= 0 do
                        path(x)
                        x = edgeTo[x]
                    end
                    path(x)

                    return path
                else
                    marked[key] = true
                    q(p)
                end
            end
        end
    end
end


function pytech.is_node_reachable(start_node, target_node, marked)
    local m = marked and table.merge({}, marked) or {}
    m[start_node.key] = true

    local parents = table.merge({}, start_node.parents)

    for _, p in pairs(start_node.fz_parents) do
        parents = table.merge(parents, p)
    end

    for key, p in pairs(parents) do
        if not m[key] then
            if key == target_node.key then
                return true
            else
                m[key] = true
                if  pytech.is_node_reachable(p, target_node, m) then
                    return true
                end
            end
        end
    end
end


function pytech.find_tech_prerequisites(node)
    local prerequisites = {}
    local current_set = { node }

    while not table.is_empty(current_set) do
        local next_set = {}

        for _, c_node in pairs(current_set) do
            for _, p_node in pairs(c_node.parents) do
                if p_node.type == nt_tech_tail then
                    prerequisites[p_node.name] = true
                -- elseif p_node.type == nt_recipe and p_node.label and p_node.label ~= node.name then
                --     prerequisites[p_node.label] = true
                --     log('Adding prereq from recipe ' .. p_node.label .. ' (' .. p_node.name .. ') ' .. ' > ' .. node.name .. ' (' .. c_node.name .. ')')
                else
                    next_set[p_node.key] = p_node
                end
            end
        end

        current_set = next_set
    end

    return table.keys(prerequisites)
end


function pytech.extract_prerequisites()
    for _, tech in pairs(data.raw.technology) do
        if pytech.fg_node_exists(tech.name, nt_tech_tail) then
            local node = pytech.fg_get_node(tech.name, nt_tech_tail)
            tech.prerequisites = pytech.find_tech_prerequisites(node)
        end
    end
end


function pytech.transitive_reduction(tech)
    if not pytech.tr_visited[tech.name] then
        pytech.tr_visited[tech.name] = true
        local indirect = {}
        local parents = table.array_to_dictionary(tech.prerequisites or {}, true)

        for p, _ in pairs(parents) do
            local parent = data.raw.technology[p]
            pytech.transitive_reduction(parent)
            indirect = table.merge(indirect, parent.closure)
        end

        tech.closure = table.merge({}, indirect)
        local parents2 = table.merge({}, parents)

        for p, _ in pairs(parents2) do
            tech.closure[p] = true

            if indirect[p] then
                parents[p] = nil
            end
        end

        tech.prerequisites = table.keys(parents)
    end
end


function pytech.calculate_prerequisites()
    -- log(serpent.block(pytech.fg_get_node('advanced-circuit', nt_item), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('energy-2::gasturbinemk02', nt_recipe), {maxlevel =3, keyignore = {data = true} }))
    log('Nodes: ' .. table_size(pytech.fg))

    pytech.pre_process_fuzzy_graph()

    -- log(serpent.block(pytech.fg_get_node('advanced-circuit', nt_item), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('energy-2::gasturbinemk02', nt_recipe), {maxlevel =3, keyignore = {data = true} }))
    log('Nodes: ' .. table_size(pytech.fg))

    pytech.topological_sort()

    -- log(serpent.block(pytech.fg_get_node('speed-module-3', nt_tech_head), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('speed-module-3', nt_tech_tail), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('advanced-circuit', nt_item), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('energy-2::gasturbinemk02', nt_recipe), {maxlevel =3, keyignore = {data = true} }))

    pytech.extract_prerequisites()

    -- log(serpent.block(data.raw.technology['speed-module-3'], { maxlevel =3 }))

    pytech.tr_visited = {}

    for _, tech in pairs(data.raw.technology) do
        pytech.transitive_reduction(tech)
    end
end


function pytech.cleanup()
    for _, recipe in pairs(data.raw.recipe) do
        recipe.ignore_for_dependencies = nil
    end
    for _, tech in pairs(data.raw.technology) do
        tech.closure = nil
        tech.dependencies = nil
        tech.no_recipe = nil
    end
end


function pytech.init()
    pytech.init_fluid_temperatures()
    pytech.init_placeables()
    pytech.init_mining_categories()
    pytech.init_crafting_categories()
    pytech.init_fuel_categories()
    pytech.init_fuel_burners()
end

-------------------------------------------------------------------------------
pytech.init()
pytech.parse_data_raw()
pytech.calculate_prerequisites()
pytech.cleanup()

--TODO: electricity
--TODO: heat
--TODO: rails - locos, wagons, stops need rails, signals need stops
--TODO: equipment need armor/vehicle with grid, equipment power, roboport-equipment needs robots
--TODO: bonuses need entities to apply to
--TODO: logistic system needs logi bots
--TODO: robots needs roboports

