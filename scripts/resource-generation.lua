local ore_gen = {}

local Event = require('__stdlib__/stdlib/event/event')

--add the pymods resources that are duplicates of the same resource
--i.e. the oils and phosphate rocks
local resources = {}
local rocks = {}
local rockset = {}
local isresources = {
    'iron-ore',
    'copper-ore',
    'coal',
    'stone'
}
local osresources = {
    'borax'
}

function ore_gen.on_configuration_changed()
    global.ore_gen = {}

    if settings.startup['ore-gen'].value then
        --only do something if pyro or pyph are active_mods
        if not game.active_mods['rso-mod'] and not game.active_mods['PyCoalTBaA'] and not game.active_mods['PyBlock'] then
            if game.active_mods['pyrawores'] or game.active_mods['pypetroleumhandling'] then
                table.insert(resources, 'coal')
                table.insert(resources, 'stone')

                table.insert(resources, 'borax')
                table.insert(resources, 'niobium')

                if game.active_mods['pyfusionenergy'] then
                    table.insert(resources, 'molybdenum-ore')
                    table.insert(rocks, 'regolites')
                    table.insert(rocks, 'volcanic-pipe')
                end

                if game.active_mods['pyhightech'] then
                    table.insert(rocks, 'rare-earth-bolide')
                    table.insert(rocks, 'phosphate-rock')
                end

                if game.active_mods['pyrawores'] then
                    table.insert(isresources, 'ore-quartz')
                    table.insert(isresources, 'ore-tin')
                    table.insert(isresources, 'ore-lead')

                    table.insert(osresources, 'ore-aluminium')
                    table.insert(osresources, 'salt-rock')

                    table.insert(rocks, 'salt-rock')
                    table.insert(rocks, 'quartz-rock')
                    table.insert(rocks, 'nickel-rock')
                    table.insert(rocks, 'nexelit-rock')
                    table.insert(rocks, 'lead-rock')
                    table.insert(rocks, 'iron-rock')
                    table.insert(rocks, 'copper-rock')
                    table.insert(rocks, 'coal-rock')
                    table.insert(rocks, 'chromium-rock')
                    table.insert(rocks, 'aluminium-rock')
                    table.insert(rocks, 'zinc-rock')
                    table.insert(rocks, 'uranium-rock')
                    table.insert(rocks, 'titanium-rock')
                    table.insert(rocks, 'tin-rock')

                    table.insert(resources, 'raw-coal')
                    table.insert(resources, 'ore-tin')
                    table.insert(resources, 'ore-quartz')
                    table.insert(resources, 'ore-nickel')
                    table.insert(resources, 'ore-lead')
                    table.insert(resources, 'ore-chromium')
                    table.insert(resources, 'ore-aluminium')
                    table.insert(resources, 'ore-zinc')
                    table.insert(resources, 'ore-titanium')
                end

                if game.active_mods['pyhightech'] and game.active_mods['pyrawores'] then
                    table.insert(rocks, 'phosphate-rock-02')
                end

                if game.active_mods['pypetroleumhandling'] then
                    table.insert(isresources, 'tar-patch')
                    table.insert(isresources, 'oil-mk01')

                    table.insert(rocks, 'tar-patch')
                    table.insert(rocks, 'oil-mk01')
                    table.insert(rocks, 'oil-mk02')
                    table.insert(rocks, 'oil-mk03')
                    table.insert(rocks, 'oil-mk04')
                    table.insert(rocks, 'sulfur-patch')
                    table.insert(resources, 'oil-sand')
                end

                for _, r in pairs(rocks) do
                    rockset[r] = true
                end
            --log(serpent.block(resources))
            --log(serpent.block(rocks))
            end

            global.resources = resources
            global.rocks = rocks
            global.rockset = rockset
            global.isresources = isresources
            global.osresources = osresources
        end
    end
end
Event.register(Event.core_events.init_and_config, ore_gen.on_configuration_changed)

function ore_gen.on_load()
    if global.resources ~= nil then
        resources = global.resources
        rocks = global.rocks
        rockset = global.rockset
        isresources = global.isresources
        osresources = global.osresources
    end
end
Event.register(Event.core_events.on_load, ore_gen.on_load)

