local table = require('__stdlib__/stdlib/utils/table')
local queue = require('__stdlib__/stdlib/misc/queue')
local string = require('__stdlib__/stdlib/utils/string')
-- require('defines')

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
local recipe_generator = 'generator::'
local recipe_reactor = 'reactor::'

local l_recipe_result = '__recipe_result__'
local l_crafting_machine = '__crafting_machine__'
local l_fuel = '__fuel__'
local l_rail = '__rail__'
local l_loco = '__loco__'
local l_trainstop = '__trainstop__'
local l_grid = '__grid__'
local l_bonus = '__bonus__'
local l_module = '__module__'

local starting_entities = table.array_to_dictionary({'character', 'crash-site-assembling-machine-1-repaired', 'crash-site-lab-repaired'}, true)
local electricity_producers = table.array_to_dictionary({'generator', 'burner-generator', 'electric-energy-interface', 'solar-panel'}, true)
local py_graphics_mods = table.array_to_dictionary({'__pyalienlifegraphics__', '__pyalienlifegraphics2__', '__pyalienlifegraphics3__',
    '__pyalternativeenergygraphics__', '__pycoalprocessinggraphics__', '__pyfusionenergygraphics__', '__pyhightechgraphics__', '__pyindustry__',
    '__pypetroleumhandlinggraphics__', '__pyraworesgraphics__'})

pytech.fg = {} -- fuzzy graph
pytech.processed_recipes = {}
pytech.processed_internals = {}
pytech.processed_items = {}
pytech.tech_used_recipes = {}
pytech.exclude_from_path = {}
pytech.safe_path = {}
pytech.science_packs = {}
pytech.sp_excl = {}

local nt_item = 'item'
local nt_fluid = 'fluid'
local nt_recipe = 'recipe'
local nt_tech_head = 'tech-h'
local nt_tech_tail = 'tech-t'

function pytech.fg_get_node(name, type, label, factorio_name)
    local key = type .. '|' .. name
    local node = pytech.fg[key]

    if not node then
        node = {}
        node.type = type
        node.name = name
        node.key = key
        node.label = label
        node.factorio_name = factorio_name
        node.parents = {}
        node.children = {}
        node.fz_parents = {}
        node.fz_children = {}
        pytech.fg[key] = node
    else
        if not node.label then
            node.label = label
        end

        if not node.factorio_name then
            node.factorio_name = factorio_name
        end
    end

    -- if name == 'u-waste(10)' and type == nt_fluid then
    --     log(debug.traceback())
    -- end

    return node
end


function pytech.clone_graph(g1)
    local g2 = {}

    for k, v in pairs(g1) do
        local node = {}

        for key, value in pairs(v) do
            if type(value) ~= "table" then
                node[key] = value
            end
        end

        node.parents = {}
        node.children = {}
        node.fz_parents = {}
        node.fz_children = {}

        if v.incoming then
            node.incoming = table.deep_copy(v.incoming)
        end

        g2[k] = node
    end

    for k, v in pairs(g1) do
        local node = g2[k]

        for pk, _ in pairs(v.parents) do
            node.parents[pk] = g2[pk]
        end

        for ck, _ in pairs(v.children) do
            node.children[ck] = g2[ck]
        end

        for label, parents in pairs(v.fz_parents) do
            node.fz_parents[label] = {}

            for pk, _ in pairs(parents) do
                node.fz_parents[label][pk] = g2[pk]
            end
        end

        for label, children in pairs(v.fz_children) do
            node.fz_children[label] = {}

            for ck, _ in pairs(children) do
                node.fz_children[label][ck] = g2[ck]
            end
        end

        if v.main_node then
            node.main_node = g2[v.main_node.key]
        end
    end

    return g2
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


function pytech.fg_remove_node(node)
    for _, p in pairs(node.parents) do
        pytech.fg_remove_link(p, node)
    end

    for _, c in pairs(node.children) do
        pytech.fg_remove_link(node, c)
    end

    for l, parents in pairs(node.fz_parents) do
        for _, p in pairs(parents) do
            pytech.fg_remove_fuzzy_link(p, node, l)
        end
    end

    for l, children in pairs(node.fz_children) do
        for _, c in pairs(children) do
            pytech.fg_remove_fuzzy_link(node, c, l)
        end
    end

    pytech.fg[node.key] = nil
end


function pytech.get_prototype(parent_type, prototype_name, no_error)
    local prototype

    for t, _ in pairs(defines.prototypes[parent_type]) do
        prototype = data.raw[t] and data.raw[t][prototype_name]

        if prototype then break end
    end

    if not prototype and not no_error then
        error('\n\nERROR: Prototype not found: ' .. parent_type .. ' / ' .. prototype_name .. '\n', 0)
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


function pytech.is_py_or_base_tech(tech)
    -- log('is_py_or_base_tech: ' .. tech.name)
    local icons = tech.icons
    if not icons then icons = {{ icon = tech.icon }} end

    for _, icon in pairs(icons or {}) do
        local mod = icon and table.first(string.split(icon.icon, '/'))

        if not py_graphics_mods[mod] and mod ~= '__base__' and mod ~= '__core__' then
            return false
        end
    end

    return true
end


function pytech.parse_tech(tech)
    -- log('Parsing tech: ' .. tech.name)
    local node = pytech.fg_get_node(tech.name, nt_tech_head, tech, tech.name)

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
        pytech.insert_double_lookup(pytech.science_packs, ing.name, tech.name)
    end

    node.fz_parents[l_crafting_machine] = {}

    for _, lab in pairs(data.raw.lab) do
        local inputs = table.array_to_dictionary(lab.inputs)

        if table.all(packs, function(p) return inputs[p] end) then
            for item, _ in pairs(pytech.placed_by[lab.name] or {}) do
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
        -- Bonuses require at least on entity where they can be applied
        elseif effect.type == 'inserter-stack-size-bonus' then
            pytech.add_bonus_dependencies(node, effect, 'inserter', function(e) return not e.stack end)
        elseif effect.type == 'stack-inserter-capacity-bonus' then
            pytech.add_bonus_dependencies(node, effect, 'inserter', function(e) return e.stack end)
        elseif effect.type == 'laboratory-speed' or effect.type == 'laboratory-productivity' then
            pytech.add_bonus_dependencies(node, effect, 'lab')
        elseif effect.type == 'mining-drill-productivity-bonus' then
            pytech.add_bonus_dependencies(node, effect, 'mining-drill')
        elseif effect.type == 'train-braking-force-bonus' then
            pytech.add_bonus_dependencies(node, effect, 'locomotive')
        elseif effect.type == 'maximum-following-robots-count' or effect.type == 'follower-robot-lifetime' then
            pytech.add_bonus_dependencies(node, effect, 'combat-robot', function(e) return e.follows_player end)
        elseif effect.type == 'worker-robot-speed' or effect.type == 'worker-robot-storage' or effect.type == 'worker-robot-battery' then
            pytech.add_bonus_dependencies(node, effect, 'construction-robot')
            pytech.add_bonus_dependencies(node, effect, 'logistic-robot')
        elseif effect.type == 'character-logistic-requests' or effect.type == 'character-logistic-trash-slots' then
            pytech.add_bonus_dependencies(node, effect, 'logistic-robot')
        elseif effect.type == 'artillery-range' then
            pytech.add_bonus_dependencies(node, effect, 'artillery-turret')
            pytech.add_bonus_dependencies(node, effect, 'artillery-wagon')
        elseif effect.type == 'turret-attack' then
            pytech.add_bonus_dependencies(node, effect, 'ammo-turret', function(e) return e.name == effect.turret_id end, false, effect.turret_id)
            pytech.add_bonus_dependencies(node, effect, 'electric-turret', function(e) return e.name == effect.turret_id end, false, effect.turret_id)
            pytech.add_bonus_dependencies(node, effect, 'fluid-turret', function(e) return e.name == effect.turret_id end, false, effect.turret_id)
        elseif effect.type == 'ammo-damage' or effect.type == 'gun-speed' then
            pytech.add_bonus_dependencies(node, effect, 'ammo', function (i) return
                (i.ammo_type.category and i.ammo_type.category == effect.ammo_category)
                or not i.ammo_type.category and table.any(i.ammo_type, function (at) return at.category == effect.ammo_category end)
            end, true, effect.ammo_category)
            pytech.add_bonus_dependencies(node, effect, 'capsule', function (i) return
                i.capsule_action.attack_parameters and
                ((i.capsule_action.attack_parameters.ammo_type.category and i.capsule_action.attack_parameters.ammo_type.category == effect.ammo_category)
                or not i.capsule_action.attack_parameters.ammo_type.category and table.any(i.capsule_action.attack_parameters.ammo_type, function (at) return at.category == effect.ammo_category end))
            end, true, effect.ammo_category)
            pytech.add_bonus_dependencies(node, effect, 'electric-turret', function (e) return
                (e.attack_parameters.ammo_type.category and e.attack_parameters.ammo_type.category == effect.ammo_category)
                or not e.attack_parameters.ammo_type.category and table.any(e.attack_parameters.ammo_type, function (at) return at.category == effect.ammo_category end)
            end, false, effect.ammo_category)
            pytech.add_bonus_dependencies(node, effect, 'land-mine', function (e) return ((e.ammo_category or '') == effect.ammo_category) end, false, effect.ammo_category)
        end
    end
