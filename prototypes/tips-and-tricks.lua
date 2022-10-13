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
		name = "before-first-game",
		category = "wiki-py",
		indent = 1,
		order = "b",
		starting_status = "suggested",
		is_title = true,
	},
	{
		type = "tips-and-tricks-item",
		name = "recommended-settings",
		category = "wiki-py",
		indent = 2,
		order = "ba",
		starting_status = "suggested",
	},
	{
		type = "tips-and-tricks-item",
		name = "recommended-mod-combinations",
		category = "wiki-py",
		indent = 2,
		order = "bb",
		starting_status = "suggested",
	},
	{
		type = "tips-and-tricks-item",
		name = "recommended-other-mods",
		category = "wiki-py",
		indent = 2,
		order = "bb",
		starting_status = "suggested",
	},
    
	{
		type = "tips-and-tricks-item",
		name = "general-py-tips",
		category = "wiki-py",
		indent = 1,
		order = "c",
		starting_status = "suggested",
		is_title = true,
	},
    {
		type = "tips-and-tricks-item",
		name = "victory",
		category = "wiki-py",
		indent = 2,
		order = "ca",
		starting_status = "suggested",
	},
	{
		type = "tips-and-tricks-item",
		name = "themes",
		category = "wiki-py",
		indent = 2,
		order = "cb",
		starting_status = "suggested",
	},
	{
		type = "tips-and-tricks-item",
		name = "general-tips",
		category = "wiki-py",
		indent = 2,
		order = "cc",
		starting_status = "suggested",
	},
	{
		type = "tips-and-tricks-item",
		name = "py-technologies",
		category = "wiki-py",
		indent = 2,
		order = "cd",
		starting_status = "suggested",
	},
    
	{
		type = "tips-and-tricks-item",
		name = "coalprocessing",
		category = "wiki-py",
		indent = 1,
		order = "d",
		starting_status = "suggested",
		is_title = true,
	},
	{
		type = "tips-and-tricks-item",
		name = "mechanical-inserter",
		category = "wiki-py",
		indent = 2,
		order = "da",
		dependencies = {"coalprocessing"}
	},
	{
		type = "tips-and-tricks-item",
		name = "ash",
		category = "wiki-py",
		indent = 2,
		order = "db",
		dependencies = {"coalprocessing"}
	},
	{
		type = "tips-and-tricks-item",
		name = "tailings-pond",
		category = "wiki-py",
		indent = 2,
		order = "dc",
		dependencies = {"coalprocessing"}
	},
	{
		type = "tips-and-tricks-item",
		name = "early-game-tips",
		category = "wiki-py",
		indent = 2,
		order = "dd",
		dependencies = {"coalprocessing"}
	},
	{
		type = "tips-and-tricks-item",
		name = "combustion-mixture",
		category = "wiki-py",
		indent = 2,
		order = "de",
		dependencies = {"coalprocessing"},
		trigger =
		{
			type = "research",
			technology = "energy-1"
		},
	}
})
if not mods["pyalienlife"] then
    data:extend(
    {
        {
            type = "tips-and-tricks-item",
            name = "your-first-science-pack",
            category = "wiki-py",
            indent = 2,
            order = "df",
            dependencies = {"coalprocessing"},
        }
    })
end