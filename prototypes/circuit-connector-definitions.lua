-- Adds circuit connection definitions for PyCP entities to the pre-existing global table
-- for base-game implementation details, see https://github.com/wube/factorio-data/blob/ed3d12197fbbe63fcd19c0eb23bc826cea44410f/core/lualib/circuit-connector-sprites.lua#L101
-- variation counts from 0 (Python-like).

circuit_connector_definitions["borax-mine-mkxx"] = circuit_connector_definitions.create_vector
    (
        universal_connector_template,
        { --Directions are up, right, down, left.
            {variation = 15, main_offset = util.by_pixel(-53, 26), shadow_offset = util.by_pixel(-40, 86), show_shadow = true},
            {variation = 15, main_offset = util.by_pixel(-53, 26), shadow_offset = util.by_pixel(-40, 86), show_shadow = true},
            {variation = 15, main_offset = util.by_pixel(-53, 26), shadow_offset = util.by_pixel(-40, 86), show_shadow = true},
            {variation = 15, main_offset = util.by_pixel(-53, 26), shadow_offset = util.by_pixel(-40, 86), show_shadow = true},
        }
    )

circuit_connector_definitions["niobium-mine"] = circuit_connector_definitions.create_vector
    (
        universal_connector_template,
        { --Directions are up, right, down, left.
            {variation = 23, main_offset = util.by_pixel(-90, -4), shadow_offset = util.by_pixel(-84, 0), show_shadow = true},
            {variation = 23, main_offset = util.by_pixel(-90, -4), shadow_offset = util.by_pixel(-84, 0), show_shadow = true},
            {variation = 23, main_offset = util.by_pixel(-90, -4), shadow_offset = util.by_pixel(-84, 0), show_shadow = true},
            {variation = 23, main_offset = util.by_pixel(-90, -4), shadow_offset = util.by_pixel(-84, 0), show_shadow = true},
        }
    )

circuit_connector_definitions["tailings-pond"] = circuit_connector_definitions.create_vector
    (
        universal_connector_template,
        { --Directions are horizontal in/outputs, vertical in/outputs.
            --Remaining orientations are not used, but required to give the data the correct shape.
            {variation = 7, main_offset = {-4.2, 3.6}, shadow_offset = {-3.25, 5}, show_shadow = true},
            {variation = 7, main_offset = {-4.2, 3.6}, shadow_offset = {-3.25, 5}, show_shadow = true},
            {variation = 7, main_offset = {-4.2, 3.6}, shadow_offset = {-3.25, 5}, show_shadow = true},
            {variation = 7, main_offset = {-4.2, 3.6}, shadow_offset = {-3.25, 5}, show_shadow = true},
        }
    )

circuit_connector_definitions["lab"] = circuit_connector_definitions.create_single(
        universal_connector_template,
        { variation = 26, main_offset = util.by_pixel( 53.625, -178.25), shadow_offset = {4, -.45}, show_shadow = true }
    )

circuit_connector_definitions["adv-foundry"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {2.5, 1.2}, shadow_offset = {3, 2.5}, show_shadow = false},
            {variation = 2, main_offset = {2.5, 1.2}, shadow_offset = {3, 2.5}, show_shadow = false},
            {variation = 2, main_offset = {2.5, 1.2}, shadow_offset = {3, 2.5}, show_shadow = false},
            {variation = 2, main_offset = {2.5, 1.2}, shadow_offset = {3, 2.5}, show_shadow = false},
        }
)

circuit_connector_definitions["automated-factory"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 26, main_offset = {-0.15, 1.35}, shadow_offset = {.6, 2.1}, show_shadow = false},
            {variation = 26, main_offset = {-0.15, 1.35}, shadow_offset = {.6, 2.1}, show_shadow = false},
            {variation = 26, main_offset = {-0.15, 1.35}, shadow_offset = {.6, 2.1}, show_shadow = false},
            {variation = 26, main_offset = {-0.15, 1.35}, shadow_offset = {.6, 2.1}, show_shadow = false},
        }
)

circuit_connector_definitions["ball-mill"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 23, main_offset = {1.25, 1.25}, shadow_offset = {2, 1.5}, show_shadow = false},
            {variation = 23, main_offset = {1.25, 1.25}, shadow_offset = {2, 1.5}, show_shadow = false},
            {variation = 23, main_offset = {1.25, 1.25}, shadow_offset = {2, 1.5}, show_shadow = false},
            {variation = 23, main_offset = {1.25, 1.25}, shadow_offset = {2, 1.5}, show_shadow = false},
        }
)