end


function pytech.add_bonus_dependencies(n_tech, effect, entity_type, condition, is_item, suffix)
    local recipe = { name = effect.type .. (suffix or ''), ingredients = {}, results = {} }
    local n_recipe = pytech.parse_recipe(n_tech.name, recipe, true)
    n_recipe.virtual = true
    pytech.fg_add_link(n_tech, n_recipe)

    if entity_type then
        for _, entity in pairs(data.raw[entity_type] or {}) do
            if condition == nil or condition(entity) then
                if not is_item and pytech.entities[entity.name] then
                    for i, _ in pairs(pytech.placed_by[entity.name]) do
                        local item = pytech.fg_get_node(i, nt_item)
                        pytech.fg_add_fuzzy_link(item, n_recipe, l_bonus)
                    end
                elseif pytech.items[entity.name] then
                    local item = pytech.fg_get_node(entity.name, nt_item)
                    pytech.fg_add_fuzzy_link(item, n_recipe, l_bonus)
                end
            end
        end
    end
end


function pytech.add_entity_dependencies(n_recipe, item)
    local entity = pytech.get_prototype('entity', item.place_result)

    -- Rail stuff need rails
    if entity.type == 'locomotive'
        or entity.type == 'cargo-wagon'
        or entity.type == 'fluid-wagon'
        or entity.type == 'artillery-wagon'
        or entity.type == 'train-stop'
        or entity.type == 'rail-signal'
        or entity.type == 'rail-chain-signal'
    then
        n_recipe.fz_parents[l_rail] = {}

        for i, _ in pairs(data.raw['rail-planner'] or {}) do
            if pytech.items[i] then
                local r = pytech.fg_get_node(i, nt_item)
                pytech.fg_add_fuzzy_link(r, n_recipe, l_rail)
            end
        end
    end

    -- Wagons need loco
    if entity.type == 'cargo-wagon' or entity.type == 'fluid-wagon' or entity.type == 'artillery-wagon' then
        n_recipe.fz_parents[l_loco] = {}

        for loco, _ in pairs(data.raw.locomotive or {}) do
            if pytech.entities[loco] then
                for i, _ in pairs(pytech.placed_by[loco] or {}) do
                    local l = pytech.fg_get_node(i, nt_item)
                    pytech.fg_add_fuzzy_link(l, n_recipe, l_loco)
                end
            end
        end
    end

    -- Signals need stations
    if entity.type == 'rail-signal' or entity.type == 'rail-chain-signal' then
        n_recipe.fz_parents[l_trainstop] = {}

        for ts, _ in pairs(data.raw['train-stop'] or {}) do
            if pytech.entities[ts] then
                for i, _ in pairs(pytech.placed_by[ts] or {}) do
                    local l = pytech.fg_get_node(i, nt_item)
                    pytech.fg_add_fuzzy_link(l, n_recipe, l_trainstop)
                end
            end
        end
    end
end


function pytech.add_equipment_dependencies(n_recipe, item)
    -- log('equipment: ' .. item.name .. ', result: ' .. item.placed_as_equipment_result)
    local equipment = pytech.get_prototype('equipment', item.placed_as_equipment_result)
    local eq_cat = table.array_to_dictionary(equipment.categories, true)
    n_recipe.fz_parents[l_grid] = {}

    for i, grid in pairs(pytech.items_with_grid or {}) do
        if table.any(grid.equipment_categories, function (c) return eq_cat[c] ~= nil end) then
            local g = pytech.fg_get_node(i, nt_item)
            pytech.fg_add_fuzzy_link(g, n_recipe, l_grid)
        end
    end

    for e, grid in pairs(pytech.entities_with_grid or {}) do
        if table.any(grid.equipment_categories, function (c) return eq_cat[c] ~= nil end) then
            for i, _ in pairs(pytech.placed_by[e] or {}) do
                local g = pytech.fg_get_node(i, nt_item)
                pytech.fg_add_fuzzy_link(g, n_recipe, l_grid)
            end
        end
    end

    if equipment.burner then
        local es = equipment.burner

        for _, category in pairs(es.fuel_categories or { (es.fuel_category or 'chemical') }) do
            for fuel, _ in pairs(pytech.fuel_categories[category]) do
                local fuel_node = pytech.fg_get_node(fuel, nt_item)
                pytech.fg_add_fuzzy_link(fuel_node, n_recipe, l_fuel)
            end
        end
    end

    if (equipment.type == 'active-defense-equipment' and equipment.attack_parameters.ammo_type and equipment.attack_parameters.ammo_type.energy_consumption and util.parse_energy(equipment.attack_parameters.ammo_type.energy_consumption) > 0)
        or equipment.type == 'battery-equipment'
        or (equipment.type == 'belt-immunity-equipment' and util.parse_energy(equipment.energy_consumption) > 0)
        or (equipment.type == 'energy-shield-equipment' and util.parse_energy(equipment.energy_per_shield) > 0)
        or (equipment.type == 'movement-bonus-equipment' and util.parse_energy(equipment.energy_consumption) > 0)
        or (equipment.type == 'night-vision-equipment' and util.parse_energy(equipment.energy_input) > 0)
        or (equipment.type == 'roboport-equipment' and not equipment.burner)
    then
        for _, gen in pairs(data.raw['generator-equipment']) do
            if table.any(gen.categories, function (c) return eq_cat[c] ~= nil end) then
                for i, _ in pairs(pytech.placed_by[gen.name] or {}) do
                    local g = pytech.fg_get_node(i, nt_item)
                    pytech.fg_add_fuzzy_link(g, n_recipe, l_fuel)
                end
            end
        end

        for _, gen in pairs(data.raw['solar-panel-equipment']) do
            if table.any(gen.categories, function (c) return eq_cat[c] ~= nil end) then
                for i, _ in pairs(pytech.placed_by[gen.name] or {}) do
                    local g = pytech.fg_get_node(i, nt_item)
                    pytech.fg_add_fuzzy_link(g, n_recipe, l_fuel)
                end
            end
        end
    end
end


function pytech.parse_recipe(tech_name, recipe, no_crafting)
    local name = (tech_name and (tech_name .. ' / ') or '') .. recipe.name
    -- log('Parsing recipe: ' .. name)
    local node = pytech.fg_get_node(name, nt_recipe, tech_name, recipe.name)

    if pytech.processed_recipes[name] then
        return node
    else
       pytech.processed_recipes[name] = true
    end

    local ing_count = 0
    local fluid_in = 0
    local fluid_out = 0

    node.ignore_for_dependencies = recipe.ignore_for_dependencies

    if recipe.normal then
        recipe = recipe.normal
    end

    for _, res in pairs(pytech.standardize_products(recipe.results, nil, recipe.result, recipe.result_count)) do
        if ((res.amount or 0) > 0 or (res.amount_max or 0) > 0) and (not res.probability or res.probability > 0) then
            if res.type == nt_item then
                local n_item = pytech.fg_get_node(res.name, nt_item)
                local item

                if not n_item.virtual then
                    item = pytech.get_prototype(nt_item, res.name)
                    n_item = pytech.parse_item(item)
                end

                pytech.fg_add_fuzzy_link(node, n_item, l_recipe_result)

                if item and item.place_result then
                    pytech.add_fuel_dependencies(node, item)
                    pytech.add_fixed_recipe(node, item)
                    pytech.add_entity_dependencies(node, item)
                end

                if item and item.placed_as_equipment_result then
                    pytech.add_equipment_dependencies(node, item)
                end

                if item and (item.rocket_launch_products or item.rocket_launch_product) then
                    pytech.add_rocket_product_recipe(item, tech_name)
                end

                if node.ignore_for_dependencies and n_item.ignore_for_dependencies == nil then
                    n_item.ignore_for_dependencies = true
                elseif not node.ignore_for_dependencies and n_item.ignore_for_dependencies then
                    n_item.ignore_for_dependencies = false
                end
            else
                local fluid = data.raw.fluid[res.name]
                local n_fluid

                if fluid then
                    n_fluid = pytech.parse_fluid(fluid, res.temperature)
                elseif res.temperature and pytech.fg_node_exists(res.name .. '(' .. res.temperature .. ')', nt_fluid) then
                    n_fluid = pytech.parse_fluid(nil, res.temperature, res.name)
                end

                if n_fluid then
                    pytech.fg_add_fuzzy_link(node, n_fluid, l_recipe_result)

                    if not n_fluid.virtual then
                        fluid_out = fluid_out + 1
                    end
                end

                if node.ignore_for_dependencies and n_fluid.ignore_for_dependencies == nil then
                    n_fluid.ignore_for_dependencies = true
                elseif not node.ignore_for_dependencies and n_fluid.ignore_for_dependencies then
                    n_fluid.ignore_for_dependencies = false
                end
            end
        end
    end

    for _, ing in pairs(pytech.standardize_products(recipe.ingredients)) do
        if ing.type == nt_item then
            local item = pytech.get_prototype(nt_item, ing.name)
            local n_item = pytech.parse_item(item)
            pytech.fg_add_fuzzy_link(n_item, node, ing.name)
            ing_count = ing_count + 1
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

            fluid_in = fluid_in + 1
        end
    end

    if not no_crafting then
        local category = recipe.category or 'crafting'
        local found = false

        if pytech.crafting_categories[category] then
            for _, craft in pairs(pytech.crafting_categories[category]) do
                if craft.ingredient_count >= ing_count and craft.fluidboxes_in >= fluid_in and craft.fluidboxes_out >= fluid_out then
                    pytech.add_crafting_machine_link(node, craft.entity_name)
                    found = true
                end
            end
        end

        if not found and not recipe.ignore_for_dependencies then
            error('\n\nERROR: Missing crafting category: ' .. category .. ' (ingredients: ' .. ing_count .. ', fluids in: ' .. fluid_in .. ', fluids out:' .. fluid_out .. '), for ' .. name .. '\n', 0)
        end
    end

    pytech.add_module_dependencies(node, recipe)

    return node
