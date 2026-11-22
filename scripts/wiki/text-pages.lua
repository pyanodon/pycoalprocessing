py.on_event(py.events.on_init(), function()
    for _, player in pairs(game.players) do
        Wiki.create_pywiki_button(player)
    end
    storage.wiki_pages = {}
    storage.currently_opened_wiki_page = {}
    storage.wiki_page_search_query = {}

    remote.call("pywiki", "add_page", {
        name = "statistics",
        remote = {"create_statistics_page", "create_statistics_page"}
    })

    remote.call("pywiki", "add_page", {
        name = "fluid-index",
        remote = {"pywiki_spreadsheets", "create_fluid_page"},
        searchable = {"pywiki_spreadsheets", "on_search"}
    })

    remote.call("pywiki", "add_page", {
        name = "item-index",
        remote = {"pywiki_spreadsheets", "create_solid_fuel_page"},
        searchable = {"pywiki_spreadsheets", "on_search"}
    })

    if script.active_mods["pyalternativeenergy"] and script.feature_flags.spoiling and settings.startup["py-enable-decay"].value then
        remote.call("pywiki", "add_page", {
            name = "decay",
            remote = {"pywiki_spreadsheets", "create_decay_page"},
            searchable = {"pywiki_spreadsheets", "on_search"}
        })
    end

    remote.call("pywiki", "add_section", "coalprocessing")

    remote.call("pywiki", "add_page", {
        name = "ash",
        section = "coalprocessing",
        text_only = true
    })

    remote.call("pywiki", "add_page", {
        name = "mechanical-inserter",
        section = "coalprocessing",
        text_only = true
    })

    remote.call("pywiki", "add_page", {
        name = "tailings-pond",
        section = "coalprocessing",
        text_only = true
    })

    remote.call("pywiki", "add_page", {
        name = "beacon",
        section = "coalprocessing",
        text_only = true
    })

    if not script.active_mods["pyalternativeenergy"] then
        remote.call("pywiki", "add_page", {
            name = "combustion-mixture",
            section = "coalprocessing",
            text_only = true
        })
    end
end)