circuit_connector_definitions["botanical-nursery"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 23, main_offset = {1, 2.5}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 23, main_offset = {1, 2.5}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 23, main_offset = {1, 2.5}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 23, main_offset = {1, 2.5}, shadow_offset = {1, 2.5}, show_shadow = false},
        }
)

circuit_connector_definitions["carbon-filter"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 7, main_offset = {-1.8, 1.9}, shadow_offset = {-1.75, 2.1}, show_shadow = false},
            {variation = 1, main_offset = {2.05, 1.8}, shadow_offset = {2.1, 2.0}, show_shadow = true},
            {variation = 7, main_offset = {-1.8, 1.9}, shadow_offset = {-1.75, 2.1}, show_shadow = false},
            {variation = 1, main_offset = {2.05, 1.8}, shadow_offset = {2.1, 2.0}, show_shadow = true},
        }
)

circuit_connector_definitions["chemical-plant"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 27, main_offset = {-0.8, -0.2}, shadow_offset = {1.2, 2}, show_shadow = false},
            {variation = 27, main_offset = {-0.8, -0.2}, shadow_offset = {1.2, 2}, show_shadow = false},
            {variation = 27, main_offset = {-0.8, -0.2}, shadow_offset = {1.2, 2}, show_shadow = false},
            {variation = 27, main_offset = {-0.8, -0.2}, shadow_offset = {1.2, 2}, show_shadow = false},
        }
)

circuit_connector_definitions["classifier"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 26, main_offset = {0, -1.35}, shadow_offset = {1.2, 1}, show_shadow = false},
            {variation = 26, main_offset = {0, -1.35}, shadow_offset = {1.2, 1}, show_shadow = false},
            {variation = 26, main_offset = {0, -1.35}, shadow_offset = {1.2, 1}, show_shadow = false},
            {variation = 26, main_offset = {0, -1.35}, shadow_offset = {1.2, 1}, show_shadow = false},
        }
)

circuit_connector_definitions["co2-absorber"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 35, main_offset = {-1.7, -0.1}, shadow_offset = {-.4, .5}, show_shadow = false},
            {variation = 35, main_offset = {-1.7, -0.1}, shadow_offset = {-.4, .5}, show_shadow = false}, --unused
            {variation = 35, main_offset = {-1.7, -0.1}, shadow_offset = {-.4, .5}, show_shadow = false}, --unused
            {variation = 35, main_offset = {-1.7, -0.1}, shadow_offset = {-.4, .5}, show_shadow = false}, --unused
        }
)

circuit_connector_definitions["cooling-tower-mk1"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 9, main_offset = {-.8, -1}, shadow_offset = {-.2, -.2}, show_shadow = false},
            {variation = 9, main_offset = {-.8, -1}, shadow_offset = {-.2, -.2}, show_shadow = false},
            {variation = 9, main_offset = {-.8, -1}, shadow_offset = {-.2, -.2}, show_shadow = false},
            {variation = 9, main_offset = {-.8, -1}, shadow_offset = {-.2, -.2}, show_shadow = false},
        }
)

circuit_connector_definitions["cooling-tower-mk2"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 17, main_offset = {-1.2, -.5}, shadow_offset = {0, .5}, show_shadow = false},
            {variation = 17, main_offset = {-1.2, -.5}, shadow_offset = {0, .5}, show_shadow = false},
            {variation = 17, main_offset = {-1.2, -.5}, shadow_offset = {0, .5}, show_shadow = false},
            {variation = 17, main_offset = {-1.2, -.5}, shadow_offset = {0, .5}, show_shadow = false},
        }
)

circuit_connector_definitions["desulfurizator-unit"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {1.4, .9}, shadow_offset = {2, .5}, show_shadow = false},
            {variation = 6, main_offset = {-1.1, 1.1}, shadow_offset = {-.5, .7}, show_shadow = false},
            {variation = 2, main_offset = {1.4, .9}, shadow_offset = {2, .5}, show_shadow = false},
            {variation = 6, main_offset = {-1.1, 1.1}, shadow_offset = {-.5, .7}, show_shadow = false},
        }
)

