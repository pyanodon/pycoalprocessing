-- create A.M and F.M beacons

local graphics_set = {
    apply_module_tint = 'primary',
	module_tint_mode = 'mix',
	no_modules_tint = {1, 0, 0},
    animation_list = {
        {
            render_layer = 'floor-mechanics-under-corpse',
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/terrain.png',
                priority = 'high',
                width = 128,
                height = 128,
                frame_count = 1,
                line_length = 1,
                shift = util.by_pixel(-0, -0),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/b-raw.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                shift = util.by_pixel(-0, -32),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/b-ao.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                shift = util.by_pixel(-0, -32),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/b-l.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                draw_as_glow = true,
                shift = util.by_pixel(-0, -32)
            },
			apply_tint = true
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/t-raw.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                shift = util.by_pixel(-0, -224),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/t-ao.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                shift = util.by_pixel(-0, -224),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/t-l.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                draw_as_glow = true,
                shift = util.by_pixel(-0, -224)
            },
			apply_tint = true
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/b-sh.png',
                priority = 'high',
                width = 192,
                height = 192,
                frame_count = 90,
                line_length = 10,
                shift = util.by_pixel(-0, -32),
                draw_as_shadow = true
            }
        },
    }
}

for am = 1, 10 do
    for fm = 1, 10 do
        local beacon = table.deepcopy(data.raw.beacon.beacon)
        beacon.name = 'beacon-AM' .. am ..'-FM' .. fm
        beacon.distribution_effectivity = 0.1 * am * fm
        beacon.energy_usage = 100 * am * (fm ^ 2) .. 'kW'
        beacon.supply_area_distance = 11-am
        beacon.placeable_by = {item = 'beacon', count = 1}
        beacon.localised_name = {'entity-name.new-beacon',am,fm}
        beacon.allowed_effects = {'speed', 'consumption'}
        beacon.graphics_set = graphics_set
        beacon.collision_box = {{-1.55, -1.55}, {1.55, 1.55}}
        beacon.selection_box = {{-2, -2}, {2, 2}}
		beacon.collision_mask = {'item-layer', 'object-layer', 'water-tile'}
        data:extend{beacon}
    end
end

data.raw.item.beacon.place_result = 'beacon-AM1-FM1'
data.raw.item.beacon.icon = '__pycoalprocessinggraphics__/graphics/icons/beacon.png'
data.raw.item.beacon.icon_size = 64
data.raw.item.beacon.icon_mipmaps = nil

data.raw.module['speed-module'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-2'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-3'].beacon_tint.primary = {0, 0.65, 1}