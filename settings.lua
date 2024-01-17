data:extend{
	{
		type = 'int-setting',
		name = 'rpm_entity', -- requester paste multiplier for entities
		order = 'aa',
		setting_type = 'startup',
		minimum_value = 1,
		maximum_value = 100,
		default_value = 30
	},
	{
		type = 'int-setting',
		name = 'rpm_items', -- requester paste multiplier for items
		order = 'ab',
		setting_type = 'startup',
		minimum_value = 1,
		maximum_value = 100,
		default_value = 30
	},
	{
		type = 'bool-setting',
		name = 'future-beacons',
		order = 'ac',
		setting_type = 'startup',
		default_value = true,
	}
}