circuit_connector_definitions["distilator"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 25, main_offset = {.5, .4}, shadow_offset = {2.5, 2}, show_shadow = false},
            {variation = 25, main_offset = {.5, .4}, shadow_offset = {2.5, 2}, show_shadow = false},
            {variation = 25, main_offset = {.5, .4}, shadow_offset = {2.5, 2}, show_shadow = false},
            {variation = 25, main_offset = {.5, .4}, shadow_offset = {2.5, 2}, show_shadow = false},
        }
)

circuit_connector_definitions["evaporator"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {1, 1.5}, shadow_offset = {1.5, 1.75}, show_shadow = false},
            {variation = 2, main_offset = {-1, 1.5}, shadow_offset = {-.5, 1.75}, show_shadow = false},
            {variation = 2, main_offset = {1, 1.5}, shadow_offset = {1.5, 1.75}, show_shadow = false},
            {variation = 2, main_offset = {-1, 1.5}, shadow_offset = {-.5, 1.75}, show_shadow = false},
        }
)

--fawogae-plantation connector
local redled = {
    filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
    priority = "low",
    width = 48,
    height = 46,
    shift = {0.53, -.95},
    draw_as_glow = true,
    scale = 0.5,
    line_length = 8
}

local greenled = {
    filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
    priority = "low",
    width = 48,
    height = 46,
    shift = {0.53, -.95},
    draw_as_glow = true,
    scale = 0.5,
    line_length = 8
}

local blueled = {
    filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
    priority = "low",
    width = 60,
    height = 60,
    shift = {0.69, -0.8},
    draw_as_glow = true,
    scale = 0.5,
    line_length = 8
}

local boffled = {
    filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
    priority = "low",
    width = 46,
    height = 44,
    shift = {0.69, -0.8},
    draw_as_glow = true,
    scale = 0.5,
    line_length = 8
}

local lightled = {
    intensity = 0.8,
    size = 0.9
}

local sprites = {
    led_red = redled, led_green = greenled, led_blue = blueled, led_blue_off = boffled, led_light = lightled,
    blue_led_light_offset = {0.69, -0.8},
    red_green_led_light_offset = {0.53, -.95},
}

local points = {
    wire = {
        red = {0.33, -1.4},
        green = {0.33, -1.3}
    },
    shadow = {
        red = {0.5, -1},
        green = {0.45, -1}
    }
}

circuit_connector_definitions["fawogae-plantation"] = {
    {
        sprites = sprites,
        points = points
    },
    {
        sprites = sprites,
        points = points
    },
    {
        sprites = sprites,
        points = points
    },
    {
        sprites = sprites,
        points = points
    }
}

circuit_connector_definitions["fluid-separator"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 25, main_offset = {1.5, 0}, shadow_offset = {3, 1.5}, show_shadow = true},
            {variation = 25, main_offset = {1.5, 0}, shadow_offset = {3, 1.5}, show_shadow = true},
            {variation = 25, main_offset = {1.5, 0}, shadow_offset = {3, 1.5}, show_shadow = true},
            {variation = 25, main_offset = {1.5, 0}, shadow_offset = {3, 1.5}, show_shadow = true},
        }
)

circuit_connector_definitions["fts-reactor"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 17, main_offset = {-3, -1}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 17, main_offset = {-3, -1}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 17, main_offset = {-3, -1}, shadow_offset = {1, 2.5}, show_shadow = false},
            {variation = 17, main_offset = {-3, -1}, shadow_offset = {1, 2.5}, show_shadow = false},
        }
)

circuit_connector_definitions["gasifier"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {-2.1, 2.2}, shadow_offset = {-1, 3.5}, show_shadow = false},
            {variation = 2, main_offset = {-2.1, 2.2}, shadow_offset = {-1, 3.5}, show_shadow = false},
            {variation = 2, main_offset = {-2.1, 2.2}, shadow_offset = {-1, 3.5}, show_shadow = false},
            {variation = 2, main_offset = {-2.1, 2.2}, shadow_offset = {-1, 3.5}, show_shadow = false},
        }
)

