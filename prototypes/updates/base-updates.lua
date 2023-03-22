local table = require('__stdlib__/stdlib/utils/table')
local py_utils = require "__pypostprocessing__.prototypes.functions.utils"

-- (( TECHNOLOGY ))--
TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):add_pack("military-science-pack")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack")
TECHNOLOGY("military-4"):remove_pack("utility-science-pack")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("rocket-fuel"):add_pack("military-science-pack"):remove_prereq("advanced-oil-processing"):remove_prereq("flammables")

TECHNOLOGY("rocket-control-unit"):add_pack("military-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("kovarex-enrichment-process"):add_pack("military-science-pack")

TECHNOLOGY("worker-robots-speed-3"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("worker-robots-speed-4"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("landfill"):remove_pack("logistic-science-pack"):remove_prereq("logistic-science-pack")

TECHNOLOGY("fluid-handling"):remove_pack("logistic-science-pack"):set_fields{prerequisites = {}}

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

TECHNOLOGY("energy-weapons-damage-5"):add_pack("production-science-pack")

TECHNOLOGY("energy-weapons-damage-6"):add_pack("production-science-pack")

TECHNOLOGY("energy-weapons-damage-7"):add_pack("production-science-pack")

TECHNOLOGY("weapon-shooting-speed-6"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-5"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-6"):add_pack("production-science-pack")

TECHNOLOGY("laser-shooting-speed-7"):add_pack("production-science-pack")

TECHNOLOGY("follower-robot-count-5"):add_pack("production-science-pack")

TECHNOLOGY("follower-robot-count-6"):add_pack("production-science-pack")

TECHNOLOGY("inserter-capacity-bonus-7"):add_pack("military-science-pack")

TECHNOLOGY("space-science-pack"):add_pack("military-science-pack")

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

TECHNOLOGY("mining-productivity-4"):add_pack("military-science-pack")

data.raw.technology.artillery.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1}
  }
data.raw.technology.artillery.prerequisites = {"military"}

data.raw.technology["artillery-shell-range-1"].unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1}
  }
data.raw.technology["artillery-shell-range-1"].prerequisites = {"artillery"}

data.raw.technology["artillery-shell-speed-1"].unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1}
  }
data.raw.technology["artillery-shell-speed-1"].prerequisites = {"artillery"}

data.raw.technology.tank.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1}
  }
data.raw.technology.tank.prerequisites = {}

data.raw.technology["uranium-ammo"].unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1},
    {"chemical-science-pack", 1}
  }
data.raw.technology["uranium-ammo"].prerequisites = {"military-2", "uranium-processing"}



TECHNOLOGY("concrete"):remove_prereq("automation-2")

-- Remove empty vanilla techs
TECHNOLOGY("electronics"):set_fields{enabled = false, hidden = true}

TECHNOLOGY("automation-2"):set_fields{prerequisites = {}}
TECHNOLOGY("rocket-control-unit"):set_fields{prerequisites = {}}

TECHNOLOGY("laser"):set_fields{enabled = false, hidden = true}
TECHNOLOGY("distractor"):set_fields{prerequisites = {}}

TECHNOLOGY("modules"):set_fields{enabled = false, hidden = true}
TECHNOLOGY("speed-module"):set_fields{prerequisites = {}}
TECHNOLOGY("productivity-module"):set_fields{prerequisites = {}}
TECHNOLOGY("effectivity-module"):set_fields{prerequisites = {}}

-- (( TECHNOLOGY DEPENDENCIES ))--

TECHNOLOGY("steel-axe"):set_fields{dependencies = {"steel-processing"}}

TECHNOLOGY("fast-inserter"):set_fields{dependencies = {"automation"}}:set_fields{prerequisites = {}}

TECHNOLOGY("military-2"):set_fields{dependencies = {"military"}}

TECHNOLOGY("gate"):set_fields{prerequisites = {"stone-wall"}}:remove_pack("logistic-science-pack")

TECHNOLOGY("automobilism"):remove_pack("logistic-science-pack"):set_fields{ prerequisites = {} }

TECHNOLOGY("engine"):remove_pack("logistic-science-pack"):set_fields{ prerequisites = {} }

TECHNOLOGY("heavy-armor"):set_fields{dependencies = {"military"}}

TECHNOLOGY("modular-armor"):set_fields{dependencies = {"heavy-armor"}}

TECHNOLOGY("power-armor"):set_fields{dependencies = {"modular-armor"}}

TECHNOLOGY("power-armor-mk2"):set_fields{dependencies = {"power-armor"}}

TECHNOLOGY("electric-energy-accumulators"):set_fields{dependencies = {"electric-energy-distribution-1"}}


TECHNOLOGY("logistic-science-pack"):set_fields{ prerequisites = {} }
TECHNOLOGY("chemical-science-pack"):set_fields{ prerequisites = {} }
TECHNOLOGY("military-science-pack"):set_fields{ prerequisites = {} }
TECHNOLOGY("production-science-pack"):set_fields{ prerequisites = {} }
TECHNOLOGY("utility-science-pack"):set_fields{ prerequisites = {} }
TECHNOLOGY("space-science-pack"):set_fields{ prerequisites = { "rocket-silo" } }


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
            {icon = "__pycoalprocessinggraphics__/graphics/technology/lab.png", icon_size = 128, scale = 0.8},
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

