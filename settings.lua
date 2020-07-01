data:extend(
{
	{
	type = "bool-setting",
	name = "ore-gen",
	setting_type = "startup",
	default_value = false,
	order = "e",
	},
	{
	type = "int-setting",
	name = "rpm_entity",
	order = "aa",
	setting_type = "startup",
	minimum_value = 1,
	maximum_value = 100,
	default_value = 30
	},
	{
	type = "int-setting",
	name = "rpm_items",
	order = "ab",
	setting_type = "startup",
	minimum_value = 1,
	maximum_value = 100,
	default_value = 30
	},
}
)