circuit_connector_definitions["glassworks"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 32, main_offset = {-1.9, -.25}, shadow_offset = {-1, .25}, show_shadow = false},
            {variation = 32, main_offset = {-1.9, -.25}, shadow_offset = {-1, .25}, show_shadow = false},
            {variation = 32, main_offset = {-1.9, -.25}, shadow_offset = {-1, .25}, show_shadow = false},
            {variation = 32, main_offset = {-1.9, -.25}, shadow_offset = {-1, .25}, show_shadow = false},
        }
)

circuit_connector_definitions["ground-borer"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 7, main_offset = {1.3, -3.7}, shadow_offset = {3.5, -1}, show_shadow = false},
            {variation = 7, main_offset = {1.3, -3.7}, shadow_offset = {3.5, -1}, show_shadow = false},
            {variation = 7, main_offset = {1.3, -3.7}, shadow_offset = {3.5, -1}, show_shadow = false},
            {variation = 7, main_offset = {1.3, -3.7}, shadow_offset = {3.5, -1}, show_shadow = false},
        }
)

circuit_connector_definitions["hpf"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 11, main_offset = {2, .6}, shadow_offset = {3, 1.5}, show_shadow = false},
            {variation = 11, main_offset = {2, .6}, shadow_offset = {3, 1.5}, show_shadow = false},
            {variation = 11, main_offset = {2, .6}, shadow_offset = {3, 1.5}, show_shadow = false},
            {variation = 11, main_offset = {2, .6}, shadow_offset = {3, 1.5}, show_shadow = false},
        }
)

circuit_connector_definitions["methanol-reactor"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 17, main_offset = {-2.1, 1.2}, shadow_offset = {-1.5, 2}, show_shadow = false},
            {variation = 17, main_offset = {-2.1, 1.2}, shadow_offset = {-1.5, 2}, show_shadow = false},
            {variation = 17, main_offset = {-2.1, 1.2}, shadow_offset = {-1.5, 2}, show_shadow = false},
            {variation = 17, main_offset = {-2.1, 1.2}, shadow_offset = {-1.5, 2}, show_shadow = false},
        }
)

circuit_connector_definitions["mukmoux-pasture"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 1, main_offset = {-3.1, -4.5}, shadow_offset = {-2.4, -4}, show_shadow = false},
            {variation = 1, main_offset = {-3.1, -4.5}, shadow_offset = {-2.4, -4}, show_shadow = false},
            {variation = 1, main_offset = {-3.1, -4.5}, shadow_offset = {-2.4, -4}, show_shadow = false},
            {variation = 1, main_offset = {-3.1, -4.5}, shadow_offset = {-2.4, -4}, show_shadow = false},
        }
)

circuit_connector_definitions["olefin-plant"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {-.5, 1.9}, shadow_offset = {1, 3}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.9}, shadow_offset = {1, 3}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.9}, shadow_offset = {1, 3}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.9}, shadow_offset = {1, 3}, show_shadow = false},
        }
)

circuit_connector_definitions["power-house"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 25, main_offset = {1.8, 0}, shadow_offset = {3, .8}, show_shadow = false},
            {variation = 25, main_offset = {1.8, 0}, shadow_offset = {3, .8}, show_shadow = false},
            {variation = 25, main_offset = {1.8, 0}, shadow_offset = {3, .8}, show_shadow = false},
            {variation = 25, main_offset = {1.8, 0}, shadow_offset = {3, .8}, show_shadow = false},
        }
)

circuit_connector_definitions["quenching-tower"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {-1.4, -.4}, shadow_offset = {-.25, .4}, show_shadow = false},
            {variation = 2, main_offset = {-1.4, -.4}, shadow_offset = {-.25, .4}, show_shadow = false},
            {variation = 2, main_offset = {-1.4, -.4}, shadow_offset = {-.25, .4}, show_shadow = false},
            {variation = 2, main_offset = {-1.4, -.4}, shadow_offset = {-.25, .4}, show_shadow = false},
        }
)

circuit_connector_definitions["ralesia-plantation"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 25, main_offset = {-2.3, 2.35}, shadow_offset = {-2.3, 2.45}, show_shadow = true},
            {variation = 25, main_offset = {-2.3, 2.35}, shadow_offset = {-2.3, 2.45}, show_shadow = true},
            {variation = 25, main_offset = {-2.3, 2.35}, shadow_offset = {-2.3, 2.45}, show_shadow = true},
            {variation = 25, main_offset = {-2.3, 2.35}, shadow_offset = {-2.3, 2.45}, show_shadow = true},
        }
)

