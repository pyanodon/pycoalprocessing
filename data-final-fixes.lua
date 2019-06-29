local DEBUG = require('config').DEBUG
if DEBUG then
    local developer = require('__stdlib__/stdlib/data/developer/developer')
    developer.make_test_entities('pycoalprocessing')
end

if settings.startup['ore-gen'].value then
    if not mods['rso-mod'] and not mods['PyCoalTBaA'] and not mods['PyBlock'] then
        if mods['pyrawores'] or mods['pypetroleumhandling'] then
            for _, e in pairs(data.raw.resource) do
                data.raw.resource[e.name]['autoplace'] = nil
                data.raw['autoplace-control'][e.name] = nil
            end

            data.raw['map-gen-presets']['default']['rail-world'].basic_settings = {
                property_expression_names = {},
                autoplace_controls = {},
                terrain_segmentation = 'very-low',
                water = 'high'
            }
            data.raw['map-gen-presets']['default']['ribbon-world'].basic_settings = {
                autoplace_controls = {},
                terrain_segmentation = 4,
                water = 0.25,
                starting_area = 3,
                height = 128
            }
            data.raw['map-gen-presets']['default']['rich-resources'] = {
                order = 'b',
                basic_settings = {
                    autoplace_controls = {}
                }
            }
        end
    end
end
