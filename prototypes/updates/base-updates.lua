local resource_autoplace = require "resource-autoplace"
--TODO:look into ore gen for 2.0
--local noise = require 'noise'

-- (( TECHNOLOGY ))--
TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):add_pack("military-science-pack")
TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("military-4"):remove_pack("utility-science-pack")
--TODO:update fusion equipment/ fission equipment
--TECHNOLOGY('fission-reactor-equipment'):remove_pack('utility-science-pack'):add_pack('production-science-pack')
TECHNOLOGY("rocket-fuel"):add_pack("military-science-pack"):remove_prereq("advanced-oil-processing"):remove_prereq("flammables")
TECHNOLOGY("kovarex-enrichment-process"):add_pack("military-science-pack")
TECHNOLOGY("worker-robots-speed-3"):remove_pack("utility-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("worker-robots-speed-4"):remove_pack("utility-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("landfill"):remove_pack("logistic-science-pack"):remove_prereq("logistic-science-pack")
TECHNOLOGY("fluid-handling"):remove_pack("logistic-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("physical-projectile-damage-6"):add_pack("production-science-pack")
TECHNOLOGY("physical-projectile-damage-7"):add_pack("production-science-pack")
TECHNOLOGY("stronger-explosives-4"):add_pack("production-science-pack")
TECHNOLOGY("stronger-explosives-5"):add_pack("production-science-pack")
TECHNOLOGY("stronger-explosives-6"):add_pack("production-science-pack")
TECHNOLOGY("stronger-explosives-7"):add_pack("production-science-pack")
TECHNOLOGY("refined-flammables-4"):add_pack("production-science-pack")
TECHNOLOGY("refined-flammables-5"):add_pack("production-science-pack")
TECHNOLOGY("refined-flammables-6"):add_pack("production-science-pack")
TECHNOLOGY("refined-flammables-7"):add_pack("production-science-pack")
--TODO: ALL WEAPON DAMAGES NEED ADJUSTING
--[[
TECHNOLOGY('laser-weapons-damage-5'):add_pack('production-science-pack')
TECHNOLOGY('laser-weapons-damage-6'):add_pack('production-science-pack')
TECHNOLOGY('laser-weapons-damage-7'):add_pack('production-science-pack')
TECHNOLOGY('weapon-shooting-speed-6'):add_pack('production-science-pack')
TECHNOLOGY('laser-shooting-speed-5'):add_pack('production-science-pack')
TECHNOLOGY('laser-shooting-speed-6'):add_pack('production-science-pack')
TECHNOLOGY('laser-shooting-speed-7'):add_pack('production-science-pack')
]] --
--TODO: REVIEW FOLLER ROBOT TECHS
--[[
TECHNOLOGY('follower-robot-count-5'):add_pack('production-science-pack')
TECHNOLOGY('follower-robot-count-6'):add_pack('production-science-pack')
]] --
TECHNOLOGY("inserter-capacity-bonus-7"):add_pack("military-science-pack")
--TECHNOLOGY('space-science-pack'):add_pack('military-science-pack')
TECHNOLOGY("military-4"):add_pack("production-science-pack")
TECHNOLOGY("uranium-ammo"):add_pack("production-science-pack")
TECHNOLOGY("braking-force-6"):add_pack("military-science-pack")
TECHNOLOGY("braking-force-7"):add_pack("military-science-pack")
TECHNOLOGY("power-armor-mk2"):add_pack("production-science-pack")
TECHNOLOGY("rocket-silo"):add_pack("military-science-pack")
TECHNOLOGY("research-speed-6"):add_pack("military-science-pack")
TECHNOLOGY("logistic-system"):add_pack("military-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("worker-robots-speed-5"):add_pack("military-science-pack")
TECHNOLOGY("worker-robots-speed-6"):add_pack("military-science-pack")
TECHNOLOGY("worker-robots-storage-3"):add_pack("military-science-pack")
TECHNOLOGY("personal-roboport-mk2-equipment"):add_pack("military-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("mining-productivity-3"):add_pack("military-science-pack")

data.raw.technology["artillery-shell-range-1"].unit.count_formula = nil

data.raw.technology.artillery.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack",   1},
    {"chemical-science-pack",   1},
    {"military-science-pack",   1}
}
data.raw.technology.artillery.prerequisites = {"military"}

data.raw.technology["artillery-shell-speed-1"].unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack",   1},
    {"chemical-science-pack",   1},
    {"military-science-pack",   1}
}
data.raw.technology["artillery-shell-speed-1"].prerequisites = {"artillery"}

data.raw.technology.tank.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack",   1},
    {"chemical-science-pack",   1},
    {"military-science-pack",   1}
}
data.raw.technology.tank.prerequisites = {}

data.raw.technology["uranium-ammo"].unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack",   1},
    {"military-science-pack",   1},
    {"chemical-science-pack",   1}
}
data.raw.technology["uranium-ammo"].prerequisites = {"military-2", "uranium-processing"}

