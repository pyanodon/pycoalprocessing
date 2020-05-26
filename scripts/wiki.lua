local Event = require('__stdlib__/stdlib/event/event')

local function on_init()
    global.wiki = {}
    global.wiki.fluids = {}
    global.wiki.fluid_names = {}
    for _, fluid in pairs(game.fluid_prototypes) do
        --log(serpent.block(fluid.name))
        --log(serpent.block(fluid.fuel_value))
        if fluid.fuel_value ~= nil and fluid.fuel_value ~= 0 then
        global.wiki.fluids[fluid.name] = fluid.fuel_value
        end
    end
    for k,v in pairs(global.wiki.fluids) do
        table.insert(global.wiki.fluid_names, k)
    end
    log(serpent.block(global.wiki.fluid_names))
    table.sort(global.wiki.fluid_names)
    log(serpent.block(global.wiki.fluid_names))
    global.have_gui = false
end
Event.register(Event.core_events.init_and_config, on_init)

local function on_player_created(event)
    if global.have_gui == false then
    local player = game.players[event.player_index]
    local wiki = player.gui.top.add(
        {
            type = 'frame',
            name = 'pywiki_frame',
            style = 'invisible_frame'
        }
    )
    wiki.add(
        {
            type = 'sprite-button',
            name = 'pywiki',
            sprite = 'pywiki'
        }
    )
    global.have_gui = true
    end
end
Event.register(defines.events.on_player_created, on_player_created)

local function on_1th_tick()
    if global.have_gui == false then
    for i, _ in pairs(game.players) do
        local player = game.players[i]
        if player.gui.top.pywiki_frame == nil then
            local wiki = player.gui.top.add(
                {
                    type = 'frame',
                    name = 'pywiki_frame',
                    style = 'invisible_frame'
                }
            )
            wiki.add(
                {
                    type = 'sprite-button',
                    name = 'pywiki',
                    sprite = 'pywiki'
                }
            )
        end
    end
    global.have_gui = true
end
end
Event.register(-1, on_1th_tick)

local function on_click(event)

    local player = game.players[event.player_index]

    if event.element.name == 'pywiki' then
        local wiki_gui = player.gui.screen
        --wiki_gui.clear()
        wiki_gui.add
            {
                type = 'frame',
                name = 'wiki_frame'
            }
        local wiki_pane = wiki_gui.wiki_frame.add
            {
                type = 'tabbed-pane',
                name = 'wiki_pane'
            }
        
        local tab1 = wiki_pane.add(
            {
                type = 'tab',
                name = 'faq_tab',
                caption = 'FAQ'
            }
        )
        local tab2 = wiki_pane.add(
            {
                type = 'tab',
                name = 'fluid_tab',
                caption = 'Fluid Fuel Values'
            }
        )
        local tab_fluids = wiki_pane.add
            {
                type = 'scroll-pane',
                name = 'scroll',
                style = 'inventory_scroll_pane'
            }
        wiki_gui.wiki_frame.wiki_pane.scroll.style.maximal_height = 500
        local test_label = wiki_pane.add
            {
                type = 'label',
                caption = 'test'
            }
        wiki_pane.add_tab(tab1, test_label)
        wiki_pane.add_tab(tab2, tab_fluids)
        wiki_gui.wiki_frame.add(
            {
                type = "sprite-button",
                name = "wiki_close",
                sprite = "utility/close_fat"
            }
        )
        wiki_gui.wiki_frame.wiki_pane.scroll.add
            {
                type = 'frame',
                name = 'fluid_page',
                caption = 'Fluids with fuel value',
                direction = "vertical"
            }
        for f, fluid in pairs(global.wiki.fluid_names) do
            wiki_gui.wiki_frame.wiki_pane.scroll.fluid_page.add(
                {
                    type = 'frame',
                    name = 'fluid_frame'.. fluid,
                    caption = game.fluid_prototypes[fluid].localised_name,
                    direction = "horizontal"
                }
            )
            wiki_gui.wiki_frame.wiki_pane.scroll.fluid_page['fluid_frame'.. fluid].add(
            {
                type = 'sprite',
                name = fluid,
                sprite = 'fluid/' .. fluid,
                caption = game.fluid_prototypes[fluid].localised_name
            }
            )
            local num
            local fluid_num = global.wiki.fluids[fluid]
            if fluid_num >= 1000 then
                num = fluid_num/1000 .. 'KJ'
            elseif fluid >= 100000 then
                num = fluid_num/1000000 .. 'MJ'
            end
            wiki_gui.wiki_frame.wiki_pane.scroll.fluid_page['fluid_frame'.. fluid].add(
            {
                type = 'frame',
                name = fluid .. 'fluid_value',
                caption = num
            }
            )
        end
        wiki_gui.wiki_frame.force_auto_center()
    elseif event.element.name == 'wiki_close' then
        local wiki_gui = event.element.parent.parent
        wiki_gui.clear()
        --[[
        wiki_gui.add(
            {
                type = 'sprite-button',
                name = 'pywiki',
                sprite = 'pywiki'
            }
        )
        ]]--
    end
end
Event.register(defines.events.on_gui_click, on_click)