end


function pytech.add_fuel_dependencies(child_node, item)
    -- log('add_fuel_dependencies (recipe_node: ' .. child_node.key .. ', item: ' .. item.name)
    local entity = pytech.get_prototype('entity', item.place_result)
    local es = entity.burner or entity.energy_source

    if es then
        if es.type == 'burner' then
            child_node.fz_parents[l_fuel] = {}

            for _, category in pairs(es.fuel_categories or { (es.fuel_category or 'chemical') }) do
                for fuel, _ in pairs(pytech.fuel_categories[category] or {}) do
                    local fuel_node = pytech.fg_get_node(fuel, nt_item)
                    pytech.fg_add_fuzzy_link(fuel_node, child_node, l_fuel)
                    -- log('Adding fuel for recipe ' .. child_node.key .. ': ' .. fuel_node.key)
                end
            end
        elseif es.type == 'fluid' then
            pytech.add_fluid_fuels(child_node, es.fluid_box.filter)
        elseif es.type == 'electric' and not electricity_producers[entity.type] then
            local fuel_node = pytech.fg_get_node(fuel_electricity, nt_item)
            pytech.fg_add_fuzzy_link(fuel_node, child_node, l_fuel)
        elseif es.type == 'heat' then
            -- log('Adding heat fuel to ' .. entity.name .. ', min_temp: ' .. es.min_working_temperature)
            for _, temp in pairs(pytech.heat_temps) do
                -- log('  - Temp: ' .. temp .. ' / ' .. type(temp))
                if temp >= (es.min_working_temperature or 15) then
                    local fuel_node = pytech.parse_fluid(nil, temp, fuel_heat)
                    pytech.fg_add_fuzzy_link(fuel_node, child_node, l_fuel)
                end
            end
        end
    end
end


function pytech.add_module_dependencies(node, recipe)
    -- log('add_module_dependencies (recipe_node: ' .. node.key)
    local category = data.raw['recipe-category'][recipe.category or 'crafting']

    if category.modules_required and category.allowed_module_categories then
        node.fz_parents[l_module] = {}

        for _, mod_cat in pairs(category.allowed_module_categories) do
            for module, _ in pairs(pytech.module_categories[mod_cat]) do
                local n_module = pytech.fg_get_node(module, nt_item)
                pytech.fg_add_fuzzy_link(n_module, node, l_module)
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
    local node = pytech.fg_get_node(item.name, nt_item, nil, item.name)

    if pytech.processed_items[item.name] then
        return node
    else
        pytech.processed_items[item.name] = true
    end

    node.ignore_for_dependencies = item.ignore_for_dependencies

    if item.fuel_category and item.burnt_result then
        pytech.add_burnt_result_recipe(item)
    end

    if item.place_result then
        local entity = pytech.get_prototype('entity', item.place_result)

        if entity.type == 'boiler' then
            pytech.add_boiler_recipe(entity)
        elseif entity.type == 'generator' then
            pytech.add_generator_recipe(entity)
        elseif entity.type == 'burner-generator' then
            pytech.add_simple_generator_recipe(entity)
        elseif entity.type == 'electric-energy-interface' and entity.energy_production and util.parse_energy(entity.energy_production) > 0 then
            pytech.add_simple_generator_recipe(entity)
        elseif entity.type == 'offshore-pump' then
            pytech.add_offhsore_pump_recipe(entity)
        elseif entity.type == 'reactor' then
            pytech.add_reactor_recipe(entity)
        end
    end

    return node
end


function pytech.parse_fluid(fluid, temperature, fluid_name)
    local fname = (fluid and fluid.name or fluid_name)
    local name = fname .. '(' .. (temperature or fluid.default_temperature) .. ')'
    -- log('Parsing fluid: ' .. name)
    local node = pytech.fg_get_node(name, nt_fluid, nil, fname)

    return node
end


function pytech.add_mining_recipe(entity)
    local recipe = {
        name = recipe_mining .. entity.name,
        ingredients = entity.minable.required_fluid and {{ type = 'fluid', name = entity.minable.required_fluid, amount = entity.minable.fluid_amount }} or {},
        results = entity.minable.results,
        result = entity.minable.result,
        result_count = entity.minable.count
    }

    local node = pytech.parse_recipe(nil, recipe, true)

    if entity.type == 'resource' then
        local category = (entity.category or 'basic-solid') .. (entity.minable.required_fluid and "+fluid" or "")

        if not pytech.mining_categories[category] then
            error('\n\nERROR: Missing mining category: ' .. category .. ', for ' .. entity.name .. '\n', 0)
        end

        if pytech.mining_categories[category] then
            for miner, _ in pairs(pytech.mining_categories[category]) do
                pytech.add_crafting_machine_link(node, miner)
            end
        end
    else
        pytech.add_crafting_machine_link(node, 'character')
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

            local node = pytech.parse_recipe(nil, recipe, true)
            pytech.add_crafting_machine_link(node, boiler.name)

            return node
        else
            error('ERROR: Unsupported feature: Unfiltered boiler')
        end
    else
        error('ERROR: Unsupported feature: Old style boiler (heat-water-inside)')
    end
end


function pytech.add_fluid_fuels(node, fluid_name)
    for fluid, _ in pairs(pytech.fuel_categories[fuel_fluid]) do
        if not fluid_name or fluid == fluid_name then
            for temp, _ in pairs(pytech.fluids[fluid]) do
                local fuel_node = pytech.parse_fluid(nil, temp, fluid)
                pytech.fg_add_fuzzy_link(fuel_node, node, l_fuel)
                -- log('Adding fuel for recipe ' .. child_node.key .. ': ' .. fuel_node.key)
            end
        end
    end
end


function pytech.add_generator_recipe(generator)
    local in_fluid = generator.fluid_box.filter
    local node

    if generator.burns_fluid then
        local recipe = {
            name = recipe_generator .. generator.name,
            ingredients = {},
            results = {{ type = nt_item, name = fuel_electricity, amount = 1 }}
        }

        node = pytech.parse_recipe(nil, recipe, true)
        pytech.add_fluid_fuels(node, in_fluid)
    else
        local recipe = {
            name = recipe_generator .. generator.name,
            ingredients = {{ type = 'fluid', name = in_fluid, amount = 1, minimum_temperature = generator.fluid_box.minimum_temperature, maximum_temperature = generator.fluid_box.maximum_temperature }},
            results = {{ type = nt_item, name = fuel_electricity, amount = 1 }}
        }

        node = pytech.parse_recipe(nil, recipe, true)
    end

    pytech.add_crafting_machine_link(node, generator.name)
end


function pytech.add_simple_generator_recipe(generator)
    local recipe = {
        name = recipe_generator .. generator.name,
        ingredients = {},
        results = {{ type = nt_item, name = fuel_electricity, amount = 1 }}
    }

    local node = pytech.parse_recipe(nil, recipe, true)
    pytech.add_crafting_machine_link(node, generator.name)