TECHNOLOGY("concrete"):remove_prereq("automation-2")
-- Remove empty vanilla techs
--TECHNOLOGY('electronics'):set_fields{enabled = false, hidden = true}
TECHNOLOGY("automation-2"):set_fields {prerequisites = {}}
TECHNOLOGY("laser"):set_fields {enabled = false, hidden = true}
TECHNOLOGY("distractor"):set_fields {prerequisites = {}}
TECHNOLOGY("modules"):set_fields {enabled = false, hidden = true}
TECHNOLOGY("speed-module"):set_fields {prerequisites = {}}
TECHNOLOGY("productivity-module"):set_fields {prerequisites = {}}
TECHNOLOGY("efficiency-module"):set_fields {prerequisites = {}}

-- (( TECHNOLOGY DEPENDENCIES ))--
--TECHNOLOGY('steel-axe'):set_fields{dependencies = {'steel-processing'}}
TECHNOLOGY("fast-inserter"):set_fields {dependencies = {"automation"}}:set_fields {prerequisites = {}}
TECHNOLOGY("military-2"):set_fields {dependencies = {"military"}}
TECHNOLOGY("gate"):set_fields {prerequisites = {"stone-wall"}}:remove_pack("logistic-science-pack")
TECHNOLOGY("automobilism"):remove_pack("logistic-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("engine"):remove_pack("logistic-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("heavy-armor"):set_fields {dependencies = {"military"}}
TECHNOLOGY("modular-armor"):set_fields {dependencies = {"heavy-armor"}}
TECHNOLOGY("power-armor"):set_fields {dependencies = {"modular-armor"}}
TECHNOLOGY("power-armor-mk2"):set_fields {dependencies = {"power-armor"}}
TECHNOLOGY("electric-energy-accumulators"):set_fields {dependencies = {"electric-energy-distribution-1"}}

TECHNOLOGY("logistic-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("chemical-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("military-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("production-science-pack"):set_fields {prerequisites = {}}
TECHNOLOGY("utility-science-pack"):set_fields {prerequisites = {}}
--TECHNOLOGY('space-science-pack'):set_fields{ prerequisites = { 'rocket-silo' } }

-- Technology icons
for i = 1, 6 do
    local tech = TECHNOLOGY("research-speed-" .. i)
    tech:set(
        "icons", {
            -- Base layer
            {
                icon = "__pycoalprocessinggraphics__/graphics/technology/energy-1.png",
                icon_size = 128,
                tint = {r = 0, g = 0, b = 0, a = 1}
            },
            -- Border
            {icon = "__pycoalprocessinggraphics__/graphics/technology/border.png", icon_size = 128},
            -- Lab
            {icon = "__pycoalprocessinggraphics__/graphics/technology/lab.png",    icon_size = 128, scale = 0.8},
            -- Speed icon
            {
                icon = "__core__/graphics/icons/technology/constants/constant-speed.png",
                icon_mipmaps = 3,
                icon_size = 128,
                scale = 0.5,
                shift = {50, 50}
            }
        })
    tech:set("icon_size", 128)
    tech:set("icon_mipmaps", nil)
end

-- Recipe unlocks
RECIPE("lubricant"):remove_unlock("lubricant")
RECIPE("explosives"):remove_unlock("explosives"):set_fields {hidden = true}
RECIPE("battery"):remove_unlock("battery"):set_fields {hidden = true}

-- Recipe updates
RECIPE("flying-robot-frame"):remove_ingredient("electronic-circuit"):add_ingredient {type = "item", name = "advanced-circuit", amount = 1}
RECIPE("flamethrower-ammo"):replace_ingredient("crude-oil", "light-oil")
RECIPE("rail"):clear_ingredients():add_ingredient {"stone", 1}:add_ingredient {"iron-stick", 2}:add_ingredient {"treated-wood", 2}:add_ingredient {"steel-plate", 1}
RECIPE("landfill"):replace_ingredient("stone", {"stone", 30}):add_ingredient {"gravel", 30}:add_ingredient {"soil", 30}
RECIPE("burner-inserter"):replace_ingredient("iron-plate", {type = "item", name = "iron-plate", amount = 5})
RECIPE("burner-inserter"):replace_ingredient("iron-gear-wheel", {type = "item", name = "iron-gear-wheel", amount = 2})
ITEM("rocket-fuel"):set_fields {fuel_category = "jerry"}

data.raw.item["wood"].fuel_category = "biomass"
data.raw.item["nuclear-fuel"].burnt_result = nil
-- add ash to burnt results for chemical fuel items
for i, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" and item.name ~= "active-carbon" then
        data.raw.item[item.name].burnt_result = "ash"
    end
end

for _, entity in py.iter_prototypes("entity") do
    if entity.burner or (entity.energy_source and entity.energy_source.type == "burner") then
        local es = entity.burner or entity.energy_source

        if ((not es.fuel_categories and (es.fuel_category or "chemical") == "chemical")
                or (es.fuel_categories and table.any(es.fuel_categories, function(f) return f == "chemical" end)))
            and (es.burnt_inventory_size or 0) < 1
        then
            es.burnt_inventory_size = 1
        end
    end
end

RECIPE("artillery-wagon"):remove_unlock("artillery"):add_unlock("artillery-2")
RECIPE("artillery-targeting-remote"):remove_unlock("artillery"):add_unlock("artillery-2")
data.raw["gun"]["artillery-wagon-cannon"].attack_parameters.range = 2 * 32

--update cannon and artillery shells to have gunpowder
RECIPE("cannon-shell"):remove_ingredient("explosives"):add_ingredient {type = "item", name = "gunpowder", amount = 10}

RECIPE {
    type = "recipe",
    name = "explosive-cannon-shell",
    category = "crafting",
    enabled = false,
    energy_required = 8,
    ingredients = {
        {type = "item", name = "cannon-shell", amount = 1},
        {type = "item", name = "explosives",   amount = 5},
    },
    results = {{type = "item", name = "explosive-cannon-shell", amount = 1}}
}

ITEM("productivity-module").effect = {
    productivity = 0.1,
    consumption = 1,
    speed = -0.25
}

ITEM("productivity-module-2").effect = {
    productivity = 0.2,
    consumption = 2,
    speed = -0.5
}

ITEM("productivity-module-3").effect = {
    productivity = 0.3,
    consumption = 3,
    speed = -0.75
}

ITEM("speed-module").effect = {
    speed = 0.4,
    consumption = 1
}

ITEM("speed-module-2").effect = {
    speed = 0.6,
    consumption = 1.5
}

ITEM("speed-module-3").effect = {
    speed = 1,
    consumption = 2
}

--[[
-- Bump vanilla ore richness to more closely resembly py ore amounts
for _, ore in pairs({'iron-ore', 'copper-ore', 'coal', 'stone', 'uranium-ore'}) do
    local resource = data.raw.resource[ore]
    if resource and resource.autoplace then
        -- Store the current probability expression
        local base_expression = noise.delimit_procedure(resource.autoplace.richness_expression)
        -- 2x within starting area
        resource.autoplace.richness_expression = noise.define_noise_function( function(x, y, tile, map)
            -- This is the hard-coded starting ore area value wube uses
            local starting_resource_placement_radius = 120
            local tier = noise.max(0.0, tile.distance - starting_resource_placement_radius) / starting_resource_placement_radius;
            -- 2x at start, 1.5x elsewhere
            return (2 - (noise.clamp(tier, 0, 1) / 2)) * base_expression
        end)
    end
end
]] --

local rail_ramp = RECIPE("rail-ramp")
if rail_ramp then
    rail_ramp:add_ingredient {"solder", 10}
    rail_ramp:add_ingredient {"bolts", 10}
    rail_ramp:add_ingredient {"intermetallics", 10}
end
local rail_support = RECIPE("rail-support")
if rail_support then
    rail_support:add_ingredient {"solder", 10}
    rail_support:add_ingredient {"bolts", 10}
    rail_support:add_ingredient {"intermetallics", 10}
end

if data.raw.technology["elevated-rail"] then
    local elevated_rails_tech = TECHNOLOGY("elevated-rail")
    elevated_rails_tech:remove_pack("production-science-pack")
    elevated_rails_tech:remove_pack("chemical-science-pack")
    elevated_rails_tech:remove_prereq("production-science-pack")
    elevated_rails_tech:add_prereq("automated-rail-transportation")
end

TECHNOLOGY("fluid-wagon"):remove_pack("logistic-science-pack")
TECHNOLOGY("automated-rail-transportation"):remove_pack("logistic-science-pack")

data.raw.pump.pump.pumping_speed = data.raw.pump.pump.pumping_speed * 10

table.insert(data.raw["technology"]["steam-power"].effects, table.remove(data.raw.technology["circuit-network"].effects, 1))

local tech_that_unlocks_fluid_mining = data.raw.technology["mining-with-fluid"] or data.raw.technology["steam-power"]
table.insert(tech_that_unlocks_fluid_mining.effects, {
    type = "mining-with-fluid",
    modifier = true
})

data.raw.recipe["engine-unit"].category = "crafting"

RECIPE("selector-combinator"):remove_ingredient("advanced-circuit"):add_ingredient {"electronic-circuit", 5}
TECHNOLOGY("advanced-combinators").unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack",   1},
}
TECHNOLOGY("advanced-combinators").prerequisites = mods.pyrawores and {"circuit-network", "solder-mk02"} or {"circuit-network"}
if mods.pyrawores then
    RECIPE("selector-combinator"):add_ingredient {type = "fluid", name = "molten-solder", amount = 10}.category = "crafting-with-fluid"
end

data.raw.recipe["iron-stick"].enabled = true

local starting_techs = {
    "automation",
    "coal-processing-1",
    "gun-turret",
    "soil-washing",
    "stone-wall",
}

for _, t in pairs(starting_techs) do
    t = data.raw.technology[t]
    if t then t.prerequisites = {"automation-science-pack"} end
    ::continue::
end

data.raw.technology["automation-science-pack"].prerequisites = {"steam-power"}
data.raw.technology["steam-power"].research_trigger = {type = "craft-item", item = "iron-plate", count = 10}
data.raw.technology["automation-science-pack"].research_trigger = {type = "craft-item", item = "copper-plate", count = 10}

RECIPE("flora-collector-mk01"):add_unlock("automation-science-pack").enabled = false
RECIPE("lab"):add_unlock("automation-science-pack").enabled = false
RECIPE("planter-box"):add_unlock("automation-science-pack").enabled = false
RECIPE("empty-planter-box"):add_unlock("automation-science-pack").enabled = false
RECIPE("soil-extractor-mk01"):add_unlock("automation-science-pack").enabled = false
RECIPE("soil"):add_unlock("automation-science-pack").enabled = false
RECIPE("wpu"):add_unlock("automation-science-pack").enabled = false
RECIPE("log-wood").enabled = true

RECIPE("poorman-wood-fence"):add_unlock("stone-wall").enabled = false
RECIPE("small-electric-pole"):add_unlock("steam-power").enabled = false
RECIPE("copper-cable").enabled = true
RECIPE("automation-science-pack").enabled = false

RECIPE("iron-chest"):add_unlock("automation").enabled = false

RECIPE("lab"):remove_ingredient("electronic-circuit")

data.raw.technology["electronics"].research_trigger = nil
data.raw.technology["electronics"].unit = {
    count = 10,
    ingredients = {
        {"automation-science-pack", 1}
    },
    time = 30
}

local cargo_landing_pad = RECIPE("cargo-landing-pad"):remove_ingredient("processing-unit"):add_ingredient {"advanced-circuit", 100}:remove_ingredient("steel-plate"):add_ingredient {"steel-plate", 500}
if mods.pyalienlife then
    cargo_landing_pad:add_ingredient {"py-warehouse-buffer", 1}:add_ingredient {"titanium-plate", 500}
end
if mods.pyalternativeenergy then
    cargo_landing_pad:add_ingredient {"mechanical-parts-02", 2}
end
