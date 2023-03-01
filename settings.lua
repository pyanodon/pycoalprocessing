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
}
)

local count_all_buildings_on_all_surfaces = {
    type = "bool-setting",
    name = "count-all-buildings-on-all-surfaces",
    setting_type = "runtime-per-user",
    default_value = true
}
data:extend{count_all_buildings_on_all_surfaces}

local count_voiding_buildings = {
    type = "bool-setting",
    name = "count-voiding-buildings",
    setting_type = "runtime-per-user",
    default_value = true
}
data:extend{count_voiding_buildings}

local include_laggy_calculations = {
    type = "bool-setting",
    name = "include-laggy-calculations",
    setting_type = "runtime-per-user",
    default_value = true
}
data:extend{include_laggy_calculations}
