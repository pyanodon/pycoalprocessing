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
		--image = "__pycoalprocessinggraphics__/graphics/py-wiki.png"
		-- replace the line above with a good starting img to go above the welcome text
	},
	{
		type = "tips-and-tricks-item",
		name = "victory",
		category = "wiki-py",
		indent = 1,
		order = "b",
		--starting_status = "locked",
		dependencies = {"intro"}
		--is_title = true,
	}
})
