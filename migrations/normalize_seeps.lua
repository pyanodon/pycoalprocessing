local seep_search_filter = {
    name = 'bitumen-seep',
    type = 'resource'
}
-- Ensure any existing seeps are set to sane amounts
for _, surface in pairs(game.surfaces) do
    for _, patch in pairs(surface.find_entities_filtered(seep_search_filter)) do
        if patch.valid and patch.amount > 2500 then
            log(string.format('Fixed invalid seep with %d remaining', patch.amount))
            patch.amount = math.random(1000, 2500)
        end
    end
end