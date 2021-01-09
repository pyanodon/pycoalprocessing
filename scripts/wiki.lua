local Event = require('__stdlib__/stdlib/event/event')

local pyal_wiki
local pyal_faq_wiki

if script.active_mods['pyalienlife'] then
    pyal_wiki = require('__pyalienlife__/wiki/biomass')
    pyal_faq_wiki = require('__pyalienlife__/wiki/turd')
end

local pyph_wiki

if script.active_mods['pypetroleumhandling'] then
    pyph_wiki = require('__pypetroleumhandling__/wiki/oil')
end

local function on_init()
    global.wiki = {}
    global.wiki.fluids = {}
    global.wiki.fluid_names = {}
    global.wiki.items = {}
    global.wiki.item_names = {}
    for _, fluid in pairs(game.fluid_prototypes) do
        --log(serpent.block(fluid.name))
        --log(serpent.block(fluid.fuel_value))
        if fluid.fuel_value ~= nil and fluid.fuel_value ~= 0 then
        global.wiki.fluids[fluid.name] = fluid.fuel_value
        end
    end
    for k,_ in pairs(global.wiki.fluids) do
        table.insert(global.wiki.fluid_names, k)
    end
    for _, item in pairs(game.item_prototypes) do
        if item.fuel_value ~= nil and item.fuel_value ~= 0 then
            global.wiki.items[item.name] = item.fuel_value
        end
    end
    for k,_ in pairs(global.wiki.items) do
        table.insert(global.wiki.item_names, k)
    end
    --log(serpent.block(global.wiki.fluid_names))
    table.sort(global.wiki.fluid_names)
    table.sort(global.wiki.item_names)
    --log(serpent.block(global.wiki.fluid_names))
    global.have_gui = false
    global.topics = {}
    global.titles = {}
    if script.active_mods['pypetroleumhandling'] then
    global.topics[pyph_wiki.title] = pyph_wiki.body
    --log(serpent.block(global.topics))
    table.insert(global.titles, pyph_wiki.title)
    --log(serpent.block(global.titles))
    end
    if script.active_mods['pyalienlife'] then
        global.topics[pyal_faq_wiki.title] = pyal_faq_wiki.body
        table.insert(global.titles, pyal_faq_wiki.title)
    end
    table.sort(global.topics)
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

local function faq(wiki)

    local faq_main = wiki.add(
        {
            type = 'flow',
            name = 'faq_flow',
            direction = 'horizontal'
        }
    )
    local topics = faq_main.add(
        {
            type = 'frame',
            name = 'topic_frame',
            direction = 'vertical'
        }
    )
    --topics.style.width = 300
    local body = faq_main.add(
        {
            type = 'frame',
            name = 'body_frame',
            direction = 'vertical'
        }
    )
    body.style.width = 700
    if next(global.titles) ~= nil then
        for t, title in pairs(global.titles) do
            --log(t)
            --log(title)
            topics.add(
                {
                    type = 'button',
                    name = title .. '_button',
                    caption = {"wiki-info." .. title}
                }
            )
        end
    end
return faq_main
end

local function topic(tab, button)
    if tab.body_frame ~= nil then
        tab.body_frame.clear()
        --log(tab.parent.name)
        local body = tab.body_frame.add(
            {
                type = 'label',
                name = 'details',
                caption = {'wiki-info.' .. global.topics[string.match(button.name, '[^_]+')]}
            }
        )
        body.style.single_line = false
    end
end

