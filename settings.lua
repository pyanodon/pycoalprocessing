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
}
)
