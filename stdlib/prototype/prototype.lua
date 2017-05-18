--- Prototype module
-- @module Prototype

Prototype = {} --luacheck: allow defined top

Prototype.empty_sprite = require 'stdlib/prototype/modules/core'['empty_sprite']
Prototype.empty_animation = require 'stdlib/prototype/modules/core'['empty_animation']

--Quickly duplicate an existing prototype into a new one.
function Prototype.duplicate(data_type, orig_name, new_name, mining_result)
    mining_result = type(mining_result) == "boolean" and new_name or mining_result
    if data.raw[data_type][orig_name] then
        local proto = table.deepcopy(data.raw[data_type][orig_name])
        proto.name = new_name
        if mining_result then
            if proto.minable and proto.minable.result then
                proto.minable.result = mining_result
            end
        end
        if proto.place_result then
            proto.place_result = new_name
        end
        if proto.result then
            proto.result = new_name
        end
        return(proto)
    else
        error("Unknown Prototype "..data_type.."/".. orig_name )
    end
end

--Prettier monolith extracting
function Prototype.extract_monolith(filename, x, y, w, h)
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

Prototype.Data = require 'stdlib/prototype/modules/data'
Prototype.Pipes = require 'stdlib/prototype/modules/pipes'
Prototype.Technology = require 'stdlib/prototype/modules/technology'
Prototype.Item = require 'stdlib/prototype/modules/item'
Prototype.Category = require 'stdlib/prototype/modules/category'
Prototype.Entity = require 'stdlib/prototype/modules/entity'
Prototype.Recipe = require 'stdlib/prototype/modules/recipe'


return Prototype
