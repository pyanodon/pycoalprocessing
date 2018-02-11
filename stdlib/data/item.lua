--- Item
-- @classmod Item

local Item = {
    _class = "Item"
}
setmetatable(Item, {__index = require("stdlib/data/data")})

function Item:_get(item, item_type)
    return self:get(item, item_type)
end
Item:set_caller(Item._get)

Item.item_types = {
    "item",
    "ammo",
    "armor",
    "gun",
    "capsule",
    "repair-tool",
    "mining-tool",
    "item-with-entity-data",
    "rail-planner",
    "tool",
    "blueprint",
    "deconstruction-item",
    "blueprint-book",
    "selection-tool",
    "item-with-tags",
    "item-with-label",
    "item-with-inventory",
    "module"
}

Item._mt = {
    type = "item",
    __index = Item,
    __call = Item._get,
    __tostring = Item.tostring
}

return Item
