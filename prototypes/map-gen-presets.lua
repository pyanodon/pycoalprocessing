local blacklist = {
    ["enemy-base"] = true,
    ["trees"] = true,
}

local rocks = {
    ["iron-rock"] = true,
    ["copper-rock"] = true,
    ["uranium-rock"] = true,
    ["zinc-rock"] = true,
    ["aluminium-rock"] = true,
    ["chromium-rock"] = true,
    ["coal-rock"] = true,
    ["lead-rock"] = true,
    ["nexelit-rock"] = true,
    ["nickel-rock"] = true,
    ["phosphate-rock-02"] = true,
    ["quartz-rock"] = true,
    ["salt-rock"] = true,
    ["tin-rock"] = true,
    ["titanium-rock"] = true,
    ["volcanic-pipe"] = true,
    ["regolites"] = true,
    ["rare-earth-bolide"] = true,
    ["phosphate-rock"] = true,
    ["sulfur-patch"] = true,
    ["geothermal-crack"] = true,
    -- Commented because only scales on size :shrug:
    -- ['bitumen-seep'] = true
}
--[[ if it comes up
local non_rocks = {
    ["iron-ore"] = true,
    ["copper-ore"] = true,
    ["stone"] = true,
    ["uranium-ore"] = true,
    ["borax"] = true,
    ["niobium"] = true,
    ["molybdenum-ore"] = true,
    ["ore-quartz"] = true,
    ["raw-coal"] = true,
    ["ore-aluminium"] = true,
    ["ore-chromium"] = true,
    ["ore-lead"] = true,
    ["ore-nickel"] = true,
    ["ore-tin"] = true,
    ["ore-titanium"] = true,
    ["ore-zinc"] = true,
    ["oil-sand"] = true,
    ["bitumen-seep"] = true,
    ["ore-bioreserve"] = true,
    ["ree"] = true,
    ["antimonium"] = true,
}
]] --



local mapgens = data.raw["map-gen-presets"]["default"]
mapgens["py-recommended"] = {
    order = "h",
    basic_settings = {
        autoplace_controls = {
            ["enemy-base"] = {
                frequency = 0
            },
            water = {frequency = 0.75, size = 0.75},
        },
        cliff_settings = {
            cliff_elevation_interval = 40 / 0.25,
            richness = 3
        },
        starting_area = mods["rso-mod"] and "normal" or 4
    },
    advanced_settings = {
        pollution = {
            enabled = false
        },
        enemy_evolution = {
            time_factor = 0.00000002,
            destroy_factor = 0.001,
            pollution_factor = 0
        },
        enemy_expansion = {
            enabled = true,
            max_expansion_distance = 2,            -- Creep only
            min_expansion_cooldown = 60 * 60 * 60, -- 60 min
            max_expansion_cooldown = 60 * 60 * 180 -- 180 min
        },
    }
}

local non_rock_values = {
    ["rich-resources"] = {
        richness = 2.0
    },
    ["rail-world"] = {
        frequency = 0.33,
        size = 3.0
    },
    ["py-recommended"] = {
        frequency = 0.33,
        richness = 4,
        size = 0.75
    },
    ["ribbon-world"] = {
        frequency = 3.0,
        size = 0.5,
        richness = 2.0
    }
}
local rock_values = {
    ["rich-resources"] = {
        richness = 2.0
    },
    ["rail-world"] = {
        frequency = 0.33,
        richness = 3.0
    },
    ["py-recommended"] = {
        frequency = 0.33,
        richness = 5
    },
    ["ribbon-world"] = {
        frequency = 3.0,
        richness = 1.0
    }
}

for name in pairs(data.raw["autoplace-control"]) do
    if blacklist[name] then goto continue end
    local is_rock = rocks[name]
    for preset_name, preset_data in pairs(mapgens) do
        local control = preset_data["basic_settings"] and preset_data["basic_settings"]["autoplace_controls"]
        -- If someone has already modified it, I see no reason to change it
        if control and not control[name] then
            control[name] = is_rock and rock_values[preset_name] or non_rock_values[preset_name]
        end
    end
    ::continue::
end
