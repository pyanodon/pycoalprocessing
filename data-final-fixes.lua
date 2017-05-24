local Area = require('stdlib.area.area')

-- Make all storage-tanks fast replace with other other if they are the same size
for _, storage_tank in pairs(data.raw["storage-tank"]) do
    storage_tank.fast_replaceable_group = "storage-tank-"..Area.size(Area.round_to_integer(storage_tank.collision_box))
end