end


function pytech.add_reactor_recipe(reactor)
    local recipe = {
        name = recipe_reactor .. reactor.name,
        ingredients = {},
        results = {{ type = nt_fluid, name = fuel_heat, amount = 1, temperature = reactor.heat_buffer.max_temperature }}
    }

    local node = pytech.parse_recipe(nil, recipe, true)
    pytech.add_crafting_machine_link(node, reactor.name)
end


function pytech.add_offhsore_pump_recipe(pump)
    local recipe = {
        name = recipe_offshore .. pump.name,
        ingredients = {},
        results = {{ type = 'fluid', name = pump.fluid, amount = pump.pumping_speed }}
    }

    local node = pytech.parse_recipe(nil, recipe, true)
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
        results = {{ type = nt_item, name = item.burnt_result, amount = 1 }},
        ignore_for_dependencies = true
    }

    local node = pytech.parse_recipe(nil, recipe, true)
    node.fz_parents[l_crafting_machine] = {}

    for entity, _ in pairs(pytech.fuel_burners[item.fuel_category] or {}) do
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

    local node = pytech.parse_recipe(tech_name, recipe, true)
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
            -- local found = false

            for _, effect in pairs(tech.effects or {}) do
                if effect.type == 'unlock-recipe' then
                    -- found = true
                    local recipe = data.raw.recipe[effect.recipe]

                    if recipe then
                        pytech.pre_process_recipe(recipe)
                    end
                end
            end

            -- Add dependencies for tech names enging in numbers to the prev tier
            local split = string.split(tech.name, '-')
            local last = table.last(split)

            if string.is_digit(last) and tonumber(last) > 1 then
                split[#split] = tostring(tonumber(last) - 1)
                local prev_tech = string.join('-', split)

                if data.raw.technology[prev_tech] then
                    if not tech.dependencies then
                        tech.dependencies = {}
                    end

                    table.insert(tech.dependencies, prev_tech)
                end
            end

            if not pytech.is_py_or_base_tech(tech) then
                for _, pre in pairs(tech.prerequisites or {}) do
                    local pre_tech = data.raw.technology[pre]

                    if not pytech.is_py_or_base_tech(pre_tech) then
                        if not tech.dependencies then
                            tech.dependencies = {}
                        end

                        table.insert(tech.dependencies, pre)
                    end
                end
            end
        end
    end
end


function pytech.parse_data_raw()
    local start_node = pytech.fg_get_node(start_tech_name, nt_tech_head)
    start_node.virtual = true

    do
        local node = pytech.fg_get_node(fuel_electricity, nt_item)
        node.virtual = true
        pytech.insert_double_lookup(pytech.fuel_categories, fuel_electricity, fuel_electricity)

        for _, temp in pairs(pytech.heat_temps) do
            node = pytech.parse_fluid({}, temp, fuel_heat)
            node.virtual = true
            pytech.insert_double_lookup(pytech.fuel_categories, fuel_heat, node.name)
        end
    end

    -- Starter entities
    for e, _ in pairs(starting_entities) do
        local entity =  pytech.get_prototype('entity', e, true)

        if entity then
            -- log('Add starting entity: ' .. e)
            local node = pytech.fg_get_node(e, nt_item, nil, e)
            pytech.fg_add_link(start_node, node)
        end
    end

    -- Starter recipes
    for _, recipe in pairs(data.raw.recipe) do
        if (recipe.normal and recipe.normal.enabled ~= false) or (not recipe.normal and recipe.enabled ~= false) then
            pytech.parse_recipe(nil, recipe)
        end
    end

    -- Minables
    for et, _ in pairs(defines.prototypes['entity']) do
        for _, entity in pairs(data.raw[et]) do
            if entity.autoplace and entity.minable and (entity.minable.result or entity.minable.results) then
                pytech.add_mining_recipe(entity)
            end
        end
    end

    for _, tech in pairs(data.raw.technology) do
        if tech.enabled ~= false and not tech.hidden then
            pytech.parse_tech(tech)
        end
    end

    pytech.process_science_packs()
end


function pytech.process_science_packs()
    for sp1, t in pairs(pytech.science_packs) do
        pytech.sp_excl[sp1] = {}

        for tech, _ in pairs(t) do
            for sp2, _ in pairs(pytech.science_packs) do
                if sp2 ~= sp1 and not pytech.science_packs[sp2][tech] then
                    pytech.insert_double_lookup(pytech.sp_excl[sp1], sp2, tech)
                    -- log('Sp excl: ' .. sp1 .. ' / ' .. sp2 .. ' / ' .. tech .. ' : ' .. (pytech.sp_excl[sp1][sp2][tech] and 'true' or 'false'))
                end
            end
        end
    end
end


function pytech.update_internal_product(recipe, product, tech_name, add_to_tail)
    local tail_node = pytech.fg_get_node(recipe.label, nt_tech_tail)

    if add_to_tail then
        pytech.fg_add_fuzzy_link(tail_node, product, l_recipe_result)
    end

    local internal_node = pytech.fg_get_node(recipe.label .. '::' .. product.name, product.type, recipe.label, product.factorio_name)
    internal_node.main_node = product
    internal_node.ignore_for_dependencies = product.ignore_for_dependencies

    pytech.fg_remove_fuzzy_link(recipe, product, l_recipe_result)
    pytech.fg_add_fuzzy_link(recipe, internal_node, l_recipe_result)

    -- log('Internal node: ' .. recipe.label .. '::' .. product.name .. (add_to_tail and ' +tail' or ' -tail'))

    if not pytech.processed_internals[internal_node.key] then
        pytech.processed_internals[internal_node.key] = true

        for label, children in pairs(product.fz_children) do
            for _, child in pairs(children) do
                if (child.label == tech_name) then
                    pytech.fg_add_fuzzy_link(internal_node, child, label)
                end
            end
        end
    end

    return internal_node
end


function pytech.pre_process_fuzzy_graph()
    -- log('Add tech tail nodes')
    for _, node in pairs(pytech.fg) do
        if node.type == nt_tech_head and node.name ~= start_tech_name then
            -- Add tail nodes for technology nodes
            local tail_node = pytech.fg_get_node(node.name, nt_tech_tail, node.label, node.factorio_name)

            for _, recipe_node in pairs(node.children) do
                pytech.fg_add_link(recipe_node, tail_node)
            end

            pytech.fg_add_link(node, tail_node)
            pytech.tech_used_recipes[node.name] = {}
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

    for _, node in pairs(pytech.fg) do
        if not node.factorio_name and not node.virtual then
            pytech.fg_remove_node(node)
        end
    end

    for _, node in pairs(pytech.fg) do
        if node.factorio_name and (node.type == nt_item or node.type == nt_fluid or node.type == nt_recipe)  then
            local parent_found = false
            local empty_fzparent

            if not table.is_empty(node.parents) then
                parent_found = true
            else
                for label, fz in pairs(node.fz_parents or {}) do
                    if not table.is_empty(fz) then
                        parent_found = true
                        break
                    else
                        empty_fzparent = label
                    end
                end
            end

            local child_found = false
            local child_key

            for key, child in pairs(node.children or {}) do
                if child and not child.ignore_for_dependencies then
                    child_found = true
                    child_key = key
                    break
                end
            end

            for _, fz in pairs(node.fz_children or {}) do
                for key, child in pairs(fz or {}) do
                    if not child.ignore_for_dependencies then
                        child_found = true
                        child_key = key
                        break
                    end
                end

                if child_found then break end
            end

            if node.key == "recipe|neutron-moderator-mk01" then
                log(serpent.block(node, { maxlevel = 3 }))
            end

            if child_found and not parent_found then
                if node.type == nt_recipe then
                    error('\n\nERROR: Recipe is never unlocked: ' .. node.key .. ' used in: ' .. child_key .. '\n')
                else
                    error('\n\nERROR: Item/fluid has no source: ' .. node.key .. ' used in: ' .. child_key .. '\n')
                end
                log(serpent.block(node, { maxlevel = 3 }))
            elseif empty_fzparent then
                error('\n\nERROR: Missing dependency: ' .. empty_fzparent .. ' for: ' .. node.key .. '\n')
            end
        end
    end
end


function pytech.update_internal_item(node, sorted_set)
    -- log('pytech.update_internal_item: ' .. node.key)

    local main_item = node.main_node

    for c_label, cc in pairs(main_item.fz_children) do
        local children = table.merge({}, cc)

        for _, child in pairs(children) do
            if not child.label and (not sorted_set[child.key] or child.level == node.level) then
                local child_node = pytech.fg_get_node(node.label .. '::' .. child.name, child.type, node.label, child.factorio_name)
                child_node.ignore_for_dependencies = child.ignore_for_dependencies

                if not child_node.processed then
                    child_node.processed = true
                    -- log('pytech.update_internal_item: Adding internal recipe ' .. child_node.key)

                    for p_label, parents in pairs(child.fz_parents) do
                        for _, parent in pairs(parents) do
                            if parent.key ~= main_item.key then
                                pytech.fg_add_fuzzy_link(parent, child_node, p_label)
                            else
                                pytech.fg_add_fuzzy_link(node, child_node, p_label)
                            end
                        end
                    end

                    for _, parent in pairs(child.parents) do
                        if parent.key ~= main_item.key then
                            pytech.fg_add_link(parent, child_node)
                        else
                            pytech.fg_add_link(node, child_node)
                        end
                    end

                    pytech.init_incoming(child_node, sorted_set)

                    for cc_label, c_children in pairs(child.fz_children) do
                        for _, c_child in pairs(c_children) do
                            local pr = pytech.fg[c_child.type .. '|' .. node.label .. '::' .. c_child.name]

                            if not pr or (not pr.label and (not sorted_set[pr.key] or pr.level == node.level)) then
                                pytech.fg_add_fuzzy_link(child_node, c_child, cc_label)
                                local internal_product = pytech.update_internal_product(child_node, c_child, node.label, false)

                                if not pr then
                                    pytech.init_incoming(internal_product, sorted_set)
                                else
                                    if internal_product.incoming and internal_product.incoming[cc_label] then
                                        internal_product.incoming[cc_label][child_node.key] = true
                                    end
                                end
                            end
                        end
                    end
                else
                    -- log('pytech.update_internal_item: Updating internal recipe ' .. child_node.key)
                    pytech.fg_remove_fuzzy_link(main_item, child_node, c_label)
                    pytech.fg_add_fuzzy_link(node, child_node, c_label)

                    if child_node.incoming and child_node.incoming[c_label] and child_node.incoming[c_label][main_item.key] then
                        child_node.incoming[c_label][main_item.key] = nil
                        child_node.incoming[c_label][node.key] = {}
                    end
                end
            end
        end
    end

    node.internal_update = true
end


function pytech.init_incoming(node, sorted_set)
    node.incoming = {}

    for _, parent in pairs(node.parents) do
        if not sorted_set or not sorted_set[parent.key] then
            node.incoming[parent.key] = {}
        end
    end

    for label, parents in pairs(node.fz_parents) do
        node.incoming[label] = {}

        for _, parent in pairs(parents) do
            if not sorted_set or not sorted_set[parent.key] then
                node.incoming[label][parent.key] = true
            end
        end
    end
end


function pytech.topological_sort(sorted_set_inc, start_node)
    -- log('============== TOPOLOGICAL SORT ==============')
    -- log('Add incoming set')
    local sorted_set = {}

    if not sorted_set_inc then
        for _, node in pairs(pytech.fg) do
            pytech.init_incoming(node)
        end
    else
        for k in pairs(sorted_set_inc) do
            sorted_set[k] = pytech.fg[k]
        end
    end

    local starting_set = {}

    if start_node then
        starting_set[start_node.name] = start_node
    else
        starting_set[start_tech_name] = pytech.fg_get_node(start_tech_name, nt_tech_head)
    end

    local level = 1
    local found_error = false
    local found_loop = false
    local run_loop = true
    local enode_idx = 1
    local sp_sorted = {}
    local sp_processed = {}
    local sp_virt_links = {}
    local ignore_science_packs = false

    while run_loop do
        while not table.is_empty(starting_set) and not found_loop do
            local current_set = {}

            for key, node in pairs(starting_set) do
                current_set[key] = node
            end

            for key, node in pairs(current_set) do
                log(level .. ' - ' .. node.key)
                starting_set[key] = nil
                local found = false

                if node.type == nt_item and pytech.science_packs[node.name] then
                    -- log('Science pack: ' .. node.name)
                    -- log('  - ' .. serpent.block(node, {maxlevel=3 , keyignore = {main_node = true, children = true}}))

                    if not ignore_science_packs and not sp_processed[node.name] then
                        sp_processed[node.name] = true
                        sp_virt_links[node.name] = {}

                        for _, pack in pairs(sp_sorted) do
                            -- log('  - checking science pack: ' .. pack.name)
                            local path = pytech.find_shortest_path(node, pack, false)

                            if path and not path:is_empty() then
                                -- log('  - parent science pack: ' .. pack.name)
                                for tech_name, _ in pairs(pytech.sp_excl[pack.name][node.name] or {}) do
                                    -- log('    - tech: ' .. tech_name)
                                    local others_sorted = true

                                    for sp, t in pairs(pytech.science_packs) do
                                        if sp ~= node.name and t[tech_name] and not sp_sorted[sp] then
                                            -- log('      - other sp not sorted: ' .. sp)
                                            others_sorted = false
                                        end
                                    end

                                    local tech_node = pytech.fg_get_node(tech_name, nt_tech_tail)

                                    if others_sorted and not sorted_set[tech_node.key] and not node.parents[tech_node.key] then
                                        -- log('      - adding virt tech prereq: ' .. tech_node.key)
                                        pytech.fg_add_link(tech_node, node)
                                        node.incoming[tech_node.key] = {}
                                        sp_virt_links[node.name][tech_name] = tech_node
                                        found = true
                                    end
                                end
                            end
                        end
                    end

                    if not found then
                        sp_sorted[node.name] = node

                        for _, tech_node in pairs(sp_virt_links[node.name] or {}) do
                            -- log('Removing link ' .. tech_node.key .. ' > ' .. node.key)
                            pytech.fg_remove_link(tech_node, node)
                        end
                    end
                end

                if not found then
                    node.level = level
                    sorted_set[node.key] = node

                    if (node.type == nt_item or node.type == nt_fluid) and node.label then
                        pytech.update_internal_item(node, sorted_set)
                    end

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
                            child.incoming[node.key] = {}
                        end
                    end

                    for _, child in pairs(node.children) do
                        if found_error then
                            if child.key == start_node.key then
                                log('LOOP FOUND: ' .. start_node.key)
                                found_loop = true
                            else
                                enode_idx = enode_idx + 1
                            end
                        end

                        child.incoming[node.key] = nil

                        if not sorted_set[child.key] then
                            if table.is_empty(child.incoming) then
                                log(child.key .. ': EMPTY')
                                starting_set[child.key] = child
                            else
                                log(child.key .. ': NOT EMPTY')
                                for ikey, _ in pairs(child.incoming) do
                                    log(' - ' .. ikey)
                                end
                            end
                        end
                    end
                end
            end

            level = level + 1
        end

        if table_size(table.filter(sorted_set, function(n) return not n.virtual and not n.ignore_for_dependencies end)) < table_size(table.filter(pytech.fg, function(n) return not n.virtual and not n.ignore_for_dependencies end))
        then
            if not ignore_science_packs then
                ignore_science_packs = true
                log('Restarting without science pack checks')

                for sp_name, t in pairs(sp_virt_links) do
                    local node = pytech.fg_get_node(sp_name, nt_item)

                    for _, tech_node in pairs(t) do
                        log('Removing link ' .. tech_node.key .. ' > ' .. node.key)
                        pytech.fg_remove_link(tech_node, node)
                        node.incoming[tech_node.key] = nil
                    end

                    if not sorted_set[node.key] then
                        if table.is_empty(node.incoming) then
                            log(node.key .. ': EMPTY')
                            starting_set[node.key] = node
                        else
                            log(node.key .. ': NOT EMPTY')
                            for ikey, _ in pairs(node.incoming) do
                                log(' - ' .. ikey)
                            end
                        end
                    end
                end

                sp_virt_links = {}
            elseif not found_error or (found_error and not found_loop) then
                found_error = true
                -- local start_node = pytech.find_error_start_node(sorted_set, error_set)

                -- if not start_node then
                --     run_loop = false
                --     log('Failed to find start node')
                -- else
                --     starting_set[start_node.key] = start_node

                --     if not error_start_node then
                --         error_start_node = start_node
                --         log('Finding dependency loop starting from: ' .. error_start_node.key)
                --     else
                --         log('Continuing from: ' .. start_node.key)
                --     end
                -- end
                run_loop = false
            else
                if start_node and found_loop then
                    local path
                    local length = table.size(pytech.fg)

                    for _, child in pairs(start_node.children) do
                        local l = pytech.find_shortest_path(start_node, child, false)
                        if l and not queue.is_empty(l) and queue.size(l) < length then
                            length = queue.size(l)
                            path = l
                        end
                    end

                    if path and not queue.is_empty(path) then
                        log('Found loop : ' )
                        local msg = '\n\nDependency loop detected: '
                        for _, key in queue.rpairs(path) do
                            msg = msg .. pytech.log_node(key)
                        end
                        -- msg = msg .. pytech.log_node(queue.peek_last(path)) .. '\n'
                        error(msg)
                    else
                        error('Failed to find loop')
                    end
                end
                run_loop = false
            end
        else
            run_loop = false
        end
    end

    -- for _, node in pairs(pytech.fg) do
    --     -- if not sorted_set[node.key] and node.factorio_name and not node.ignore_for_dependencies and not ((node.type == nt_item or node.type == nt_fluid) and node.label) then
    --     if not sorted_set[node.key] then
    --         log('ERROR: Unprocessed node: ' .. node.key)
    --     end
    -- end

    log('Nodes: ' .. table_size(table.filter(pytech.fg, function(n) return not n.virtual and not n.ignore_for_dependencies end)))
    log('Sorted nodes: ' .. table_size(table.filter(sorted_set, function(n) return not n.virtual and not n.ignore_for_dependencies end)))
    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::carbon-dioxide(15)', nt_fluid), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::empty-carbon-dioxide-barrel', nt_recipe), {maxlevel =3, keyignore = {data = true} }))
    -- log(serpent.block(pytech.fg_get_node('helium-processing::pressured-air', nt_recipe), {maxlevel =3, keyignore = {data = true} }))
    -- local recipes = {}
    -- local techs = 0

    -- for _, node in pairs(sorted_set) do
    --     if node.type == nt_recipe and not node.virtual and not node.ignore_for_dependencies then
    --         recipes[node.factorio_name] = true
    --     end

    --     if node.type == nt_tech_tail and not node.virtual and not node.ignore_for_dependencies then
    --         techs = techs + 1
    --     end
    -- end

    -- log('Techs: ' .. techs)
    -- log('Recipes: ' .. table.size(recipes))

    if not start_node and found_error then
        pytech.find_dependency_loop(sorted_set)
    end

    return found_error
