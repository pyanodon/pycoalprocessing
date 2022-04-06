-- (( TECHNOLOGY ))--
TECHNOLOGY("utility-science-pack"):add_pack("production-science-pack"):add_pack("military-science-pack")

TECHNOLOGY("destroyer"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("fusion-reactor-equipment"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("rocket-fuel"):add_pack("military-science-pack")

TECHNOLOGY("rocket-control-unit"):add_pack("military-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("kovarex-enrichment-process"):add_pack("military-science-pack")

TECHNOLOGY("worker-robots-speed-3"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("worker-robots-speed-4"):remove_pack("utility-science-pack"):add_pack("production-science-pack")

TECHNOLOGY("landfill"):remove_pack("logistic-science-pack")

TECHNOLOGY("fluid-handling"):remove_pack("logistic-science-pack")

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

TECHNOLOGY("artillery-shell-range-1"):add_pack("production-science-pack")

TECHNOLOGY("artillery-shell-speed-1"):add_pack("production-science-pack")

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

TECHNOLOGY("artillery"):add_pack("production-science-pack")

-- Remove empty vanilla techs
TECHNOLOGY("electronics"):set_fields{enabled = false, hidden = true}

TECHNOLOGY("laser"):set_fields{enabled = false, hidden = true}

TECHNOLOGY("modules"):set_fields{enabled = false, hidden = true}

-- (( TECHNOLOGY DEPENDENCIES ))--

TECHNOLOGY("fast-inserter"):set_fields{dependencies = {"automation"}}

TECHNOLOGY("military-2"):set_fields{dependencies = {"military"}}

TECHNOLOGY("gate"):set_fields{dependencies = {"military-2"}}

TECHNOLOGY("car"):set_fields{dependencies = {"logistics-2"}}

TECHNOLOGY("heavy-armor"):set_fields{dependencies = {"military"}}

TECHNOLOGY("modular-armor"):set_fields{dependencies = {"heavy-armor"}}

TECHNOLOGY("power-armor"):set_fields{dependencies = {"modular-armor"}}

TECHNOLOGY("power-armor-mk2"):set_fields{dependencies = {"power-armor"}}

TECHNOLOGY("electric-energy-accumulators"):set_fields{dependencies = {"electric-energy-distribution-1"}}

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

RECIPE("explosives"):remove_unlock("explosives")

RECIPE("battery"):remove_unlock("battery")

-- Recipe updates
RECIPE("flying-robot-frame"):remove_ingredient("electronic-circuit"):add_ingredient(
    {type = "item", name = "advanced-circuit", amount = 1})

RECIPE("flamethrower-ammo"):replace_ingredient("crude-oil", "light-oil")

RECIPE("rail"):clear_ingredients():add_ingredient({"stone", 1}):add_ingredient({"iron-stick", 2}):add_ingredient(
    {"treated-wood", 2})

-- add ash to burnt results for chemical fuel items
for i, item in pairs(data.raw.item) do
    if item.fuel_category ~= nil and item.fuel_category == "chemical" and item.name ~= "active-carbon" then
        data.raw.item[item.name].burnt_result = "ash"
    end
end
