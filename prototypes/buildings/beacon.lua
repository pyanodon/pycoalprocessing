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
                width = 160,
                height = 160,
                frame_count = 1,
                line_length = 1,
                shift = util.by_pixel(-0, -0),
                --scale = 1.25
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
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
                animation_speed = 0.25,
                shift = util.by_pixel(48, -32),
                draw_as_shadow = true
            }
        },
    }
}

for am = 5, 1, -1 do
    for fm = 5, 1, -1 do
        local beacon = table.deepcopy(data.raw.beacon.beacon)
        beacon.name = 'beacon-AM' .. am ..'-FM' .. fm
        beacon.distribution_effectivity = settings.startup['future-beacons'].value and (0.2 * am * fm) or (0.5 * am * fm)
        beacon.energy_usage = 1000 * am * (fm ^ 3) .. 'kW'
        beacon.supply_area_distance = 64 - 16 * (am - 1)
        if beacon.supply_area_distance < 2 then beacon.supply_area_distance = 2 end
        beacon.placeable_by = {item = 'beacon', count = 1}
        beacon.localised_name = {'entity-name.new-beacon',tostring(am),tostring(fm)}
        beacon.allowed_effects = {'speed', 'consumption'}
        beacon.graphics_set = graphics_set
        beacon.collision_box = {{-2.05, -2.05}, {2.05, 2.05}}
        beacon.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
        beacon.drawing_box = {{-2.5, -6}, {2.5, 2.5}}
		beacon.collision_mask = {'item-layer', 'object-layer', 'water-tile'}
        beacon.next_upgrade = nil
        beacon.icon = '__pycoalprocessinggraphics__/graphics/icons/beacon.png'
        beacon.icon_size = 64
        beacon.icon_mipmaps = nil
        data:extend{beacon}
    end
end

data.raw.item.beacon.place_result = 'beacon-AM1-FM1'
data.raw.item.beacon.icon = '__pycoalprocessinggraphics__/graphics/icons/beacon.png'
data.raw.item.beacon.icon_size = 64
data.raw.item.beacon.icon_mipmaps = nil
data.raw.item.beacon.stack_size = 100
data.raw.beacon.beacon.subgroup = data.raw.item.beacon.subgroup

data.raw.module['speed-module'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-2'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-3'].beacon_tint.primary = {0, 0.65, 1}

TECHNOLOGY('effect-transmission'):add_prereq('diet-beacon')