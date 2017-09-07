--luacheck: no global
-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "poorman-wood-fence",
    category = "crafting",
    enabled = false,
    ingredients =
    {
        {type="item", name="wooden-board", amount=3}, --add bobs resin
    },
    result = "poorman-wood-fence",
    subgroup = "py-items",
    order = "z",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type="item",
    name="poorman-wood-fence",
    icon="__pycoalprocessing__/graphics/icons/poorman-wood-fence.png",
    flags={"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
	place_result = "poorman-wood-fence",
    stack_size = 500,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1= {
		type = "wall",
		name = "poorman-wood-fence",
		icon = "__pycoalprocessing__/graphics/icons/poorman-wood-fence.png",		
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
		--drawing_box = {{-1.5,-1.5},{1.5,1.5}},
		minable = {mining_time = 1, result = "poorman-wood-fence"},
		max_health = 100,
		corpse = "wall-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		repair_speed_modifier = 4,
		fast_replaceable_group = "wall",
		vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
		connected_gate_visualization = { filename = "__core__/graphics/arrows/underground-lines.png",priority = "high",width = 64,height = 64,scale = 0.5 },
		wall_diode_green =
		{
			filename = "__base__/graphics/entity/gate/wall-diode-green.png",
			width = 21,
			height = 22,
			shift = {0, -0.78125}
		},
		wall_diode_green_light =
		{
			minimum_darkness = 0.3,
			color = {g=1},
			shift = {0, -0.78125},
			size = 1,
			intensity = 0.3
		},
		wall_diode_red =
		{
			filename = "__base__/graphics/entity/gate/wall-diode-red.png",
			width = 21,
			height = 22,
			shift = {0, -0.78125}
		},
		wall_diode_red_light =
		{
			minimum_darkness = 0.3,
			color = {r=1},
			shift = {0, -0.78125},
			size = 1,
			intensity = 0.3
		},
		resistances =
		{
			{ type = "physical", decrease = 5, percent = 30 },
			{ type = "explosion", decrease = 2, percent = 30 },
			{ type = "fire", percent = 10 },
			{ type = "acid", percent = 10 },
		},
		pictures =
		{
			single ={{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/single.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}},
			straight_vertical =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/vertical.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				},
			},
			straight_horizontal =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/horizontal-2.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				},
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/horizontal-1.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				},
			},
			corner_right_down =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/corner-right.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}
			},
			corner_left_down =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/corner-left.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}
			},
			t_up =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/single.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}
			},
			ending_right =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/end-left.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}
			},
			ending_left =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/poorman-wood-fence/end-right.png",
					priority = "extra-high", width = 64, height = 64, shift = {0, -0.2}
				}
			}
		}

}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
