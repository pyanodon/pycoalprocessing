local Event = require('__stdlib__/stdlib/event/event')

Event.register(Event.core_events.init_and_config, function()
    remote.call('pywiki', 'add_page', {
        name = 'statistics',
		remote = {'create_statistics_page', 'create_statistics_page'}
    })

	remote.call('pywiki', 'add_page', {
        name = 'fluid-index',
		remote = {'create_fluid_page', 'create_fluid_page'}
    })

	remote.call('pywiki', 'add_page', {
        name = 'item-index',
		remote = {'create_solid_fuel_page', 'create_solid_fuel_page'}
    })

    remote.call('pywiki', 'add_section', 'coalprocessing')

    remote.call('pywiki', 'add_page', {
        name = 'ash',
        section = 'coalprocessing',
        text_only = true
    })

    remote.call('pywiki', 'add_page', {
        name = 'mechanical-inserter',
        section = 'coalprocessing',
        text_only = true
    })

    remote.call('pywiki', 'add_page', {
        name = 'assembling-machine',
        section = 'coalprocessing',
        text_only = true
    })

    remote.call('pywiki', 'add_page', {
        name = 'tailings-pond',
        section = 'coalprocessing',
        text_only = true
    })

	if not script.active_mods['pyalternativeenergy'] then
		remote.call('pywiki', 'add_page', {
			name = 'combustion-mixture',
			section = 'coalprocessing',
			text_only = true
		})
	end
end)