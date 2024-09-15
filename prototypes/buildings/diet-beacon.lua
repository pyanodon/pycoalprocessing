-- create A.M and F.M beacons

TECHNOLOGY {
    type = 'technology',
    name = 'diet-beacon',
    icon = '__base__/graphics/technology/module.png',
    icon_size = 256,
    icon_mipmaps = 4,
    prerequisites = {'speed-module', 'productivity-module', 'efficiency-module'},
    effects = {},
    unit = {
        count = 2100,
        ingredients = {
            {'automation-science-pack', 6},
            {'logistic-science-pack', 2},
            {'chemical-science-pack', 1}
        },
        time = 90,
    },
    localised_description = {'technology-description.effect-transmission'}
}

RECIPE{
    type = "recipe",
    name = "beacon-mk01",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {"steel-plate", 10},
      {"electric-engine-unit", 1},
      {"iron-gear-wheel", 50},
      {"advanced-circuit", 5}
    },
    results = {
        {type = "item", name = "beacon-mk01", amount = 1}
    }
}:add_unlock('diet-beacon')

ITEM{
    type = "item",
    name = "beacon-mk01",
    icon = '__pycoalprocessinggraphics__/graphics/icons/beacon-01.png',
    icon_size = 64,
    subgroup = "module",
    order = "a[beacon]",
    place_result = 'diet-beacon-AM1-FM1',
    stack_size = 100
  }

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
                scale = 0.6
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/01/raw.png',
                priority = 'high',
                width = 96,
                height = 224,
                frame_count = 50,
                line_length = 10,
                animation_speed = 0.25,
                shift = util.by_pixel(-0, -96),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/01/ao.png',
                priority = 'high',
                width = 96,
                height = 224,
                frame_count = 50,
                line_length = 10,
                animation_speed = 0.25,
                shift = util.by_pixel(-0, -96),
            }
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/01/l.png',
                priority = 'high',
                width = 160,
                height = 128,
                frame_count = 50,
                line_length = 10,
                animation_speed = 0.25,
                draw_as_glow = true,
                shift = util.by_pixel(-0, -112)
            },
			apply_tint = true
        },
        {
            animation = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/beacon/01/sh.png',
                priority = 'high',
                width = 128,
                height = 96,
                draw_as_shadow = true,
                frame_count = 50,
                line_length = 10,
                animation_speed = 0.25,
                shift = util.by_pixel(48, 0),
            }
        },
    }
}

for am = 5, 1, -1 do
    for fm = 5, 1, -1 do
        local beacon = table.deepcopy(data.raw.beacon.beacon)
        beacon.name = 'diet-beacon-AM' .. am ..'-FM' .. fm
        beacon.distribution_effectivity = 0.1 * am * fm
        beacon.energy_usage = 500 * am * (fm ^ 3) .. 'kW'
        beacon.supply_area_distance = 32 - 8 * (am - 1)
        if beacon.supply_area_distance < 2 then beacon.supply_area_distance = 2 end
        beacon.placeable_by = {item = 'beacon-mk01', count = 1}
        beacon.localised_name = {'entity-name.new-beacon-mk01',tostring(am),tostring(fm)}
        beacon.allowed_effects = {'speed', 'consumption'}
        beacon.graphics_set = graphics_set
        beacon.collision_box = {{-1.05, -1.05}, {1.05, 1.05}}
        beacon.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}
        beacon.drawing_box = {{-1.5, -5}, {1.5, 1.5}}
		beacon.collision_mask = {layers = {item = true, object = true, water_tile = true}}
        beacon.next_upgrade = nil
        beacon.minable = {mining_time = 0.2, result = "beacon-mk01"}
        beacon.icon = '__pycoalprocessinggraphics__/graphics/icons/beacon-01.png'
        beacon.icon_size = 64
        beacon.icon_mipmaps = nil
        data:extend{beacon}
    end
end

data.raw.module['speed-module'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-2'].beacon_tint.primary = {0, 0.65, 1}
data.raw.module['speed-module-3'].beacon_tint.primary = {0, 0.65, 1}