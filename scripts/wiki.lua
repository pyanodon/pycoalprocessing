local Event = require('__stdlib__/stdlib/event/event')

local pyal_wiki
--local pyal_faq_wiki

if script.active_mods['pyalienlife'] then
    pyal_wiki = require('__pyalienlife__/wiki/biomass')
    --pyal_faq_wiki = require('__pyalienlife__/wiki/turd')
end

--local pyph_wiki

--if script.active_mods['pypetroleumhandling'] then pyph_wiki = require('__pypetroleumhandling__/wiki/oil') end

local function on_init()
    global.wiki = {}
    global.wiki.fluids = {}
    global.wiki.fluid_names = {}
    global.wiki.items = {}
    global.wiki.item_names = {}
    for _, fluid in pairs(game.fluid_prototypes) do
        -- log(serpent.block(fluid.name))
        -- log(serpent.block(fluid.fuel_value))
        if fluid.fuel_value ~= nil and fluid.fuel_value ~= 0 then
            global.wiki.fluids[fluid.name] = fluid.fuel_value
        end
    end
    for k, _ in pairs(global.wiki.fluids) do table.insert(global.wiki.fluid_names, k) end
    for _, item in pairs(game.item_prototypes) do
        if item.fuel_value ~= nil and item.fuel_value ~= 0 then global.wiki.items[item.name] = item.fuel_value end
    end
    for k, _ in pairs(global.wiki.items) do table.insert(global.wiki.item_names, k) end
    -- log(serpent.block(global.wiki.fluid_names))
    table.sort(global.wiki.fluid_names)
    table.sort(global.wiki.item_names)
    -- log(serpent.block(global.wiki.fluid_names))
    global.have_gui = false
    global.topics = {}
    global.titles = {}
    --[[
    if script.active_mods['pypetroleumhandling'] then
        global.topics[pyph_wiki.title] = pyph_wiki.body
        -- log(serpent.block(global.topics))
        table.insert(global.titles, pyph_wiki.title)
        -- log(serpent.block(global.titles))
    end
    if script.active_mods['pyalienlife'] then
        global.topics[pyal_faq_wiki.title] = pyal_faq_wiki.body
        table.insert(global.titles, pyal_faq_wiki.title)
    end
    ]]--
    table.sort(global.topics)
end
Event.register(Event.core_events.init_and_config, on_init)

local function on_player_created(event)
    if global.have_gui == false then
        local player = game.players[event.player_index]
        local wiki = player.gui.top.add({type = 'frame', name = 'pywiki_frame', style = 'invisible_frame'})
        wiki.add({type = 'sprite-button', name = 'pywiki', sprite = 'pywiki'})
        global.have_gui = true
    end
end
Event.register(defines.events.on_player_created, on_player_created)

local function on_1th_tick()
    if global.have_gui == false then
        for i, _ in pairs(game.players) do
            local player = game.players[i]
            if player.gui.top.pywiki_frame == nil then
                local wiki = player.gui.top.add({type = 'frame', name = 'pywiki_frame', style = 'invisible_frame'})
                wiki.add({type = 'sprite-button', name = 'pywiki', sprite = 'pywiki'})
            end
        end
        global.have_gui = true
    end
end
Event.register(-1, on_1th_tick)

--[[
local function faq(wiki)

    local faq_main = wiki.add({type = 'flow', name = 'faq_flow', direction = 'horizontal'})
    local topics = faq_main.add({type = 'frame', name = 'topic_frame', direction = 'vertical'})
    -- topics.style.width = 300
    local body = faq_main.add({type = 'frame', name = 'body_frame', direction = 'vertical'})
    body.style.width = 700
    if next(global.titles) ~= nil then
        for t, title in pairs(global.titles) do
            -- log(t)
            -- log(title)
            topics.add({type = 'button', name = title .. '_button', caption = {'wiki-info.' .. title}})
        end
    end
    return faq_main
end
]]--

local function topic(tab, button)
    if tab.body_frame ~= nil then
        tab.body_frame.clear()
        -- log(tab.parent.name)
        local body = tab.body_frame.add({
            type = 'label',
            name = 'details',
            caption = {'wiki-info.' .. global.topics[string.match(button.name, '[^_]+')]}
        })
        body.style.single_line = false
    end
end

