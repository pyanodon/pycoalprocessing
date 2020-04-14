local Event = require('__stdlib__/stdlib/event/event')

local function on_init()
    global.wiki = {}
    global.wiki.fluids = {}
    for _, fluid in pairs(game.fluid_prototypes) do
        log(serpent.block(fluid.name))
        log(serpent.block(fluid.fuel_value))
        if fluid.fuel_value ~= nil and fluid.fuel_value ~= 0 then
        global.wiki.fluids[fluid.name] = fluid.fuel_value
        end
    end
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
        local wiki = player.gui.top.add(
            {
                type = 'frame',
                name = 'pywiki_frame',
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
end
Event.register(-1, on_1th_tick)

local function on_click(event)

    --local player = game.players[event.player_index]

    if event.element.name == 'pywiki' then
        local wiki_gui = event.element.parent
        wiki_gui.clear()
        wiki_gui.add(
            {
                type = 'frame',
                name = 'fluid_page',
                caption = 'Fluids with fuel value',
                direction = "vertical"
            }
        )
        wiki_gui.add(
            {
                type = "sprite-button",
                name = "wiki_close",
                sprite = "utility/close_fat"
            }
        )
        for f, fluid in pairs(global.wiki.fluids) do
            wiki_gui.fluid_page.add(
                {
                    type = 'frame',
                    name = 'fluid_frame'.. f,
                    caption = game.fluid_prototypes[f].localised_name,
                    direction = "horizontal"
                }
            )
            wiki_gui.fluid_page['fluid_frame'.. f].add(
            {
                type = 'sprite',
                name = f,
                sprite = 'fluid/' .. f,
                caption = game.fluid_prototypes[f].localised_name
            }
            )
            local num
            if fluid >= 1000 then
                num = fluid/1000 .. 'KJ'
            elseif fluid >= 100000 then
                num = fluid/1000000 .. 'MJ'
            end
            wiki_gui.fluid_page['fluid_frame'.. f].add(
            {
                type = 'frame',
                name = f .. 'fluid_value',
                caption = num
            }
            )
        end
    elseif event.element.name == 'wiki_close' then
        local wiki_gui = event.element.parent
        wiki_gui.clear()
        wiki_gui.add(
            {
                type = 'sprite-button',
                name = 'pywiki',
                sprite = 'pywiki'
            }
        )
    end
end
Event.register(defines.events.on_gui_click, on_click)