end


function pytech.find_error_start_node(sorted_set, error_set)
    local start_node
    local found_parent

    for _, node in pairs(pytech.fg) do
        if not sorted_set[node.key] and not error_set[node.key] and table.size(node.incoming or {}) > 0 and (table.size(node.children) + table.size(node.fz_children) > 0) then
            local found = false

            for parent_key, _ in pairs(node.parents or {}) do
                if sorted_set[parent_key] then
                    found = true
                    break
                end
            end

            if not start_node or
            (start_node.ignore_for_dependencies and not node.ignore_for_dependencies) or
            (not found_parent and found) or
            -- (start_node.main_node and not node.main_node) or
            table.size(node.incoming or {}) < table.size(start_node.incoming or {}) or
            (start_node.type ~= nt_recipe and node.type == nt_recipe) then
                start_node = node
                found_parent = found
            end
        end
    end

    -- log(serpent.block(start_node, { maxlevel = 3 }))
    return start_node
end


function pytech.find_dependency_loop_new(sorted_set)
    log('START find_dependency_loop')
    local g = pytech.clone_graph(pytech.fg)
    local error_set = {}
    local start_node = pytech.find_error_start_node(sorted_set, error_set)

    -- while start_node do
    --     log('Finding dependency loop starting from: ' .. start_node.key)
    --     pytech.topological_sort(sorted_set, start_node)
    --     error_set[start_node.key] = start_node
    --     pytech.fg = pytech.clone_graph(g)
    --     start_node = pytech.find_error_start_node(sorted_set, error_set)
    -- end

    log('END find_dependency_loop')