local function on_click(event)

    local player = game.players[event.player_index]

    if event.element.name == 'pywiki' then
        local wiki_gui = player.gui.screen
        --log(serpent.block(player.gui.screen))
        if wiki_gui.wiki_frame == nil then
            wiki_gui.add(
                {
                    type = 'frame',
                    name = 'wiki_frame'
                }
            )
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
            local test_label = faq(wiki_pane)
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
            local tab3 = wiki_pane.add(
                {
                    type = 'tab',
                    name = 'item_tab',
                    caption = 'Item Fuel Values'
                }
            )
            local tab_items = wiki_pane.add
                {
                    type = 'scroll-pane',
                    name = 'scroll_items',
                    style = 'inventory_scroll_pane'
                }
            wiki_gui.wiki_frame.wiki_pane.scroll.style.maximal_height = 500
            wiki_gui.wiki_frame.wiki_pane.scroll_items.style.maximal_height = 500
            wiki_pane.add_tab(tab1, test_label)
            wiki_pane.add_tab(tab2, tab_fluids)
            wiki_pane.add_tab(tab3, tab_items)
            wiki_gui.wiki_frame.add(
                {
                    type = "sprite-button",
                    name = "wiki_close",
                    sprite = "utility/close_fat"
                }
            )

            --fluid fuel values
            wiki_gui.wiki_frame.wiki_pane.scroll.add
                {
                    type = 'frame',
                    name = 'fluid_page',
                    caption = 'Fluids with fuel value',
                    direction = "vertical"
                }
            for _, fluid in pairs(global.wiki.fluid_names) do
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
                if fluid_num >= 1000 and fluid_num < 100000 then
                    num = fluid_num/1000 .. 'KJ'
                elseif fluid_num >= 100000 then
                    num = fluid_num/1000000 .. 'MJ'
                end
                wiki_gui.wiki_frame.wiki_pane.scroll.fluid_page['fluid_frame'.. fluid].add(
                {
                    type = 'label',
                    name = fluid .. 'fluid_value',
                    caption = num,
                    --style = 'invisible_frame'
                }
                )
            end

            --item fuel values
            wiki_gui.wiki_frame.wiki_pane.scroll_items.add
                {
                    type = 'frame',
                    name = 'item_page',
                    caption = 'Items with fuel value',
                    direction = "vertical"
                }
            for _, item in pairs(global.wiki.item_names) do
                wiki_gui.wiki_frame.wiki_pane.scroll_items.item_page.add(
                    {
                        type = 'frame',
                        name = 'item_frame'.. item,
                        caption = game.item_prototypes[item].localised_name,
                        direction = "horizontal"
                    }
                )
                wiki_gui.wiki_frame.wiki_pane.scroll_items.item_page['item_frame'.. item].add(
                {
                    type = 'sprite',
                    name = item,
                    sprite = 'item/' .. item,
                    caption = game.item_prototypes[item].localised_name
                }
                )
                local num
                local item_num = global.wiki.items[item]
                if item_num >= 1000 and item_num < 100000 then
                    num = item_num/1000 .. 'KJ'
                elseif item_num >= 100000 then
                    num = item_num/1000000 .. 'MJ'
                end
                wiki_gui.wiki_frame.wiki_pane.scroll_items.item_page['item_frame'.. item].add(
                {
                    type = 'label',
                    name = item .. 'item_value',
                    caption = num,
                    --style = 'invisible_frame'
                }
                )
            end

            --pyal
            wiki_gui.wiki_frame.force_auto_center()
            if pyal_wiki ~= nil then
                --local og_list, name_data, input_data, output_data = remote.call('data_puller', 'order_biolist')
                local og_list, name_data = remote.call('data_puller', 'order_biolist')
                --log(serpent.block(og_list))
                --log(serpent.block(name_data))
                --log(serpent.block(input_data))
                --log(serpent.block(output_data))
                pyal_wiki.biomass(wiki_pane, og_list, name_data)
            end
        end
    elseif event.element.name == 'wiki_close' then
        local wiki_gui = player.gui.screen.wiki_frame
        if wiki_gui ~= nil then
            --log(wiki_gui.parent.name)
            wiki_gui.destroy()
        end
    elseif global.topics[string.match(event.element.name, '[^_]+')] ~= nil then
        --log(string.match(event.element.name, '[^_]+'))
        --log('hit')
        if event.element.parent ~= nil and event.element.parent.parent ~= nil then
            topic(event.element.parent.parent,event.element)
        end
    end
end
Event.register(defines.events.on_gui_click, on_click)
