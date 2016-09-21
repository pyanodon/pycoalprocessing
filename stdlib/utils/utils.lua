-- utils.lua by binbinhfr, v1.0.10

local author_name1 = "Nexela"
local author_name2 = "Nexela"

require("stdlib.table")
require("stdlib.string")
require("stdlib.time")
require("stdlib.utils.colors")
local Game=require("stdlib.game")
-------------------------------------------------------------------------------


--[[
TODO log levels
   -1, instant error()
   0 off
   1, print and log
   2, log only
   3, warn log only
   4, info log only
]]

function doDebug(msg, alert)
    local level = MOD.config.get("LOGLEVEL", 1)
    if level == 0 and not alert then return end

    if (level >= 1 or alert) and type(msg) == "table" then
                MOD.logfile.log("vvvvvvvvvvvvvvvvvvvvvvv--Begin Serpent Block--vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv")
                MOD.logfile.log(serpent.block(msg, {comment=false}))
                MOD.logfile.log("^^^^^^^^^^^^^^^^^^^^^^^--End   Serpent Block--^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^")
            else
                MOD.logfile.log(tostring(msg))
            end
    if (level >= 2 or alert) and game then
        Game.print_all(MOD.n .. ":" .. table.tostring(msg))
    end
end
doDebug(MOD.fileheader) --Start the debug log with a header

--------------------------------------------------------------------------------------
function string.PrettyNumber( number )
	if number < 1000 then
		return string.format("%i", number)
	elseif number < 1000000 then
		return string.format("%.1fk", (number/1000))
	else
		return string.format("%.1fm", (number/1000000))
	end
end

function Time.FormatTicksToTime( ticks )
    local seconds = ticks / 60
    local minutes = seconds / 60
    local hours = minutes / 60
    return string.format("%02d:%02d:%02d",
        math.floor(hours + 0.5),
        math.floor(minutes + 0.5) % 60,
        math.floor(seconds + 0.5) % 60)
end

--------------------------------------------------------------------------------------
function GetNearest( objects, point )
	if #objects == 0 then
		return nil
	end

	local maxDist = math.huge
	local nearest = objects[1]
	for _, obj in ipairs(objects) do
		local dist = DistanceSqr(point, obj.position)
		if dist < maxDist then
			maxDist = dist
			nearest = obj
		end
	end

	return nearest
end

--------------------------------------------------------------------------------------
function nearest_players( params )
    local origin = params.origin
    local max_distance = params.max_distance or 2
    local list = {}

    for playerIndex = 1, #game.players do
        local player = game.players[playerIndex]
        local distance = util.distance(player.position, origin)
        if distance <= max_distance then
            table.insert(list, player)
        end
    end

    return list
end

--------------------------------------------------------------------------------------
function flyingText(line, color, pos, surface)
    color = color or defines.colors.RED
    line = line or "missing text" --If we for some reason didn't pass a message make a message
    if not pos then
		for _, p in pairs(game.players) do
			p.surface.create_entity({name="flying-text", position=p.position, text=line, color=color})
        end
    return
    else
		if surface then
			surface.create_entity({name="flying-text", position=pos, text=line, color=color})
		end
    end
end

--------------------------------------------------------------------------------------
function min( val1, val2 )
	if val1 < val2 then
		return val1
	else
		return val2
	end
end

--------------------------------------------------------------------------------------
function max( val1, val2 )
	if val1 > val2 then
		return val1
	else
		return val2
	end
end

--------------------------------------------------------------------------------------
function iif( cond, val1, val2 )
	if cond then
		return val1
	else
		return val2
	end
end

--------------------------------------------------------------------------------------
function table.add_list(list, obj)
	-- to avoid duplicates...
	for i, obj2 in pairs(list) do
		if obj2 == obj then
			return(false)
		end
	end
	table.insert(list,obj)
	return(true)
end

--------------------------------------------------------------------------------------
function table.del_list(list, obj)
	for i, obj2 in pairs(list) do
		if obj2 == obj then
			table.remove( list, i )
			return(true)
		end
	end
	return(false)
end

--------------------------------------------------------------------------------------
function table.in_list(list, obj)
	for k, obj2 in pairs(list) do
		if obj2 == obj then
			return(k)
		end
	end
	return(nil)
end

function table.spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

------------------------------------------------------------------------------------
function is_dev(player)
	return( player.name == author_name1 or player.name == author_name2 )
end

--------------------------------------------------------------------------------------

function dupli_proto( type, name1, name2, adaptMiningResult )
	if data.raw[type][name1] then
		local proto = table.deepcopy(data.raw[type][name1])
		proto.name = name2
		if adaptMiningResult then
			if proto.minable and proto.minable.result then proto.minable.result = name2	end
		end
		if proto.place_result then proto.place_result = name2 end
		if proto.result then proto.result = name2 end
		return(proto)
	else
		error("prototype unknown " .. name1 )
		return(nil)
	end
end


--------------------------------------------------------------------------------------
function extract_monolith(filename, x, y, w, h)
	return {
		type = "monolith",

		top_monolith_border = 0,
		right_monolith_border = 0,
		bottom_monolith_border = 0,
		left_monolith_border = 0,

		monolith_image = {
			filename = filename,
			priority = "extra-high-no-scale",
			width = w,
			height = h,
			x = x,
			y = y,
		},
	}
end



-----------------------------------------------------------------------------------
--Additional Table Helpers

function table.val_to_str ( v )
  if "string" == type( v ) then
    v = string.gsub( v, "\n", "\\n" )
    if string.match( string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type( v ) and table.tostring( v ) or
      tostring( v )
  end
end

function table.key_to_str ( k )
  if "string" == type( k ) and string.match( k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str( k ) .. "]"
  end
end

function table.tostring( tbl )
	if type(tbl) ~= "table" then return tostring(tbl) end
  local result, done = {}, {}
  for k, v in ipairs( tbl ) do
    table.insert( result, table.val_to_str( v ) )
    done[ k ] = true
  end
  for k, v in pairs( tbl ) do
    if not done[ k ] then
      table.insert( result,
        table.key_to_str( k ) .. "=" .. table.val_to_str( v ) )
    end
  end
  return "{" .. table.concat( result, "," ) .. "}"
end

function table.arraytostring(...)
	local s = ""

	for i, v in ipairs({...}) do
		s = s .." " .. tostring(v)
	end
	return s
end

function table.getvalue(value, tbl)
	if tbl==nil or value == nil then return nil end
	if type(tbl) ~= "table" then
		if tostring(value) == tostring(tbl) then return value else return nil end
	end
	for k, v in ipairs(tbl) do
		if v == value then return v end
	end
	return nil
end
