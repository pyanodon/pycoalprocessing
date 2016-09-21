--Console Code from adil modified for STDlib

local console = function()
	local c=game.player.gui.left.add{type='frame',name='console',direction='horizontal'}
	local t = c.add{type='textfield',name='line'}
  t.style.minimal_width=600
  t.style.maximal_width=600
	c.add{type='button', name='enter',caption='<'}
  c.add{type='button', name='clear', caption='C'}
  c.add{type='button', name ='close', caption="X"}
end
local second=false

if game then log("game here!") end

local handler=function(event)
	local i=event.element.player_index
	local p=game.players[event.player_index]
	if p.gui.left.console['enter']==event.element then
		if second then second=false return end
		local s=p.gui.left.console.line.text
		assert(loadstring(s))()
    --local pass, msg = pcall(assert(loadstring(s), error("missing"))())
		game.write_file('console.log',s..'\n',true,i)
		second=true
	end
end

script=setmetatable({
	real=script,
	on_event=function(n,f)
		if n==defines.events.on_gui_click then
			if f then
				script.real.on_event(n,function(e) handler(e) f(e) end)
			else
				script.real.on_event(n,handler)
			end
		else
			script.real.on_event(n,f)
		end
	end
	},{__index=script})
script.on_event(defines.events.on_gui_click, handler)
script.on_event(defines.events.on_gui_click, function(event)
  local p = game.players[event.player_index]
  if p.gui.left.console['clear']==event.element then
		p.gui.left.console.line.text = ""
	end
  if p.gui.left.console['close']==event.element then
		p.gui.left.console.destroy()
	end
end)

return console
