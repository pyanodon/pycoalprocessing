for _, metadata in pairs(storage.programmable_inserters) do
  if metadata.inserter and metadata.inserter.valid then
    metadata.inserter.pickup_target = metadata.pickup_target
    metadata.inserter.drop_target = metadata.drop_target
  end
end