RECIPE {
    type = 'recipe',
    name = 'tailings-pond',
    enabled = true,
    ingredients = {
        {'pipe', 10},
        {'iron-plate', 10},
        {'stone-brick', 100}
    },
    results = {
        {'tailings-pond', 1}
    }
}

ITEM {
    type = 'item',
    name = 'tailings-pond',
    icon = '__pycoalprocessinggraphics__/graphics/icons/tailings-pond.png',
    icon_size = 64,
    flags = {},
    subgroup = 'coal-processing',
    order = 'z',
    place_result = 'tailings-pond',
    stack_size = 10
}

--[[
ENTITY {
    type = 'storage-tank',
    name = 'tailings-pond',
    icon = '__pycoalprocessinggraphics__/graphics/icons/tailings-pond.png',
    icon_size = 64,
    flags = {'placeable-player', 'player-creation'},
    minable = {mining_time = 3, result = 'tailings-pond'},
    max_health = 500,
    corpse = 'big-remnants',
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    two_direction_only = true,
    fluid_box = {
        base_area = (100000 / 100),
        pipe_covers = DATA.Pipes.covers(true, true, true, true),
        pipe_connections = {
            {position = {0, -3}},
            {position = {0, 3}},
            {position = {3, 0}},
            {position = {-3, 0}}
        }
    },
    window_bounding_box = {{-2.4, -2.4}, {2.4, 2.4}},
    pictures = {
        picture = {
            sheet = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/tailings-pond-frame.png',
                priority = 'high',
                frames = 1,
                width = 171,
                height = 185
            }
        },
        fluid_background = DATA.Sprites.empty_sprite(),
        window_background = {
            filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/window-background.png',
            priority = 'low',
            width = 171,
            height = 185,
            draw_as_shadow = true
        },
        flow_sprite = DATA.Sprites.empty_sprite(),
        gas_flow = DATA.Sprites.empty_animation()
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
    working_sound = {
        sound = {
            filename = '__base__/sound/storage-tank.ogg',
            volume = 0.8
        },
        apparent_volume = 1.5,
        max_sounds_per_type = 3
    },
    circuit_wire_connection_points = {
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = _G.circuit_connector_definitions['storage-tank'].sprites
}

do -- Make tailings pond sprites
    local pictures = {}
    local i = 1
    for y = 0, 555 - 185, 185 do
        for x = 0, 1710 - 171, 171 do
            pictures[#pictures + 1] = {
                type = 'sprite',
                name = 'tailings-pond-sprite-' .. i,
                filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/fluid-sheet.png',
                priority = 'extra-high',
                width = 171,
                height = 185,
                x = x,
                y = y
            }
            i = i + 1
        end
    end
    data:extend(pictures)
end

]]--

ENTITY{
    type = "storage-tank",
    name = "tailings-pond",
    icon = "__pycoalprocessinggraphics__/graphics/icons/tailings-pond.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.5, result = "tailings-pond"},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "storage-tank-explosion",
    collision_box = {{-8.9, -8.9}, {8.9, 8.9}},
    selection_box = {{-9, -9}, {9, 9}},
    fluid_box =
    {
      base_area = 1000,
      base_level = -1,
      pipe_covers = DATA.Pipes.covers(true, true, true, true),
      pipe_connections =
      {
        { position = {-9, -2.5} },
        { position = {9, 1.5} },
        { position = {9, 2.5} },
        { position = {-9, -1.5} }
      }
    },
    two_direction_only = false,
    window_bounding_box = {{-9, -9}, {9, 9}},
    pictures = {
        picture = {
            sheet = {
                filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/r.png',
                priority = 'high',
                frames = 1,
                width = 640,
                height = 704,
                shift = util.by_pixel(0, -32)
            }
        },
        fluid_background = {
            filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/f10.png',
            --priority = 'high',
            --frames = 1,
            width = 448,
            height = 352,
            --x = 448,
            --y = 352,
            shift = util.by_pixel(0, -0)
        },
        window_background = {
            filename = '__pycoalprocessinggraphics__/graphics/entity/tailings-pond/bowl.png',
            priority = 'low',
            --frames = 1,
            width = 640,
            height = 704,
            --x = 448,
            --y = 352,
            shift = util.by_pixel(0, -32)
        },
        flow_sprite = DATA.Sprites.empty_sprite(),
        gas_flow = DATA.Sprites.empty_animation()
    },
    flow_length_in_ticks = 360,
    vehicle_impact_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.65},
    open_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.15},
    close_sound = {filename = '__base__/sound/car-metal-impact.ogg', volume = 0.15},
    working_sound =
    {
      sound =
      {
          filename = "__base__/sound/storage-tank.ogg",
          volume = 0.6
      },
      match_volume_to_activity = true,
      audible_distance_modifier = 0.5,
      max_sounds_per_type = 3
    },
    circuit_wire_connection_points = {
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        },
        {
            shadow = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}},
            wire = {red = {2.546875, -2.4375}, green = {2.546875, -2.4375}}
        }
    },
    circuit_wire_max_distance = 9,
    circuit_connector_sprites = _G.circuit_connector_definitions['storage-tank'].sprites
  }