RECIPE("explosives"):remove_unlock("explosives"):set_fields{hidden = true}

RECIPE("battery"):remove_unlock("battery"):set_fields{hidden = true}

-- Recipe updates
RECIPE("flying-robot-frame"):remove_ingredient("electronic-circuit"):add_ingredient(
    {type = "item", name = "advanced-circuit", amount = 1})

RECIPE("flamethrower-ammo"):replace_ingredient("crude-oil", "light-oil")

RECIPE("rail"):clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient(
    {"treated-wood", 2}):add_ingredient({"steel-plate", 1})

RECIPE("landfill"):replace_ingredient("stone", {"stone", 30}):add_ingredient{"gravel", 30}:add_ingredient{"soil", 30}

--RECIPE("nuclear-fuel"):remove_unlock("kovarex-enrichment-process")

RECIPE("burner-inserter"):replace_ingredient("iron-plate", {type = "item", name = "iron-plate", amount = 5})
RECIPE("burner-inserter"):replace_ingredient("iron-gear-wheel", {type = "item", name = "iron-gear-wheel", amount = 2})

ITEM("rocket-fuel"):set_fields{fuel_category = "jerry"}

--data.raw.item["nuclear-fuel"].fuel_category = nil
--data.raw.item["nuclear-fuel"].fuel_value = nil

data.raw.item["wood"].fuel_category = "biomass"

-- add ash to burnt results for chemical fuel items
for i, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" and item.name ~= "active-carbon" then
        data.raw.item[item.name].burnt_result = "ash"
    end
end

for _, entity in py_utils.iter_prototypes("entity") do
    if entity.burner or (entity.energy_source and entity.energy_source.type == "burner") then
        local es = entity.burner or entity.energy_source

        if ((not es.fuel_categories and (es.fuel_category or "chemical") == "chemical")
            or (es.fuel_categories and table.any(es.fuel_categories, function (f) return f == "chemical" end)))
            and (es.burnt_inventory_size or 0) < 1
        then
            es.burnt_inventory_size = 1
        end
    end
end

RECIPE("artillery-wagon"):remove_unlock("artillery"):add_unlock("artillery-2")

RECIPE("artillery-targeting-remote"):remove_unlock("artillery"):add_unlock("artillery-2")

data.raw.item["nuclear-fuel"].burnt_result = nil

data.raw["gun"]["artillery-wagon-cannon"].attack_parameters.range = 2 * 32

ITEM("productivity-module"):set_fields{
    effect =
    {
      productivity = {bonus = 0.1},
      productivity = {bonus = 0.1},
      consumption = {bonus = 1},
      speed = {bonus = -0.25}
    }
}

ITEM("productivity-module-2"):set_fields{
    effect =
    {
      productivity = {bonus = 0.2},
      consumption = {bonus = 2},
      speed = {bonus = -0.5}
    }
}

ITEM("productivity-module-3"):set_fields{
    effect =
    {
      productivity = {bonus = 0.3},
      consumption = {bonus = 3},
      speed = {bonus = -0.75}
    }
}

ITEM("speed-module"):set_fields{
    effect = 
    {
        speed = {bonus = 0.4},
        consumption = {bonus = 1}
    }
}

ITEM("speed-module-2"):set_fields{
    effect = 
    {
        speed = {bonus = 0.6},
        consumption = {bonus = 1.5}
    }
}

ITEM("speed-module-3"):set_fields{
    effect = 
    {
        speed = {bonus = 1},
        consumption = {bonus = 2}
    }
}

--create A.M and F.M beacons

for am = 1, 10 do
    for fm = 1, 10 do
    local new_beacon = table.deepcopy(data.raw.beacon.beacon)
    new_beacon.name = "beacon-AM" .. am .."-FM" .. fm
    new_beacon.distribution_effectivity = 0.1 * am * fm
    new_beacon.energy_usage = 100 * am * (fm ^ 2) .. "kW"
    new_beacon.supply_area_distance = 11-am
    new_beacon.placeable_by = {item = "beacon-AM" .. am .."-FM" .. fm, count = 1}
    new_beacon.localised_name = {"entity-name.new-beacon",am,fm}
    data:extend{new_beacon}
    local new_beacon_item = table.deepcopy(data.raw.item.beacon)
    new_beacon_item.name = "beacon-AM" .. am .."-FM" .. fm
    new_beacon_item.place_result = "beacon-AM" .. am .."-FM" .. fm
    data:extend{new_beacon_item}
    end
end

--ITEM(beacon):set_fields{place_result = "beacon-AM1-FM1"}
data.raw.item.beacon.place_result = "beacon-AM1-FM1"

for b, beacon in pairs(data.raw.beacon) do
    log(beacon.name)
    log(beacon.distribution_effectivity)
    log(beacon.energy_usage)
    log(beacon.supply_area_distance)
    log("_____________")
end