local function nonstartspawn(event)
    local tx = event.area.left_top.x
    local ty = event.area.left_top.y
    local bx = event.area.right_bottom.x
    local by = event.area.right_bottom.y

    local Randx = math.random(tx, bx)
    local Randy = math.random(ty, by)

    local patchdiamiter = math.random(10, 25)
    local oreamount = math.random(1, 4) * 1000

    --spawning resources outside starting area
    --check that pos is outside the 200 tile start zone
    local poscheck = false
    --check if x is to the left or right of start area
    if tx <= -200 or tx >= 200 then
        --if x isnt far enough check if y is above or below start area
        poscheck = true
    elseif ty <= -200 or ty >= 200 then
        poscheck = true
    end
    if poscheck == true then
        --log("not in start area")
        --need to check if ore is rock or ore patch as we want rocks to spwan a lot less than the ore
        --if it passes check it will attempt ore spawn else it will try to spawn a rock
        if math.random(1, 48) <= 1 then
            --get a random ore to spawn
            local tsize = table_size(resources)
            --log(tsize)
            --log(serpent.block(resources))
            local stiles = 0
            local sindex = math.random(1, tsize)
            local randore = resources[sindex]
            --check if resources already exist beofre placing more on top
            local orecheck = game.surfaces['nauvis'].find_entities_filtered {area = {{Randx - 20, Randy - 20}, {Randx + 20, Randy + 20}}, type = 'resource'}
            local hitore = false
            for _, r in pairs(orecheck) do
                if r ~= nil then
                    hitore = true
                end
            end
            if hitore == false then
                if string.find(game.surfaces['nauvis'].get_tile(Randx, Randy).name, 'water') == nil then
                    stiles = stiles + 1
                    if rockset[randore] then
                        oreamount = oreamount * 500
                        game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                    else
                        game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                    end
                end
                if rockset[randore] == nil then
                    --create patches for ores
                    local patchx = Randx - 20
                    local patchy = Randy - 20
                    --log(oreamount)
                    for i = 0, 1600 do
                        --log(patchx..","..patchy)
                        --log("patchx "..patchx)
                        --log("randx "..Randx)
                        --log(math.abs(patchx-Randx))
                        --log(patchdiamiter)
                        if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter + math.random(0, 10) or math.random(1, 3) == 1 then
                            if string.find(game.surfaces['nauvis'].get_tile(patchx, patchy).name, 'water') == nil then
                                stiles = stiles + 1
                                game.surfaces['nauvis'].create_entity {name = randore, position = {patchx, patchy}, amount = oreamount}
                            end
                        end
                        patchx = patchx + 1
                        if patchx == Randx + 20 then
                            patchx = Randx - 20
                            patchy = patchy + 1
                        end
                    end
                end
            end
        elseif math.random(1, 600) <= 1 then
            --get a random ore to spawn
            local tsize = table_size(rocks)
            --log(tsize)
            --log(serpent.block(rocks))
            local sindex = math.random(1, tsize)
            local randore = rocks[sindex]
            --check if resources already exist beofre placing more on top
            local orecheck = game.surfaces['nauvis'].find_entities_filtered {area = {{Randx - 20, Randy - 20}, {Randx + 20, Randy + 20}}, type = 'resource'}
            local hitore = false
            for _, r in pairs(orecheck) do
                if r ~= nil then
                    hitore = true
                end
            end
            if hitore == false then
                if string.find(game.surfaces['nauvis'].get_tile(Randx, Randy).name, 'water') == nil then
                    oreamount = oreamount * 500
                    game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                end
            end
        end
    end
end

