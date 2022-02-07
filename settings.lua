data:extend(
{
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
	{
	type = "bool-setting",
	name = "remove_barrels_for_jerry_cans",
	order = "ac",
	setting_type = "startup",
	default_value = "false"
	}
}
)
