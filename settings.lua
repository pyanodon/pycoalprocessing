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
	type = "string-setting",
	name = "module-slot-change",
	order = "a",
	setting_type = "startup",
	allowed_values = {"default", "plus-one-per", "plus-two-per", "double-each-tier"},
	default_value = "default"
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