end


function pytech.find_dependency_loop(sorted_set)
    log('START find_dependency_loop')

    for _, node in pairs(pytech.fg) do
        if not sorted_set[node.key] and not node.virtual and not node.ignore_for_dependencies then
            log(' - ' .. node.key)
        end
    end

    error('\n\nUnable to identify dependency loop\n')

    -- log('\n=====================================================================================')
    -- log('  - ' .. serpent.block(pytech.fg_get_node('chemical-science-pack', nt_item), {maxlevel=3 , keyignore = {main_node = true, children = true}}))

    local change = true

    -- while change do
    --     change = false

    --     for _, node in pairs(pytech.fg) do
    --         if (node.type == nt_item or node.type == nt_fluid) and node.label and not node.internal_update then
    --             pytech.update_internal_item(node, sorted_set)
    --             change = true
    --         end
    --     end
    -- end

    local length = table_size(pytech.fg) + 1
    local distances = {}

    -- log('\n=====================================================================================')
    -- log('  - ' .. serpent.block(pytech.fg_get_node('chemical-science-pack', nt_item), {maxlevel=3 , keyignore = {main_node = true, children = true}}))

    -- for _, node in pairs(pytech.fg) do
    --     change = true
    --     while change do
    --         change = false

    --         for p_label, parents in pairs(node.fz_parents) do
    --             if table_size(parents) > 1 then
    --                 for p_key, parent in pairs(parents) do
    --                     for p_key2, parent2 in pairs(parents) do
    --                         if p_key ~= p_key2 and
    --                         ((parent.type ~= nt_item and parent.type ~= nt_fluid) or not parent.label) and
    --                         ((parent2.type ~= nt_item and parent2.type ~= nt_fluid) or not parent2.label) then
    --                             local p1
    --                             if distances[p_key .. '>>' .. p_key2] then
    --                                 p1 = distances[p_key .. '>>' .. p_key2]
    --                             else
    --                                 local path = pytech.find_shortest_path(parent, parent2, false, length)
    --                                 p1 = path and queue.size(path) or 0
    --                                 distances[p_key .. '>>' .. p_key2] = p1
    --                             end

    --                             local p2
    --                             if distances[p_key2 .. '>>' .. p_key] then
    --                                 p2 = distances[p_key2 .. '>>' .. p_key]
    --                             else
    --                                 local path = pytech.find_shortest_path(parent2, parent, false, length)
    --                                 p2 = path and queue.size(path) or 0
    --                                 distances[p_key2 .. '>>' .. p_key] = p2
    --                             end

    --                             if (p1 > 0 and p2 == 0) then
    --                                 pytech.fg_remove_fuzzy_link(parent, node, p_label)
    --                                 change = true
    --                                 log('Remove ' .. parent.key .. ' from ' .. node.key .. ':' .. p_label)
    --                                 break
    --                             elseif (p2 > 0 and p1 == 0) then
    --                                 pytech.fg_remove_fuzzy_link(parent2, node, p_label)
    --                                 change = true
    --                                 log('Remove ' .. parent2.key .. ' from ' .. node.key .. ':' .. p_label)
    --                                 break
    --                             end
    --                         end
    --                     end
    --                     if change then break end
    --                 end
    --             end
    --             if change then break end
    --         end
    --     end
    -- end

    -- log('\n=====================================================================================')
    -- log('  - ' .. serpent.block(pytech.fg_get_node('chemical-science-pack', nt_item), {maxlevel=3 , keyignore = {main_node = true, children = true}}))

    local graph = {}

    for key, node in pairs(pytech.fg) do
        graph[key] = node
    end

    -- log('size: ' .. table_size(graph))

    change = true

    while change do
        change = false

        for key, node in pairs(graph) do
            if table.is_empty(node.children) and table.is_empty(node.fz_children) then
                for _, p in pairs(node.parents) do
                    pytech.fg_remove_link(p, node)
                    log('No children - removing link: ' .. p.key .. ' > ' .. node.key)
                end

                for label, pp in pairs(node.fz_parents) do
                    for _, p in pairs(pp) do
                        pytech.fg_remove_fuzzy_link(p, node, label, false)
                        log('No children - removing fuzzy link: ' .. p.key .. ' > ' .. node.key)