function ore_gen.on_chunk_generated(event)
    --log("work damn you")
    --log("yay?")
    if settings.startup['ore-gen'].value then
        if not game.active_mods['rso-mod'] and not game.active_mods['PyCoalTBaA'] and not game.active_mods['PyBlock'] then
            --only do something if pyro or pyph are active_mods
            --log("anything?")
            if game.active_mods['pyrawores'] or game.active_mods['pypetroleumhandling'] then
                --log("generating resources")

                --spawn new randomized resources

                --starting area needs: iron, copper, coal, tin, quartz
                -- need to fit in oil and tar patches
                --outer starting area spawn borax, lead, aluminium

                local tx = event.area.left_top.x
                local ty = event.area.left_top.y
                local bx = event.area.right_bottom.x
                local by = event.area.right_bottom.y

                local Randx = math.random(tx, bx)
                local Randy = math.random(ty, by)

                local patchdiamiter = math.random(10, 25)
                local oreamount = math.random(1, 4) * 1000

                if tx >= -200 and tx <= 200 and ty >= -200 and ty <= 200 then
                    if math.random(1, 6) <= 2 then
                        --is "starting area"
                        if tx >= -100 and tx <= 100 and ty >= -100 and ty <= 100 then
                            --inner start area for needed ores
                            --get a random ore to spawn
                            local tsize = table_size(isresources)
                            --log(tsize)
                            --log(serpent.block(isresources))
                            if tsize > 0 then
                                local stiles = 0
                                local sindex = math.random(1, tsize)
                                local randore = isresources[sindex]
                                --check if resources already exist beofre placing more on top
                                local orecheck = game.surfaces['nauvis'].find_entities_filtered {area = {{Randx - 20, Randy - 20}, {Randx + 20, Randy + 20}}, type = 'resource'}
                                local hitore = false
                                for _, r in pairs(orecheck) do
                                    if r ~= nil then
                                        hitore = true
                                    end
                                end
                                if hitore == false then
                                    if string.find(game.surfaces['nauvis'].get_tile(Randx, Randy).name, 'water') == nil then
                                        stiles = stiles + 1
                                        if rockset[randore] then
                                            oreamount = oreamount * 500
                                            game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                                        else
                                            game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                                        end
                                    end
                                    if rockset[randore] == nil then
                                        --create patches for ores
                                        local patchx = Randx - 20
                                        local patchy = Randy - 20
                                        --log(oreamount)
                                        for i = 0, 1600 do
                                            --log(patchx..","..patchy)
                                            --log("patchx "..patchx)
                                            --log("randx "..Randx)
                                            --log(math.abs(patchx-Randx))
                                            --log(patchdiamiter)
                                            if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter + math.random(0, 10) or math.random(1, 3) == 1 then
                                                if string.find(game.surfaces['nauvis'].get_tile(patchx, patchy).name, 'water') == nil then
                                                    stiles = stiles + 1
                                                    game.surfaces['nauvis'].create_entity {name = randore, position = {patchx, patchy}, amount = oreamount}
                                                end
                                            end
                                            patchx = patchx + 1
                                            if patchx == Randx + 20 then
                                                patchx = Randx - 20
                                                patchy = patchy + 1
                                            end
                                        end
                                    end
                                    if stiles * oreamount > 500000 then
                                        table.remove(isresources, sindex)
                                    end
                                end
                            end
                        end
                        --outer starting area
                        if (tx >= -200 and tx <= -100 and ty >= -200 and ty <= -100) or (tx >= 100 and tx <= 200 and ty >= 100 and ty <= 200) then
                            --inner start area for needed ores
                            --get a random ore to spawn
                            local tsize = table_size(osresources)
                            --log(tsize)
                            --log(serpent.block(osresources))
                            if tsize > 0 then
                                local stiles = 0
                                local sindex = math.random(1, tsize)
                                local randore = osresources[sindex]
                                --check if resources already exist beofre placing more on top
                                local orecheck = game.surfaces['nauvis'].find_entities_filtered {area = {{Randx - 20, Randy - 20}, {Randx + 20, Randy + 20}}, type = 'resource'}
                                local hitore = false
                                for _, r in pairs(orecheck) do
                                    if r ~= nil then
                                        hitore = true
                                    end
                                end
                                if hitore == false then
                                    if string.find(game.surfaces['nauvis'].get_tile(Randx, Randy).name, 'water') == nil then
                                        stiles = stiles + 1
                                        if rockset[randore] then
                                            oreamount = oreamount * 500
                                            game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                                        else
                                            game.surfaces['nauvis'].create_entity {name = randore, position = {Randx, Randy}, amount = oreamount}
                                        end
                                    end
                                    if rockset[randore] == nil then
                                        --create patches for ores
                                        local patchx = Randx - 20
                                        local patchy = Randy - 20
                                        --log(oreamount)
                                        for i = 0, 1600 do
                                            --log(patchx..","..patchy)
                                            --log("patchx "..patchx)
                                            --log("randx "..Randx)
                                            --log(math.abs(patchx-Randx))
                                            --log(patchdiamiter)
                                            if math.abs(patchx - Randx) + math.abs(patchy - Randy) <= patchdiamiter + math.random(0, 10) or math.random(1, 3) == 1 then
                                                if string.find(game.surfaces['nauvis'].get_tile(patchx, patchy).name, 'water') == nil then
                                                    stiles = stiles + 1
                                                    game.surfaces['nauvis'].create_entity {name = randore, position = {patchx, patchy}, amount = oreamount}
                                                end
                                            end
                                            patchx = patchx + 1
                                            if patchx == Randx + 20 then
                                                patchx = Randx - 20
                                                patchy = patchy + 1
                                            end
                                        end
                                    end
                                    if stiles * oreamount > 500000 then
                                        table.remove(osresources, sindex)
                                    end
                                end
                            end
                        end
                    end
                end

                nonstartspawn(event)
            end
        end
    end
end
Event.register(defines.events.on_chunk_generated, ore_gen.on_chunk_generated)
