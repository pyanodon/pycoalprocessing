data:extend {{
	type = "container",
	name = "py-logo-15tiles",
	icon = "__pycoalprocessinggraphics__/graphics/icons/py-logo-15tiles.png",
	icon_size = 64,
	flags = {"placeable-neutral", "player-creation"},
	hidden = true,
	minable = {mining_time = 0.5},
	max_health = 666,
	inventory_type = "with_filters_and_bar",
	collision_box = {{-7.5 + 0.15, -1.5 + 0.15}, {7.5 - 0.15, 1.5 - 0.15}},
	selection_box = {{-7.5, -1.5}, {7.5, 1.5}},
	inventory_size = 1,
	picture = {
		filename = "__pycoalprocessinggraphics__/graphics/entity/logo/py-logo.png",
		priority = "extra-high",
		width = 1000,
		height = 298,
		shift = util.by_pixel(0, 0),
		scale = 0.5
	}
}}