--                        break
                    end
                end

                graph[key] = nil
                change = true
            elseif table.is_empty(node.parents) and table.is_empty(node.fz_parents) then
                for _, c in pairs(node.children) do
                    pytech.fg_remove_link(node, c)
                    log('No parents - removing link: ' .. node.key .. ' > ' .. c.key)
                end

                for label, cc in pairs(node.fz_children) do
                    for _, c in pairs(cc) do
                        pytech.fg_remove_fuzzy_link(node, c, label)
                        log('No parents - removing fuzzy link: ' .. node.key .. ' > ' .. c.key)
                    end
                end

                graph[key] = nil
                change = true
            end
        end
    end

    -- log('size: ' .. table_size(graph))
    -- log('\n=====================================================================================')
    -- log('  - ' .. serpent.block(pytech.fg_get_node('chemical-science-pack', nt_item), {maxlevel=3 , keyignore = {main_node = true, children = true}}))

    -- do return end
    local path

    -- length = 3
    -- while length <= 5 do
    --     local restart = false
    --     for _, node in pairs(graph) do
    --         if node.type == nt_recipe then
    --             local children = table.merge({},  node.children)
    --             for _, c in  pairs(node.fz_children) do
    --                 children = table.merge(children, c)
    --             end

    --             for _, child in pairs(children) do
    --                 local l = pytech.find_shortest_path(node, child, true, length - 1)

    --                 if l and not queue.is_empty(l) then
    --                     local last_n = l:peek_first()
    --                     -- log('Found path from ' ..node.key .. ' to ' .. child.key .. ', L: ' .. queue.size(l))

    --                     while not l:is_empty() do
    --                         local n = l:pop_last()
    --                         local q_node = pytech.fg[n]
    --                         -- log('  - ' .. n)

    --                         if last_n then
    --                             local l_node = pytech.fg[last_n]
    --                             local label

    --                             for p_label, parents in pairs(l_node.fz_parents) do
    --                                 if table_size(parents) > 1 then
    --                                     for p_key, _ in pairs(parents) do
    --                                         if p_key == n then
    --                                             label = p_label

    --                                             break
    --                                         end
    --                                     end
    --                                 end
    --                             end

    --                             if label and q_node.type ~= nt_tech_tail then
    --                                 pytech.fg_remove_fuzzy_link(q_node, l_node, label)
    --                                 log('Removing link ' .. q_node.key .. ' > ' .. label .. ' > ' .. l_node.key)
    --                                 restart = true
    --                                 break
    --                             end
    --                         end

    --                         last_n = n
    --                     end
    --                 end
    --                 if restart then break end
    --             end
    --         end
    --         if restart then break end
    --     end

    --     if not restart then
    --         length = length + 1
    --     end
    -- end

    -- log('\n=====================================================================================')
    -- log('  - ' .. serpent.block(pytech.fg_get_node('chemical-science-pack', nt_item), {maxlevel=3 , keyignore = {main_node = true, children = true}}))

    length = 5 --table_size(graph) + 1

    for _, node in pairs(graph) do
        -- log('  - ' .. serpent.block(node, {maxlevel=3 , keyignore = {main_node = true, incoming = true}}))
        if node.type == nt_recipe and not node.ignore_for_dependencies then
            for _, child in pairs(node.children) do
                local l = pytech.find_shortest_path_fuzzy(node, child, length - 1)
                if l and not queue.is_empty(l) and queue.size(l) < length then
                    length = queue.size(l)
                    path = l
                    log('Shortest path: ' .. node.key .. ' to ' .. child.key .. ' / ' .. length)
                end
            end
        end
    end

    if path and not queue.is_empty(path) then
        log('Found loop : ' )
        local msg = '\n\nDependency loop detected: '
        for _, key in queue.rpairs(path) do
            msg = msg .. pytech.log_node(key)
        end
        msg = msg .. pytech.log_node(queue.peek_last(path)) .. '\n'
        error(msg)
    else
        local msg = '\n\nUnable to identify dependency loop\n'
        for _, node in pairs(pytech.fg) do
            if not sorted_set[node.key] and not node.virtual --[[ and node.factorio_name and not node.ignore_for_dependencies and not ((node.type == nt_item or node.type == nt_fluid) and node.label) ]] then
                msg = msg .. 'Unreachable ' .. node.type .. ': ' .. node.name
                break
            end
        end
        error(msg .. '\n')
    end

    log('END find_dependency_loop')
end


function pytech.log_node(key)
    local node = pytech.fg[key]
    if node.type == nt_tech_tail then
        return '\n  - Technology: ' .. node.name
    elseif node.type == nt_recipe then
        return '\n  - Recipe: ' .. node.name
    elseif node.type == nt_item then
        return '\n  - Item: ' .. node.name
    elseif node.type == nt_fluid then
        return '\n  - Fluid: ' .. node.name
    else return ''
    end
end


function pytech.find_shortest_path(start_node, target_node, fuzzy, max_dist)
    local q = queue()
    local marked = {}
    local dist = {}
    local edgeTo = {}

    marked[start_node.key] = true
    dist[start_node.key] = 0
    q(start_node)

    while(not queue.is_empty(q)) do
        local n = q()
        local parents = {}
        -- if start_node.name == 'logistic-science-pack' then
        --     log('dequeue: ' .. n.key)
        -- end

        for p_key, pp in pairs(n.parents) do
            parents[p_key] = { label = 'non-fuzzy', node = pp }
        end

        for p_label, p in pairs(n.fz_parents) do
            if fuzzy or table_size(p) == 1 then
                for p_key, pp in pairs(p) do
                    if not pytech.exclude_from_path[n.key .. '>>' .. p_label .. '>>' .. p_key] then
                        -- log('search ' .. n.key .. '>>' .. p_label .. '>>' .. p_key)
                        parents[p_key] = { label = p_label, node = pp }
                    end
                end
            end
        end

        for key, p in pairs(parents) do
            if not marked[key] then
                edgeTo[key] = n.key
                dist[key] = dist[n.key] + 1
                if max_dist and dist[key] >= max_dist then
                    return nil
                end
                -- if start_node.name == 'logistic-science-pack' then
                --     log('enqueue: ' .. key .. ', edgeTo: ' .. edgeTo[key] .. ', label: ' .. p.label .. ', dist: ' .. dist[key])
                -- end

                if key == target_node.key then
                    local path = queue()
                    local x = key

                    while dist[x] ~= 0 do
                        path(x)
                        x = edgeTo[x]
                    end
                    path(x)
                    -- if start_node.name == 'coal-processing-1 / tar-gasification' then
                    --     log('find_shortest_path: ' .. start_node.key .. ' > ' .. target_node.key .. ' = ' .. queue.size(path))
                    -- end

                    return path
                else
                    marked[key] = true
                    q(p.node)
                end
            end
        end
    end
end


function pytech.find_shortest_path_fuzzy(start_node, target_node, max_dist)
    -- log('find_shortest_path_fuzzy: ' .. start_node.key .. ' > ' .. target_node.key)
    pytech.exclude_from_path = {}
    pytech.safe_path = {}
    local q
    local restart = true

    while restart do
        local path = pytech.find_shortest_path(start_node, target_node, true, max_dist)
        q = queue()
        restart = false
        local last_n
        -- if start_node.name == 'coal-processing-1 / tar-gasification' then
        --     log('==============================================================')
        -- end

        while not restart and path and not queue.is_empty(path) do
            local n = path()
            local node = pytech.fg[n]
            -- if start_node.name == 'coal-processing-1 / tar-gasification' then
            --     log('Node: ' .. n)
            -- end

            if last_n then
                local label
                local key

                for p_label, parents in pairs(node.fz_parents) do
                    for p_key, _ in pairs(parents) do
                        if p_key == last_n then
                            label = p_label
                            key = p_key
                            -- if start_node.name == 'coal-processing-1 / tar-gasification' then
                            --     log('Found last node: ' .. label .. ' : ' .. key)
                            -- end

                            break
                        end
                    end
                end

                if label and not pytech.safe_path[n .. '>>' .. label] then
                    local ts = 0
                    local fs = 0

                    for p_key, _ in pairs(node.fz_parents[label]) do
                        if not pytech.exclude_from_path[n .. '>>' .. label .. '>>' .. p_key] then
                            ts = ts + 1
                        end
                        fs = fs +1
                    end

                    if ts > 1 then
                        pytech.exclude_from_path[n .. '>>' .. label .. '>>' .. key] = true
                        restart = true
                        -- if start_node.name == 'coal-processing-1 / tar-gasification' then
                        --     log('exclude_from_path: ' .. n .. '>>' .. label .. '>>' .. key)
                        -- end
                    elseif ts == 1 then
                        pytech.safe_path[n .. '>>' .. label] = true

                        for p_key, _ in pairs(node.fz_parents) do
                            pytech.exclude_from_path[n .. '>>' .. label .. '>>' .. p_key] = nil
                        end

                        if fs > 1 then
                            restart = true
                        end

                        -- if start_node.name == 'coal-processing-1 / tar-gasification' then
                        --     log('safe_path: ' .. n .. '>>' .. label)
                        -- end
                    end
                end
            end

            last_n = n

            q(n)
        end
    end
    -- log('find_shortest_path_fuzzy retruning ' .. queue.size(q))
    -- log('find_shortest_path_fuzzy: ' .. start_node.key .. ' > ' .. target_node.key .. ' = ' .. queue.size(q))

    return q
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
    -- log(serpent.block(pytech.fg_get_node('geothermal-water(300)', nt_fluid), { maxlevel = 3 }))
    -- log(serpent.block(pytech.fg_get_node('intermetallics-mk02 / organic-acid-anhydride', nt_recipe), { maxlevel = 3 }))
    log('Nodes: ' .. table_size(pytech.fg))

    pytech.pre_process_fuzzy_graph()

    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::calcium-carbide', nt_item), { maxlevel = 3 }))
    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::calcium-carbide', nt_recipe), { maxlevel = 3 }))

    local error = pytech.topological_sort()

    if error then return end

    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::calcium-carbide', nt_item), { maxlevel = 3 }))
    -- log(serpent.block(pytech.fg_get_node('coal-processing-1::calcium-carbide', nt_recipe), { maxlevel = 3 }))

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