local function set_fuel_table_style_and_header(fuel_table)
    -- table formatting
    fuel_table.style.column_alignments[1] = "center"
    fuel_table.style.column_alignments[3] = "center"
    fuel_table.style.left_cell_padding = 5
    fuel_table.style.right_cell_padding = 5
    fuel_table.style.horizontally_stretchable = true

    -- header section
    fuel_table.add{type = 'label', caption = 'Sort by'}
    fuel_table.add{type = 'textfield', text = 'search'}
    fuel_table.add{type = 'sprite-button', sprite = 'fluid/combustion-mixture1'}
    fuel_table.add{type = "label", caption = "Burnt Result"}
end

local function set_vent_table_style_and_header(vent_table)
    -- table formatting
    vent_table.style.column_alignments[1] = "center"
    vent_table.style.left_cell_padding = 5
    vent_table.style.right_cell_padding = 5
    vent_table.style.horizontally_stretchable = true

    -- header section
    vent_table.add{type = 'label', caption = 'Sort by'}
    vent_table.add{type = 'textfield', text = 'search'}
end

local function get_formatted_fuel_value(fuel_value)
    local formatted_fuel_value = fuel_value .. 'J'
    if fuel_value >= 1000 and fuel_value < 500000 then
        formatted_fuel_value = fuel_value / 1000 .. 'kJ'
    elseif fuel_value >= 500000 then
        formatted_fuel_value = fuel_value / 1000000 .. 'MJ'
    end
    return formatted_fuel_value
end

local function add_table_line_fuel(fuel_table, item, item_type, fuel_value)
    fuel_table.add{type = 'sprite', sprite = item_type .. '/' .. item}
    fuel_table.add{type = "label", caption = game[item_type .. '_prototypes'][item].localised_name}
    fuel_table.add{type = "label", caption = get_formatted_fuel_value(fuel_value)}
    if item_type == "item" then
        if game["item_prototypes"][item].burnt_result then
            fuel_table.add{type = "label", caption = game["item_prototypes"][game["item_prototypes"][item].burnt_result.name].localised_name}
            return
        end
    end
    fuel_table.add{type = "label", caption = ""}
end

local function add_table_line_disposables(disposable_table, item)
    disposable_table.add{type = 'sprite', sprite = 'fluid/' .. item}
    disposable_table.add{type = "label", caption = game['fluid_prototypes'][item].localised_name}
end

