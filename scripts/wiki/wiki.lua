Wiki = {}

local Event = require('__stdlib__/stdlib/event/event')
local Gui = require('__stdlib__/stdlib/event/gui')
local mod_gui = require('mod-gui')

function Wiki.create_pywiki_button(player)
    local flow = mod_gui.get_button_flow(player)
    if flow.py_open_wiki then return end
    flow.add{type = 'sprite-button', name = 'py_open_wiki', sprite = 'pywiki'}
end

Event.register(Event.core_events.init_and_config, function()
    for _, player in pairs(game.players) do
        Wiki.create_pywiki_button(player)
    end
    global.wiki_pages = {}
    global.currently_opened_wiki_page = {}
    global.wiki_page_search_query = {}
end)

Event.register(defines.events.on_player_created, function(event)
    Wiki.create_pywiki_button(game.get_player(event.player_index))
end)

function Wiki.get_wiki_gui(player) return player.gui.screen.pywiki end
function Wiki.get_pages(player) local gui = Wiki.get_wiki_gui(player); if gui then return gui.content_flow.py_pages_list end end
function Wiki.get_page_contents(player) local gui = Wiki.get_wiki_gui(player); if gui then return gui.content_flow.page_frame.scroll_pane end end
function Wiki.get_page_title(player) local gui = Wiki.get_wiki_gui(player); if gui then return gui.content_flow.page_frame.subheader_frame end end
function Wiki.get_page_searchbar(player) local gui = Wiki.get_wiki_gui(player); if gui then return gui.caption_flow.py_wiki_search end end

