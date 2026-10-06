---@diagnostic disable
if not storage.programmable_inserters then return end
-- one-time clear of invalid inserter data to prevent warning for the bug we just fixed
for id, metadata in pairs(storage.programmable_inserters) do
  if not metadata.inserter.valid then
    storage.programmable_inserters[id] = nil
    if metadata.pickup_target and metadata.pickup_target.valid then metadata.pickup_target.destroy() end
    if metadata.drop_target and metadata.drop_target.valid then metadata.drop_target.destroy() end
  end
end