local function on_click(event)

    local player = game.players[event.player_index]

    if event.element.name == 'pywiki' then
        local wiki_gui = player.gui.screen
        --log(serpent.block(player.gui.screen))
        if wiki_gui.wiki_frame == nil then
            wiki_gui.add({type = 'frame', name = 'wiki_frame'})
            local wiki_pane = wiki_gui.wiki_frame.add{type = 'tabbed-pane', name = 'wiki_pane'}

            local tab1 = wiki_pane.add({type = 'tab', name = 'faq_tab', caption = 'FAQ'})

            --local test_label = faq(wiki_pane)

            local tab2 = wiki_pane.add({type = 'tab', name = 'fluid_tab', caption = 'Fluid Fuel Values'})
            local tab_fluids = wiki_pane.add{
                type = 'frame',
                name = 'fluids_fuel_frame',
                caption = 'Fluids with fuel value',
                style = 'invisible_frame',
                direction = 'vertical'
            }

            local tab3 = wiki_pane.add({type = 'tab', name = 'item_tab', caption = 'Item Fuel Values'})
            local tab_items = wiki_pane.add{
                type = 'frame',
                name = 'items_fuel_frame',
                caption = 'Items with fuel value',
                style = 'invisible_frame',
                direction = 'vertical'
            }

            local tab4 = wiki_pane.add({type = 'tab', name = 'gasvent_tab', caption = 'Gasses - Gas vent'})
            local tab_gasvent = wiki_pane.add{
                type = 'frame',
                name = 'vent_frame',
                caption = 'Gasses that can be vented in the gas vent',
                style = 'invisible_frame',
                direction = 'vertical'
            }

            local tab5 = wiki_pane.add({type = 'tab', name = 'sinkhole_tab', caption = 'Fluids - Sinkhole'})
            local tab_sinkhole = wiki_pane.add{
                type = 'frame',
                name = 'sinkhole_frame',
                caption = 'Fluids that can be dumped in a sinkhole',
                style = 'invisible_frame',
                direction = 'vertical'
            }

            --wiki_pane.add_tab(tab1, test_label)
            wiki_pane.add_tab(tab2, tab_fluids)
            wiki_pane.add_tab(tab3, tab_items)
            wiki_pane.add_tab(tab4, tab_gasvent)
            wiki_pane.add_tab(tab5, tab_sinkhole)
            wiki_gui.wiki_frame.add({type = 'sprite-button', name = 'wiki_close', sprite = 'utility/close_fat'})

            -- FUEL FLUIDS TAB --
            local fluid_scroll = wiki_gui.wiki_frame.wiki_pane.fluids_fuel_frame.add{
                type="scroll-pane",
                name="fluid_scroll",
                vertical_scroll_policy="always",
            }
            local fluids_fuel_table = fluid_scroll.add{
                type="table",
                name="fluids_fuel_table",
                column_count=4
            }

            set_fuel_table_style_and_header(fluids_fuel_table)
            for _, fluid in pairs(global.wiki.fluid_names) do
                add_table_line_fuel(fluids_fuel_table, fluid, 'fluid', global.wiki.fluids[fluid])
            end

            -- FUEL ITEMS TAB --
            local item_scroll = wiki_gui.wiki_frame.wiki_pane.items_fuel_frame.add{
                type="scroll-pane",
                name="item_scroll",
                vertical_scroll_policy="always",
            }
            local items_fuel_table = item_scroll.add{
                type="table",
                name="items_fuel_table",
                column_count=4
            }

            set_fuel_table_style_and_header(items_fuel_table)
            for _, item in pairs(global.wiki.item_names) do
                add_table_line_fuel(items_fuel_table, item, 'item', global.wiki.items[item])
            end

            -- VENTING/SINKHOLE TAB --
            if script.active_mods['pyindustry'] then
                local gases = {}
                local liquids = {}
                for fluid_name, fluid in pairs(game.fluid_prototypes) do
                    if not fluid.hidden then
                        if (fluid.default_temperature or 15) < (fluid.gas_temperature or math.huge) then
                            liquids[fluid_name] = fluid
                        else
                            gases[fluid_name] = fluid
                        end
                    end
                end

                -- Gas vent
                local vent_scroll = wiki_gui.wiki_frame.wiki_pane.vent_frame.add{
                    type="scroll-pane",
                    name="vent_scroll",
                    vertical_scroll_policy="always",
                }
                local vent_table = vent_scroll.add{
                    type="table",
                    name="vent_table",
                    column_count=2
                }
                set_vent_table_style_and_header(vent_table)
                for gas, _ in pairs(gases) do
                    add_table_line_disposables(vent_table, gas)
                end

                -- Sink hole
                local sinkhole_scroll = wiki_gui.wiki_frame.wiki_pane.sinkhole_frame.add{
                    type="scroll-pane",
                    name="sinkhole_scroll",
                    vertical_scroll_policy="always",
                }
                local sinkhole_table = sinkhole_scroll.add{
                    type="table",
                    name="sinkhole_table",
                    column_count=2
                }
                set_vent_table_style_and_header(sinkhole_table)
                for liquid, _ in pairs(liquids) do
                    add_table_line_disposables(sinkhole_table, liquid)
                end
            end

            -- PY ALIEN LIFE --
            wiki_gui.wiki_frame.force_auto_center()
            if pyal_wiki ~= nil then
                -- local og_list, name_data, input_data, output_data = remote.call('data_puller', 'order_biolist')
                local og_list, name_data = remote.call('data_puller', 'order_biolist')
                -- log(serpent.block(og_list))
                -- log(serpent.block(name_data))
                -- log(serpent.block(input_data))
                -- log(serpent.block(output_data))
                pyal_wiki.biomass(wiki_pane, og_list, name_data)
            end
        end
    elseif event.element.name == 'wiki_close' then
        local wiki_gui = player.gui.screen.wiki_frame
        if wiki_gui ~= nil then
            -- log(wiki_gui.parent.name)
            wiki_gui.destroy()
        end
    elseif global.topics[string.match(event.element.name, '[^_]+')] ~= nil then
        --log(string.match(event.element.name, '[^_]+'))
        --log('hit')
        if event.element.parent ~= nil and event.element.parent.parent ~= nil then
            topic(event.element.parent.parent, event.element)
        end
    end
end
Event.register(defines.events.on_gui_click, on_click)
