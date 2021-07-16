local DEBUG = require('config').DEBUG
if DEBUG then
    local developer = require('__stdlib__/stdlib/data/developer/developer')
    developer.make_test_entities('pycoalprocessing')
end

--vram reduction test
--[[ TODO: finsh this later
for e, entity in pairs(data.raw['assembling-machine']) do
    if entity.animation ~= nil then
        if entity.animation.layers ~= nil then
            log(entity.name)
            for l, layer in pairs(entity.animation.layers) do
                if string.match(layer.filename, "%_%_pycoalprocessinggraphics%_%_") then
                    local hr = table.deepcopy(layer)
                    local frame_skip = settings.startup['frame_skip'].value
                    --log(frame_skip)
                    layer.hr_version = hr
                    layer.frame_sequence = {}
                    --log(layer.frame_count)
                    local hr_fs = {}
                    for i = 1, layer.frame_count or 1, frame_skip do
                        table.insert(layer.frame_sequence, i)
                        table.insert(hr_fs, i)
                    end
                    layer.hr_version.frame_sequence = hr_fs
                end
            end
        end
    end
end
]]--