function pytech.pre_process_entity(entity)
    if pytech.entities[entity.name] then
        return
    end

    pytech.entities[entity.name] = entity

    if not table.any(entity.flags or {}, function(v) return v == 'hidden' end) or starting_entities[entity.name] then
        local fb_in = 0
        local fb_out = 0

        if entity.minable and (entity.minable.result or entity.minable.results) then
            for _, res in pairs(pytech.standardize_products(entity.minable.results, nil, entity.minable.result, entity.minable.count)) do
                if res.type == 'fluid' then
                    local fluid = data.raw.fluid[res.name]

                    if fluid then
                        pytech.pre_process_fluid(fluid, res.temperature)
                    end
                else
                    local item = pytech.get_prototype(nt_item, res.name)
                    pytech.pre_process_item(item)
                end
            end
        end

        for _, fb in pairs(entity.fluid_boxes or {}) do
            if type(fb) == 'table' then
                if fb.production_type == 'input' or fb.production_type == 'input-output' then
                    fb_in = fb_in + 1
                elseif fb.production_type == 'output' then
                    fb_out = fb_out + 1
                end
            end
        end

        -- Crafting categories
        for _, c in pairs(entity.crafting_categories or {}) do
            if not pytech.crafting_categories[c] then
                pytech.crafting_categories[c] = {}
            end

            local craft = {}
            craft.crafting_category = c
            craft.ingredient_count = entity.ingredient_count or 255
            craft.fluidboxes_in = fb_in
            craft.fluidboxes_out = fb_out
            craft.entity_name = entity.name

            table.insert(pytech.crafting_categories[c], craft)
        end

        if entity.equipment_grid then
            pytech.entities_with_grid[entity.name] = data.raw['equipment-grid'][entity.equipment_grid]
        end

        local es = entity.burner or entity.energy_source

        -- Burner
        if es and (entity.burner or es.type == 'burner') then
            for _, category in pairs(es.fuel_categories or { (es.fuel_category or 'chemical') }) do
                pytech.insert_double_lookup(pytech.fuel_burners, category, entity.name)
                -- log('Adding burner ' .. entity.name .. ' for fuel category ' .. category)
            end
        end

        if entity.type == 'boiler' then
            if (entity.mode or 'heat-water-inside') == 'output-to-separate-pipe' then
                local filter = entity.output_fluid_box.filter or entity.fluid_box.filter

                if filter then
                    pytech.insert_double_lookup(pytech.fluids, filter, entity.target_temperature)
                else
                    error('ERROR: Unsupported feature: Unfiltered boiler')
                end
            else
                error('ERROR: Unsupported feature: Old style boiler (heat-water-inside)')
            end
        elseif entity.type == 'mining-drill' then
            for _, category in pairs(entity.resource_categories or {}) do
                pytech.insert_double_lookup(pytech.mining_categories, category, entity.name)
                if entity.input_fluid_box then
                    pytech.insert_double_lookup(pytech.mining_categories, category .. "+fluid", entity.name)
                end
            end
        elseif entity.type == 'character' then
            pytech.insert_double_lookup(pytech.placed_by, entity.name, entity.name)
            for _, category in pairs(entity.mining_categories or {}) do
                pytech.insert_double_lookup(pytech.mining_categories, category, entity.name)
            end
        elseif entity.type == 'reactor' or entity.type == 'heat-interface' then
            table.insert(pytech.heat_temps, entity.heat_buffer.max_temperature)
        end
    end
end


function pytech.pre_process_recipe(recipe)
    if pytech.recipes[recipe.name] then
        return
    end

    pytech.recipes[recipe.name] = recipe

    local r = recipe.normal or recipe

    for _, res in pairs(pytech.standardize_products(r.results, nil, r.result, r.result_count)) do
        if res.type == 'fluid' then
            local fluid = data.raw.fluid[res.name]

            if fluid then
                pytech.pre_process_fluid(fluid, res.temperature)
            end
        else
            local item = pytech.get_prototype(nt_item, res.name)
            pytech.pre_process_item(item)
        end
    end
end


function pytech.pre_process_item(item)
    if pytech.items[item.name] then
        return
    end

    pytech.items[item.name] = item

    if item.fuel_category and item.fuel_value and util.parse_energy(item.fuel_value) > 0 and not table.any(item.flags or {}, function(v) return v == 'hidden' end) then
        -- log('Adding item ' .. item.name .. ' to fuel category ' .. item.fuel_category)
        pytech.insert_double_lookup(pytech.fuel_categories, item.fuel_category, item.name)
    end

    if item.place_result then
        pytech.insert_double_lookup(pytech.placed_by, item.place_result, item.name)
        pytech.pre_process_entity(pytech.get_prototype('entity', item.place_result))
    end

    if item.placed_as_equipment_result then
        pytech.insert_double_lookup(pytech.placed_by, item.placed_as_equipment_result, item.name)
    end

    if item.type == 'module' then
        pytech.insert_double_lookup(pytech.module_categories, item.category, item.name)
    end

    -- Fucking capsules
    if item.type == 'capsule' and item.capsule_action.type == 'throw' then
        -- log('Pre-process capsule: ' .. item.name)
        local ap = item.capsule_action.attack_parameters

        if ap.ammo_type and ap.ammo_type.action then
            for _, a in pairs(ap.ammo_type.action) do
                local ad = a.action_delivery
                if ad.type then ad = { ad } end

                for _, d in pairs(ad) do
                    if d.type == 'projectile' then
                        local pr_action = data.raw.projectile[d.projectile].action
                        if pr_action and pr_action.type then pr_action = { pr_action } end

                        for _, pr_a in pairs(pr_action or {}) do
                            local pr_ad = pr_a.action_delivery
                            if pr_ad.type then pr_ad = { pr_ad } end

                            for _, pr_d in pairs(pr_ad or {}) do
                                local te = pr_d.target_effects

                                if te then
                                    if te.type then te = { te } end

                                    for _, tee in pairs(te) do
                                        if tee.type == 'create-entity' then
                                            -- log('Pre-process capsule: ' .. tee.entity_name .. ', item: ' .. item.name)
                                            pytech.insert_double_lookup(pytech.placed_by, tee.entity_name, item.name)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    if item.equipment_grid then
        pytech.items_with_grid[item.name] = data.raw['equipment-grid'][item.equipment_grid]
    end
end


function pytech.pre_process_fluid(fluid, temperature)
    pytech.insert_double_lookup(pytech.fluids, fluid.name, temperature or fluid.default_temperature)

    if fluid.fuel_value and util.parse_energy(fluid.fuel_value) > 0 then
        pytech.insert_double_lookup(pytech.fuel_categories, fuel_fluid, fluid.name)
    end
end


function pytech.pre_process_data_raw()
    pytech.recipes = {}
    pytech.fluids = {}
    pytech.items = {}
    pytech.entities = {}
    pytech.mining_categories = {}
    pytech.crafting_categories = {}
    pytech.module_categories = {}
    pytech.fuel_categories = {}
    pytech.fuel_burners = {}
    pytech.heat_temps = {}
    pytech.placed_by = {}
    pytech.items_with_grid = {}
    pytech.entities_with_grid = {}

    -- Starter entities
    for e, _ in pairs(starting_entities) do
        local entity =  pytech.get_prototype('entity', e, true)

        if entity then
            pytech.insert_double_lookup(pytech.placed_by, e, e)
            pytech.pre_process_entity(entity)
        end
    end

    -- Starter recipes
    for _, recipe in pairs(data.raw.recipe) do
        if (recipe.normal and recipe.normal.enabled ~= false) or (not recipe.normal and recipe.enabled ~= false) then
            pytech.pre_process_recipe(recipe)
        end
    end

    -- Minables
    for et, _ in pairs(defines.prototypes['entity']) do
        for _, entity in pairs(data.raw[et]) do
            if entity.autoplace and entity.minable and (entity.minable.result or entity.minable.results) then
                pytech.pre_process_entity(entity)
            end
        end
    end

    pytech.pre_process_techs()
end


-------------------------------------------------------------------------------
log("======================= AUTO TECH TREE START =======================")
pytech.pre_process_data_raw()
pytech.parse_data_raw()
pytech.calculate_prerequisites()
pytech.cleanup()
log("======================= AUTO TECH TREE END =========================")
