--[[
order letters:
pycp: d
pyro: e
pyph: f
pyal: g
pyae: h
--]]
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
		order = "b",
		is_title = true,
	},
    {
		type = "tips-and-tricks-item",
		name = "victory",
		category = "wiki-py",
		indent = 1,
		order = "c",
        tag = '[technology=pyrrhic]',
	},
	{
		type = "tips-and-tricks-item",
		name = "coalprocessing",
		category = "wiki-py",
		indent = 1,
		order = "d",
		is_title = true,
	},
	{
		type = "tips-and-tricks-item",
		name = "ash",
		category = "wiki-py",
		indent = 2,
		order = "da",
        tag = '[item=ash]',
	},
	{
		type = "tips-and-tricks-item",
		name = "mechanical-inserter",
		category = "wiki-py",
		indent = 2,
		order = "db",
        tag = '[item=burner-inserter]',
	},
	{
		type = "tips-and-tricks-item",
		name = "assembling-machine",
		category = "wiki-py",
		indent = 2,
		order = "dc",
        tag = '[item=assembling-machine-1]',
	},
	{
		type = "tips-and-tricks-item",
		name = "tailings-pond",
		category = "wiki-py",
		indent = 2,
		order = "dd",
        tag = '[entity=tailings-pond]',
	},
})
if not mods["pyalternativeenergy"] then
    data:extend(
    {
        {
            type = "tips-and-tricks-item",
            name = "combustion-mixture",
            category = "wiki-py",
            indent = 2,
            order = "de",
            tag = '[fluid=combustion-mixture1]',
            trigger =
            {
                type = "unlock-recipe",
                recipe = "gasturbinemk01"
            },
        }
    })
end