function Wiki.open_wiki(player)
    player.opened = nil
    local main_frame = player.gui.screen.add{type = 'frame', name = 'pywiki', direction = 'vertical'}
    player.opened = main_frame
    if not main_frame.valid then game.print('ERROR: The pY codex failed to open.'); return end
    main_frame.auto_center = true
	main_frame.style.width = 1050
	main_frame.style.minimal_height = 700

    local caption_flow = main_frame.add{type = 'flow', direction = 'horizontal', name = 'caption_flow'}
    caption_flow.drag_target = main_frame
    caption_flow.style.vertical_align = 'center'
    caption_flow.style.horizontal_spacing = 10
    caption_flow.add{type = 'sprite', sprite = 'pywiki-alt', resize_to_sprite = false}.style.size = {32, 32}
    caption_flow.add{type = 'label', caption = {'pywiki-sections.title'}, style = 'frame_title', ignored_by_interaction = true}
    local caption_spacing = caption_flow.add{type = 'empty-widget', style = 'draggable_space_header', ignored_by_interaction = true}
    caption_spacing.style.height = 24
    caption_spacing.style.right_margin = 4
    caption_spacing.style.horizontally_stretchable = true
    local py_wiki_search = caption_flow.add{name = 'py_wiki_search', type = 'textfield', style = 'titlebar_search_textfield', clear_and_focus_on_right_click = true}
    py_wiki_search.style.right_margin = -5
    py_wiki_search.style.width = 200
    py_wiki_search.visible = false
    py_wiki_search.text = global.wiki_page_search_query[player.index] or ''
    caption_flow.add{name = 'py_wiki_search_button', type = 'sprite-button', style = 'frame_action_button_always_on', sprite = 'utility/search_black'}.visible = false
    caption_flow.add{name = 'py_close_wiki', type = 'sprite-button', style = 'frame_action_button', sprite = 'utility/close_white', hovered_sprite = 'utility/close_black', clicked_sprite = 'utility/close_black'}

	local content_flow = main_frame.add{type = 'flow', name = 'content_flow', direction = 'horizontal'}
	content_flow.style.horizontal_spacing = 8

    local items = {}
    local contents = {}
    for _, page in pairs(global.wiki_pages) do
        if page.is_section then
            items[#items + 1] = {'', '[font=default-semibold][color=255,230,192]', {'pywiki-sections.' .. page.name}, '[/color][/font]'}
            contents[#contents + 1] = page
            for _, page in pairs(page.pages) do
                items[#items + 1] = {'', '\t\t', {'pywiki-sections.' .. page.name}}
                contents[#contents + 1] = page
            end
        else
            items[#items + 1] = {'pywiki-sections.' .. page.name}
            contents[#contents + 1] = page
        end
    end
    local pages = content_flow.add{type = 'list-box', items = items, name = 'py_pages_list'}
    pages.style.vertically_stretchable = true
    pages.style.width = 240
    pages.tags = {contents = contents}

    local page_frame = content_flow.add{type = 'frame', name = 'page_frame', direction = 'vertical', style = 'inside_deep_frame'}
    local subheader_frame = page_frame.add{type = 'frame', name = 'subheader_frame', style = 'subheader_frame_with_text_on_the_right'}
    subheader_frame.style.horizontally_stretchable = true
    local scroll_pane = page_frame.add{type = 'scroll-pane', name = 'scroll_pane', horizontal_scroll_policy = 'never', vertical_scroll_policy = 'auto-and-reserve-space', style = 'text_holding_scroll_pane'}
    scroll_pane.style.width = 780
    scroll_pane.style.vertically_stretchable = true

    Wiki.open_page(player, global.currently_opened_wiki_page[player.index] or 1)
end

function Wiki.close_wiki(player)
    local main_frame = Wiki.get_wiki_gui(player)
    if main_frame then main_frame.destroy() end
end

Gui.on_click('py_open_wiki', function(event)
    local player = game.get_player(event.player_index)
    if Wiki.get_wiki_gui(player) then
        Wiki.close_wiki(player)
    else
        Wiki.open_wiki(player)
    end
end)

local close_wiki = function(event) Wiki.close_wiki(game.get_player(event.player_index)) end
Event.register(defines.events.on_gui_closed, close_wiki)
Event.register(defines.events.on_player_changed_surface, close_wiki)
Gui.on_click('py_close_wiki', close_wiki)

function Wiki.add_page(args)
    local name = args.name or error('Required parameter missing: name')
    global.wiki_pages = global.wiki_pages or {}
    
    if not args.section then
        global.wiki_pages[name] = args
    else
        global.wiki_pages[args.section].pages[name] = args
    end
end

function Wiki.add_section(name)
    Wiki.add_page{
        pages = {},
        name = name,
        is_section = true
    }
end

function Wiki.open_page(player, index)
    local main_frame = Wiki.get_wiki_gui(player)
    if not main_frame then return end
    local pages = Wiki.get_pages(player)
    if #pages.items < index then return end
    local contents = Wiki.get_page_contents(player)
    local title = Wiki.get_page_title(player)
    local page_data = pages.tags.contents[index]

    if page_data.is_section then
        Wiki.open_page(player, global.currently_opened_wiki_page[player.index] or 1)
        return
    end

    title.clear()
    local localised_title = {'pywiki-sections.' .. (page_data.title or page_data.name)}
    title.add{type = 'label', style = 'subheader_label', name = 'page_title', caption = {'', '[font=default-semibold][color=255,230,192]', localised_title, '[/color][/font]'}}

    contents.clear()
    pages.selected_index = index
    global.currently_opened_wiki_page[player.index] = index

    local visible = not not page_data.searchable
    main_frame.caption_flow.py_wiki_search.visible = visible
    main_frame.caption_flow.py_wiki_search_button.visible = visible

    if page_data.text_only then
        local label = contents.add{type = 'label', caption = {'pywiki-descriptions.' .. page_data.name}, style = 'label_with_left_padding', ignored_by_interaction = false}
        label.style.single_line = false
        label.style.rich_text_setting = defines.rich_text_setting.highlight
    elseif page_data.remote then
        remote.call(page_data.remote[1], page_data.remote[2], contents, player)
    end
end

Gui.on_selection_state_changed('py_pages_list', function(event)
    local player = game.get_player(event.player_index)
    local previously_opened = global.currently_opened_wiki_page[event.player_index]
    local index = event.element.selected_index
    if previously_opened == index then return end
    Wiki.open_page(player, index)
end)

Gui.on_text_changed('py_wiki_search', function(event)
    local player = game.get_player(event.player_index)
    local contents = Wiki.get_page_contents(player)
    if not contents then return end
    local pages = Wiki.get_pages(player)
    local page_data = pages.tags.contents[pages.selected_index]
    if not page_data or not page_data.searchable then return end
    local searchable = page_data.searchable

    local search_query = event.element.text
    remote.call(searchable[1], searchable[2], search_query, contents, player)
    global.wiki_page_search_query[player.index] = search_query
end)

remote.add_interface('pywiki', {
    add_page = Wiki.add_page,
    add_section = Wiki.add_section,
    open_page = Wiki.open_page,
    get_wiki_gui = Wiki.get_wiki_gui,
    get_pages = Wiki.get_pages,
    get_page_contents = Wiki.get_page_contents,
    get_page_title = Wiki.get_page_title,
    get_page_searchbar = Wiki.get_page_searchbar
})