circuit_connector_definitions["rectisol"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 25, main_offset = {1.6, 1}, shadow_offset = {2.8, 2}, show_shadow = false},
            {variation = 25, main_offset = {1.6, 1}, shadow_offset = {2.8, 2}, show_shadow = false},
            {variation = 25, main_offset = {1.6, 1}, shadow_offset = {2.8, 2}, show_shadow = false},
            {variation = 25, main_offset = {1.6, 1}, shadow_offset = {2.8, 2}, show_shadow = false},
        }
)

circuit_connector_definitions["sand-extractor"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 1, main_offset = {1, -2.4}, shadow_offset = {1.2, -2.2}, show_shadow = false},
            {variation = 1, main_offset = {1, -2.4}, shadow_offset = {1.2, -2.2}, show_shadow = false},
            {variation = 1, main_offset = {1, -2.4}, shadow_offset = {1.2, -2.2}, show_shadow = false},
            {variation = 1, main_offset = {1, -2.4}, shadow_offset = {1.2, -2.2}, show_shadow = false},
        }
)

circuit_connector_definitions["soil-extractor"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 8, main_offset = {-.2, -1}, shadow_offset = {1.5, 1.5}, show_shadow = false},
            {variation = 8, main_offset = {-.2, -1}, shadow_offset = {1.5, 1.5}, show_shadow = false},
            {variation = 8, main_offset = {-.2, -1}, shadow_offset = {1.5, 1.5}, show_shadow = false},
            {variation = 8, main_offset = {-.2, -1}, shadow_offset = {1.5, 1.5}, show_shadow = false},
        }
)

circuit_connector_definitions["solid-seperator"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 1, main_offset = {1.4, -.7}, shadow_offset = {1.7, .7}, show_shadow = false},
            {variation = 1, main_offset = {1.4, -.7}, shadow_offset = {1.7, .7}, show_shadow = false},
            {variation = 1, main_offset = {1.4, -.7}, shadow_offset = {1.7, .7}, show_shadow = false},
            {variation = 1, main_offset = {1.4, -.7}, shadow_offset = {1.7, .7}, show_shadow = false},
        }
)

circuit_connector_definitions["tar-processing-unit"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {.6, -.05}, shadow_offset = {1.5, 1.66}, show_shadow = false},
            {variation = 2, main_offset = {.6, -.05}, shadow_offset = {1.5, 1.66}, show_shadow = false},
            {variation = 2, main_offset = {.6, -.05}, shadow_offset = {1.5, 1.66}, show_shadow = false},
            {variation = 2, main_offset = {.6, -.05}, shadow_offset = {1.5, 1.66}, show_shadow = false},
        }
)

circuit_connector_definitions["ulric-corral"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 26, main_offset = {1.6, -2.5}, shadow_offset = {1.8, -2.2}, show_shadow = false},
            {variation = 26, main_offset = {1.6, -2.5}, shadow_offset = {1.8, -2.2}, show_shadow = false},
            {variation = 26, main_offset = {1.6, -2.5}, shadow_offset = {1.8, -2.2}, show_shadow = false},
            {variation = 26, main_offset = {1.6, -2.5}, shadow_offset = {1.8, -2.2}, show_shadow = false},
        }
)

circuit_connector_definitions["washer"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {.2, 2}, shadow_offset = {.6, 2.3}, show_shadow = false},
            {variation = 2, main_offset = {.2, 2}, shadow_offset = {.6, 2.3}, show_shadow = false},
            {variation = 2, main_offset = {.2, 2}, shadow_offset = {.6, 2.3}, show_shadow = false},
            {variation = 2, main_offset = {.2, 2}, shadow_offset = {.6, 2.3}, show_shadow = false},
        }
)

circuit_connector_definitions["wpu"] = circuit_connector_definitions.create_vector(
        universal_connector_template,
        {
            {variation = 2, main_offset = {-.5, 1.6}, shadow_offset = {0, 2.6}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.6}, shadow_offset = {0, 2.6}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.6}, shadow_offset = {0, 2.6}, show_shadow = false},
            {variation = 2, main_offset = {-.5, 1.6}, shadow_offset = {0, 2.6}, show_shadow = false},
        }
)