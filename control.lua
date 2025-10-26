require "__pypostprocessing__.lib"

require "scripts.wiki.wiki"
require "scripts.wiki.text-pages"
require "scripts.wiki.spreadsheet-pages"
require "scripts.wiki.statistics-page"

require "scripts.tailings-pond"
require "scripts.beacons"
require "scripts.milestones"
require "scripts.generator-equipment-autofill"
require "scripts.programmable-inserter"

py.on_event(py.events.on_init(), function()
    for _, interface in pairs {"silo_script", "better-victory-screen"} do
        if remote.interfaces[interface] and remote.interfaces[interface]["set_no_victory"] then
            remote.call(interface, "set_no_victory", true)
        end
    end

    if remote.interfaces["freeplay"] then
        local created_items = remote.call("freeplay", "get_created_items")
        created_items["burner-mining-drill"] = 10
        remote.call("freeplay", "set_created_items", created_items)

        local debris_items = remote.call("freeplay", "get_debris_items")
        debris_items["iron-plate"] = 100
        debris_items["copper-plate"] = 50
        remote.call("freeplay", "set_debris_items", debris_items)
    end
end)

py.on_event(defines.events.on_research_finished, function(event)
    if storage.finished then return end
    local tech = event.research
    if tech.name == "pyrrhic" and game.tick ~= 0 then
        local force = tech.force
        for _, player in pairs(game.connected_players) do
            if player.force == force then player.opened = nil end
        end

        storage.finished = true
        if remote.interfaces["better-victory-screen"] and remote.interfaces["better-victory-screen"]["trigger_victory"] then
            remote.call("better-victory-screen", "trigger_victory", force)
        else
            game.set_game_state {
                game_finished = true,
                player_won = true,
                can_continue = true,
                victorious_force = force
            }
        end
    end
end)

py.on_event(defines.events.on_pre_build, function(event)
    Beacons.events.on_pre_build(event)
end)

py.on_event(py.events.on_built(), function(event)
    Beacons.events.on_built(event)
    Pond.events.on_built(event)
end)

py.on_event(py.events.on_destroyed(), Beacons.events.on_destroyed)

py.on_event(defines.events.on_entity_died, function(event)
    Pond.events.on_entity_died(event)
    Beacons.events.on_destroyed(event)
end)

py.on_event(defines.events.on_entity_settings_pasted, function(event)
    Beacons.events.on_entity_settings_pasted(event)
end)

py.on_event(defines.events.on_gui_opened, function(event)
    Beacons.events.on_gui_opened(event)
end)

py.on_event({defines.events.on_gui_closed, defines.events.on_player_changed_surface}, function(event)
    Wiki.events.on_gui_closed(event)
end)

py.on_event(defines.events.on_player_created, function(event)
    Wiki.events.on_player_created(event)

    local player = game.get_player(event.player_index)
    if not player.valid then return end
    local nauvis = game.surfaces["nauvis"]
    if not nauvis then return end

    local autoplace = nauvis.map_gen_settings.autoplace_controls

    if not script.active_mods["PyBlock"] and not script.active_mods["pystellarexpedition"] and autoplace.stone and autoplace.stone.richness <= 1 then
        player.print {"messages.warning-no-preset", {"map-gen-preset-name.py-recommended"}}
    end

    if autoplace["enemy-base"] and autoplace["enemy-base"].size > 0 then
        player.print {"messages.warning-biters"}
    end

    if script.active_mods.quality and not script.active_mods.pystellarexpedition then
        player.print {"messages.warning-quality"}
    end

    if not script.active_mods.FNEI and not script.active_mods["RecipeBook"] then
        player.print {"messages.warning-recipe-book"}
    end
end)

py.register_on_nth_tick(153, "pond153", "pycp", Pond.events[153])
py.register_on_nth_tick(154, "pond154", "pycp", Pond.events[154])

-- grumble grumble filters apply for the whole mod
for _, event in pairs {defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_built, defines.events.script_raised_revive} do
    script.set_event_filter(event, {
        {
            filter = "type",
            type = "inserter",
        },
        {
            filter = "type",
            type = "storage-tank",
            mode = "or"
        },
        {
            filter = "name",
            name = "tailings-pond",
            mode = "or"
        },
        {
            filter = "type",
            type = "beacon",
            mode = "or"
        },
    })
end

py.on_event(defines.events.on_tick, function(event)
    local func_list = remote.call("on_nth_tick", "query", "pycp", event.tick)
    for _, func in pairs(func_list) do
        py.mod_nth_tick_funcs[func]()
    end
end)

-- this is also on_configuration_changed, for reasons
py.on_event(py.events.on_init(), function(changedata)
    if not changedata then return end -- on_init, don't care
    log(serpent.block(changedata))
    local quality = (changedata.mod_changes or {}).quality
    if quality and not quality.old_version and not script.active_mods.pystellarexpedition then
        game.print {"messages.warning-quality"}
    end
end)

py.on_event(py.events.on_init(), function()
    for _, force in pairs(game.forces) do
        -- https://github.com/pyanodon/pybugreports/issues/780
        force.technologies["hidden-mining-fluid-autounlock"].researched = true

        -- https://github.com/pyanodon/pybugreports/issues/453
        force.technologies["electronics"].enabled = true
        if force.technologies["gate"] and force.technologies["gate"].researched then
            force.technologies["electronics"].researched = true
        end
        force.technologies["railway"].enabled = true
        if force.technologies["automated-rail-transportation"] and force.technologies["automated-rail-transportation"].researched then
            force.technologies["railway"].researched = true
        end
    end
end)

py.finalize_events()
