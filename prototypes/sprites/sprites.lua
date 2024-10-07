data:extend{{
	type = 'sprite',
	name = 'pywiki',
	filename = '__pycoalprocessinggraphics__/graphics/gui/py-wiki-alt.png',
	priority = 'extra-high-no-scale',
	size = 64,
	flags = {'gui-icon'}
}}

data:extend{{
	type = 'sprite',
	name = 'pywiki-alt',
	filename = '__pycoalprocessinggraphics__/graphics/gui/py-wiki.png',
	priority = 'extra-high-no-scale',
	size = 128,
	flags = {'gui-icon'}
}}

if mods.pystellarexpedition then
	data:extend{{
		type = 'sprite',
		name = 'pywiki-logos',
		filename = '__pycoalprocessinggraphics__/graphics/gui/logos2.png',
		priority = 'high',
		width = 576,
		height = 432,
		flags = {'gui-icon'}
	}}
else
	data:extend{{
		type = 'sprite',
		name = 'pywiki-logos',
		filename = '__pycoalprocessinggraphics__/graphics/gui/logos.png',
		priority = 'high',
		width = 720,
		height = 288,
		flags = {'gui-icon'}
	}}

end

data:extend{
	{
		type = 'sprite',
		name = 'up-black',
		filename = '__pycoalprocessinggraphics__/graphics/icons/gui/up-black.png',
		size = 32,
		flags = {'gui-icon'}
	},
	{
		type = 'sprite',
		name = 'up-white',
		filename = '__pycoalprocessinggraphics__/graphics/icons/gui/up-white.png',
		size = 32,
		flags = {'gui-icon'}
	},
	{
		type = 'sprite',
		name = 'down-black',
		filename = '__pycoalprocessinggraphics__/graphics/icons/gui/down-black.png',
		size = 32,
		flags = {'gui-icon'}
	},
	{
		type = 'sprite',
		name = 'down-white',
		filename = '__pycoalprocessinggraphics__/graphics/icons/gui/down-white.png',
		size = 32,
		flags = {'gui-icon'}
	},
  	{
		type = 'sprite',
		name = 'white-circle',
		filename = '__pycoalprocessinggraphics__/graphics/icons/gui/white-circle.png',
		size = 32,
    	mipmaps = 2,
		flags = {'gui-icon'}
	}
}


data:extend{{
    type = 'sprite',
	name = 'turd',
	filename = '__pycoalprocessinggraphics__/graphics/icons/gui/turd.png',
	priority = 'high',
	width = 40,
	height = 40,
	flags = {'gui-icon'}
}}

data:extend{{
	type = 'sprite',
	name = 'beacon-interference',
	filename = '__pycoalprocessinggraphics__/graphics/icons/gui/beacon-interference.png',
	priority = 'extra-high-no-scale',
	width = 64,
	height = 64,
	flags = {'icon'}
}}

data:extend {{
	name = 'slot_icon_fuel',
	type = 'sprite',
	filename = '__pycoalprocessinggraphics__/graphics/gui/slot-fuel-white.png',
	priority = 'medium',
	width = 64,
	height = 64,
	mipmap_count = 3,
	scale = 0.5,
	flags = {'gui-icon'}
}
}

data:extend {{
	name = 'slot_icon_fuel_black',
	type = 'sprite',
	filename = '__pycoalprocessinggraphics__/graphics/gui/slot-fuel-black.png',
	priority = 'medium',
	width = 64,
	height = 64,
	mipmap_count = 3,
	scale = 0.5,
	flags = {'gui-icon'}
}}

data:extend{{
	type = 'sprite',
	name = 'rename_icon_small_black',
	filename = '__pycoalprocessinggraphics__/graphics/gui/rename-small-black.png',
	priority = 'high',
	width = 16,
	height = 16,
	flags = {'icon'}
}}

data:extend{{
	type = 'sprite',
	name = 'rename_icon_small_white',
	filename = '__pycoalprocessinggraphics__/graphics/gui/rename-small-white.png',
	priority = 'high',
	width = 16,
	height = 16,
	flags = {'icon'}
}}