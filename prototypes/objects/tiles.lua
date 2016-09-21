data:extend(
{


	{
		type="item",
		name="py-asphalt",
		icon="__pycoalprocessing__/graphics/icons/py-asphalt-icon.png",
		flags={"goes-to-main-inventory"}, 
		subgroup="coal-processing", order="a",  
		stack_size = 500, default_request_amount = 150,
		place_as_tile = {result = "py-asphalt",condition_size = 2,condition = { "water-tile" }}
	},
	
	{
		type = "tile",
		name = "py-asphalt",
		needs_correction = false,
		minable = {hardness = 0.2, mining_time = 0.5, result = "py-asphalt"},
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		collision_mask = {"ground-tile"},
		walking_speed_modifier = 1.2,
		layer = 61,
		variants =
		{
			main =
			{
				{
					picture = "__pycoalprocessing__/graphics/tiles/py-asphalt1.png",
					count = 16,
					size = 1
				},
				{
					picture = "__pycoalprocessing__/graphics/tiles/py-asphalt2.png",
					count = 4,
					size = 2,
					probability = 0.39,
				},
				{
					picture = "__pycoalprocessing__/graphics/tiles/py-asphalt4.png",
					count = 4,
					size = 4,
					probability = 1,
				},
			},
			inner_corner =
			{
				picture = "__pycoalprocessing__/graphics/tiles/concrete-inner-corner.png",
				count = 8
			},
			outer_corner =
			{
				picture = "__pycoalprocessing__/graphics/tiles/concrete-outer-corner.png",
				count = 8
			},
			side =
			{
				picture = "__pycoalprocessing__/graphics/tiles/concrete-side.png",
				count = 8
			},
			u_transition =
			{
				picture = "__pycoalprocessing__/graphics/tiles/concrete-u.png",
				count = 8
			},
			o_transition =
			{
				picture = "__pycoalprocessing__/graphics/tiles/concrete-o.png",
				count = 1
			}
		},
		walking_sound =
		{
			{
				filename = "__base__/sound/walking/concrete-01.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-02.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-03.ogg",
				volume = 1.2
			},
			{
				filename = "__base__/sound/walking/concrete-04.ogg",
				volume = 1.2
			}
		},
		map_color={r=90, g=70, b=50},
		ageing=0,
		vehicle_friction_modifier = stone_path_vehicle_speed_modifier
	},
	
})
