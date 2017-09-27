--luacheck: no global
-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "concrete-wall",
    category = "crafting",
    enabled = false,
    ingredients =
    {
        {type="item", name="concrete", amount=2},
		{type="item", name="iron-stick", amount=4},
    },
    result = "concrete-wall",
    subgroup = "py-items",
    order = "zz",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1= {
    type="item",
    name="concrete-wall",
    icon="__pycoalprocessing__/graphics/icons/concrete-wall.png",
    flags={"goes-to-main-inventory"},
    subgroup = "py-items",
    order = "z",
	place_result = "concrete-wall",
    stack_size = 500,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1= {
		type = "wall",
		name = "concrete-wall",
		icon = "__pycoalprocessing__/graphics/icons/concrete-wall.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		--drawing_box = {{-1.5,-1.5},{1.5,1.5}},
		minable = {mining_time = 1, result = "concrete-wall"},
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
			{ type = "physical", decrease = 5, percent = 60 },
			{ type = "explosion", decrease = 2, percent = 60 },
			{ type = "fire", percent = 30 },
			{ type = "acid", percent = 15 },
		},
		pictures =
		{
			single ={{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/single.png",
					priority = "extra-high", width = 32, height = 44, shift = {0, -0.0}
				}},
			straight_vertical =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/vertical.png",
					priority = "extra-high", width = 32, height = 42, shift = {0, -0.0}
				},
			},
			straight_horizontal =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/horizontal-1.png",
					priority = "extra-high", width = 32, height = 38, shift = {0.0, 0.08}
				},
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/horizontal-2.png",
					priority = "extra-high", width = 32, height = 38, shift = {0.0, 0.08}
				},
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/horizontal-3.png",
					priority = "extra-high", width = 32, height = 38, shift = {0.0, 0.08}
				},
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/horizontal-4.png",
					priority = "extra-high", width = 32, height = 38, shift = {0.0, 0.08}
				},
			},
			corner_right_down =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/corner-right.png",
					priority = "extra-high", width = 32, height = 43, shift = {0, -0.0}
				}
			},
			corner_left_down =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/corner-left.png",
					priority = "extra-high", width = 32, height = 43, shift = {0.0, -0.0}
				}
			},
			t_up =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/t-down.png",
					priority = "extra-high", width = 32, height = 46, shift = {0, -0.00}
				}
			},
			ending_right =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/end-right.png",
					priority = "extra-high", width = 32, height = 43, shift = {0, -0.0}
				}
			},
			ending_left =
			{
				{
					filename = "__pycoalprocessing__/graphics/walls/concrete-wall/end-left.png",
					priority = "extra-high", width = 32, height = 43, shift = {0, -0.0}
				}
			}
		}

}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end
