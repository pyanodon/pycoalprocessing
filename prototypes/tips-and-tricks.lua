data:extend(
{
	{
		type = "tips-and-tricks-item-category",
		name = "wiki-py",
		order = "a"
	},
	{
		type = "tips-and-tricks-item",
		name = "intro",
		category = "wiki-py",
		order = "a",
		starting_status = "suggested",
		is_title = true,
	},
	{
		type = "tips-and-tricks-item",
		name = "victory",
		category = "wiki-py",
		indent = 1,
		order = "b",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "themes-tips",
		category = "wiki-py",
		indent = 1,
		order = "c",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "mechanical-inserter",
		category = "wiki-py",
		indent = 1,
		order = "d",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "ash",
		category = "wiki-py",
		indent = 1,
		order = "e",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "tailings-pond",
		category = "wiki-py",
		indent = 1,
		order = "f",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "early-game-tips",
		category = "wiki-py",
		indent = 1,
		order = "g",
		dependencies = {"intro"}
	},
	{
		type = "tips-and-tricks-item",
		name = "techs",
		category = "wiki-py",
		order = "i",
		starting_status = "suggested",
		is_title = true,
	},
	{
		type = "tips-and-tricks-item",
		name = "combustion-mixture",
		category = "wiki-py",
		indent = 1,
		order = "j",
		dependencies = {"techs"},
		trigger =
		{
			type = "research",
			technology = "energy-1"
		},
	}
})
data:extend(
{
	{
		type = "tips-and-tricks-item",
		name = "your-first-science-pack",
		category = "wiki-py",
		indent = 1,
		order = "h",
		dependencies = {"intro"}
	}
})